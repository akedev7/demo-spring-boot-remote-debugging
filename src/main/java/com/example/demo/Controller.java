package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class Controller {

    @GetMapping(path = "/test")
    public Integer getSomething(@RequestParam Integer value) {
        int result = value;

        // Simulate CPU-intensive work
        for (int i = 0; i < 100000; i++) {
            result += (int) Math.sqrt(i % 1000);
        }

        // Add a sleep to allow time for thread dump
        try {
            Thread.sleep(5000); // Sleep for 5 seconds
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt(); // Restore interrupted status
        }

        return result;
    }
}
