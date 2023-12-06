package com.pagination.FindByAllCriteria;

import com.pagination.Model.User;
import com.pagination.FilterSearch.FilterSearchDao;
import com.pagination.FilterSearch.SearchRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;

@Service
public class FindByAllCriteria {

    @Autowired
    private FilterSearchDao filterSearchDao;
    public Page<User> findAllByPaginationFilteringSorting(int pageNo, int limit, String email, String salary, String key) {

        SearchRequest searchRequest = new SearchRequest();
        searchRequest.setEmail(email);
        searchRequest.setSalary(salary);

        //get a list with filtered data
        List<User> userList = filterSearchDao.findAllByCriteria(searchRequest);

        //sort the list based on a field
        switch (key) {
            case "name":
                userList.sort(Comparator.comparing(User::getName));
                break;
            case "email":
                userList.sort(Comparator.comparing(User::getEmail));
                break;
            case "salary":
                userList.sort(Comparator.comparing(User::getSalary));
                break;

            default:
                userList.sort(Comparator.comparing(User::getId));
        }

        //create a page of user with pageNo and limit for filtered and sorted data
        Pageable page = PageRequest.of(pageNo, limit);
        int start = (int) page.getOffset();
        int end = Math.min((start + page.getPageSize()), userList.size());

        List<User> pageContent = userList.subList(start, end);

        return new PageImpl<>(pageContent, page, userList.size());
    }
}
