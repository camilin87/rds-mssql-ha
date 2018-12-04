use master;
go;

IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'accounts')
  create database accounts
go;

use accounts;
go;

drop table if exists tb_accounts;
go;

create table tb_accounts(
  id int IDENTITY(1,1) PRIMARY KEY,
  name varchar(255)
);
go;

declare @now varchar(300);
WHILE ( SELECT count(*) FROM tb_accounts) < $3000000
BEGIN
    set @now = convert(varchar(25), getdate(), 120);

    insert into tb_accounts(name)
    values
      (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now),
      (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now),
      (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now),
      (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now),
      (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now),
      (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now),
      (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now),
      (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now),
      (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now),
      (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now),
      (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now), (@now)
    ;
END
go;

select count(*) from tb_accounts;
go;

select top 1 * from tb_accounts order by id desc;
go;