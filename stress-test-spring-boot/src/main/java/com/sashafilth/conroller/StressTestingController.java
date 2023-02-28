package com.sashafilth.conroller;

import com.sashafilth.dao.User;
import com.sashafilth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/test-users")
public class StressTestingController {

    private final UserService userService;

    @Autowired
    public StressTestingController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping(consumes = "application/json")
    public ResponseEntity addUser(@RequestParam int count, @RequestBody User user) {
        userService.addUser(user, count);
        return new ResponseEntity(HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<List<User>> findUsers(@RequestParam int size) {
        List<User> users = userService.findUsers(PageRequest.of(0, size));
        return new ResponseEntity<>(users, HttpStatus.OK);
    }
}
