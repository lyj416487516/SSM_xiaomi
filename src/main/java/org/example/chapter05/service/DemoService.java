package org.example.chapter05.service;

import org.springframework.stereotype.Service;

@Service
public class DemoService {
    public String saySomething() {
        return "hello";
    }
}