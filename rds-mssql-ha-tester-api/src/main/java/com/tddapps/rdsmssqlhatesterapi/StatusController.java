package com.tddapps.rdsmssqlhatesterapi;

import org.joda.time.DateTime;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StatusController {

    @RequestMapping("/")
    public String Index(){
        return "OK! " + new DateTime().toString();
    }

    @PostMapping("/check1")
    public String CheckDatabase1(){
        return "OK " + new DateTime().toString();
    }
}
