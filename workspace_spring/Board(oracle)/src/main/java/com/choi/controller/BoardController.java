package com.choi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.tools.sjavac.Log;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/board/*")
@Controller
@Slf4j
public class BoardController {
    @GetMapping("/list")
    public void boardListGET() {
        
    	
    }

    @GetMapping("/enroll")
    public void boardEnrollGET() {
        
    }
}
