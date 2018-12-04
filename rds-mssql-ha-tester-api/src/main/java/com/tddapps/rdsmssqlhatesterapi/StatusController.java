package com.tddapps.rdsmssqlhatesterapi;

import lombok.val;
import org.joda.time.DateTime;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.DriverManager;
import java.sql.SQLException;

@RestController
public class StatusController {

    @RequestMapping("/")
    public String Index(){
        return CheckDatabase1();
    }

    @PostMapping("/check1")
    public String CheckDatabase1(){
        val connectionString = BuildConnectionString(1);
        return CheckDatabase(connectionString);
    }

    @PostMapping("/check2")
    public String CheckDatabase2(){
        val connectionString = BuildConnectionString(2);
        return CheckDatabase(connectionString);
    }

    private static String BuildConnectionString(int connectionStringNumber){
        val connectionSettingName = String.format("RDS_MSSQL_HA_DB_URL_%d", connectionStringNumber);

        val endpoint = System.getenv(connectionSettingName);
        val username = System.getenv("RDS_MSSQL_HA_DB_USERNAME");
        val password  = System.getenv("RDS_MSSQL_HA_DB_PASSWORD");

        return BuildConnectionString(endpoint, username, password);
    }

    private static String BuildConnectionString(String endpoint, String username, String password){
        return String.format("jdbc:sqlserver://%s;databaseName=accounts;user=%s;password=%s;", endpoint, username, password);
    }

    private static String CheckDatabase(String connectionString){
        var recordCount = -1;
        var lastDbDate = "";

        try (val con = DriverManager.getConnection(connectionString); val stmt = con.createStatement()) {
            stmt.execute("insert into tb_accounts(name) values (convert(varchar(25), getdate(), 120))");

            val rs1 = stmt.executeQuery("SELECT count(*) FROM tb_accounts;");
            rs1.next();
            recordCount = rs1.getInt(1);

            val rs2 = stmt.executeQuery("select top 1 name from tb_accounts order by id desc");
            rs2.next();
            lastDbDate = rs2.getString(1);
        }
        catch (SQLException e) {
            return String.format("ERROR: %s", e.getMessage());
        }

        return String.format("OK! ServerDate: %s, RecordCount: %d, DBDate: %s", new DateTime().toString(), recordCount, lastDbDate);
    }
}
