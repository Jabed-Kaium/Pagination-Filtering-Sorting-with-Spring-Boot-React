package com.pagination.Service;

import com.pagination.Model.User;
import com.pagination.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    //Get all data
    public List<User> getAll() {
        return userRepository.findAll();
    }

    //Get data with pagination
    public Page<User> getUserWithPagination(int pageNumber, int pageSize) {
        Pageable page = PageRequest.of(pageNumber, pageSize);
        Page<User> pageUser = userRepository.findAll(page);
//        List<User> users = pageUser.getContent();
        return pageUser;
    }
}
