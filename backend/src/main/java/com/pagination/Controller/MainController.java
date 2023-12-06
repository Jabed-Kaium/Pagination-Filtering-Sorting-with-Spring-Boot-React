package com.pagination.Controller;

import com.pagination.Model.User;
import com.pagination.Service.UserService;
import com.pagination.Sort.SortingService;
import com.pagination.FilterSearch.FilterSearchDao;
import com.pagination.FilterSearch.SearchRequest;
import com.pagination.FindByAllCriteria.FindByAllCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("api/v1")
public class MainController {

    @Autowired
    private UserService userService;

    @Autowired
    private FilterSearchDao filterSearchDao;

    @Autowired
    private SortingService sortingService;

    @Autowired
    private FindByAllCriteria findByAllCriteria;

    //get all user
    @GetMapping("/users")
    public List<User> getAll() {
        return userService.getAll();
    }


    //get data with pagination
    @GetMapping("/user")
    public ResponseEntity<List<User>> getUserWithPagination(
            @RequestParam(value = "page", defaultValue = "0", required = false) int pageNo,
            @RequestParam(value = "limit", defaultValue = "10", required = false) int limit
            ) {

            Page<User> userPage = userService.getUserWithPagination(pageNo, limit);

            //adding http header for getting total item count
            HttpHeaders responseHeaders = new HttpHeaders();
            responseHeaders.set("Access-Control-Expose-Headers", "x-total-count");
            responseHeaders.set("x-total-count", String.valueOf(userPage.getTotalElements()));

            //convert page to list item
            List<User> users = userPage.getContent();

            return new ResponseEntity<>(users, responseHeaders, HttpStatus.OK);
    }


    //get data with filtering
    @GetMapping("/user/result/filter")
    public List<User> getUserWithFilter(
            @RequestParam(value = "email") String email,
            @RequestParam(value = "salary") String salary
    ) {
        SearchRequest searchRequest = new SearchRequest();
        searchRequest.setEmail(email);
        searchRequest.setSalary(salary);

        List<User> userList = filterSearchDao.findAllByCriteria(searchRequest);

        return userList;
    }

    //get data with sorting
    @GetMapping("/user/sort")
    public List<User> getUserWithSorting(
            @RequestParam(value = "key") String key
    ) {
        List<User> userList = sortingService.findAllBySorting(key);

        return userList;
    }

    //get data with pagination, filtering and sorting together
    @GetMapping("/user/result")
    public ResponseEntity<List<User>> getResultWithPaginationFilteringSorting(
            @RequestParam(value = "page", defaultValue = "0", required = false) int pageNo,
            @RequestParam(value = "limit", defaultValue = "10", required = false) int limit,
            @RequestParam(value = "email") String email,
            @RequestParam(value = "salary") String salary,
            @RequestParam(value = "key") String key
    ) {

        Page<User> userPage = findByAllCriteria.findAllByPaginationFilteringSorting(pageNo, limit, email, salary, key);

        //adding http header for getting total item count
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Access-Control-Expose-Headers", "x-total-count");
        responseHeaders.set("x-total-count", String.valueOf(userPage.getTotalElements()));

        //convert page to list item
        List<User> users = userPage.getContent();

        return new ResponseEntity<>(users, responseHeaders, HttpStatus.OK);
    }

}
