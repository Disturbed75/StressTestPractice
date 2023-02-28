package com.sashafilth.service;

import com.mongodb.MongoException;
import com.sashafilth.dao.User;
import com.sashafilth.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;


@Service
public class UserService {

    private final Logger logger = LoggerFactory.getLogger(UserService.class);
    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void addUser(User user, int count) {
        try {
            List<User> users = prepareUserList(user, count);
            userRepository.saveAll(users);
        } catch (MongoException e) {
            logger.error("Save users error ", e);
        }
    }

    public List<User> findUsers(Pageable request) {
        try {
            Page<User> userPage = userRepository.findAll(request);
            return userPage.stream().collect(Collectors.toList());
        } catch (MongoException e) {
            logger.error("Find users error ", e);
            return Collections.emptyList();
        }
    }

    private List<User> prepareUserList(User user, int count) {
        List<User> users = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            users.add(user);
        }
        return users;
    }
}
