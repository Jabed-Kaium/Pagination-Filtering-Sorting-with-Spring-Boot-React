package com.pagination.Sort;

import com.pagination.Model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SortingService {

    @Autowired
    private SortingRepository sortingRepository;

    public List<User> findAllBySorting(String key) {
        return sortingRepository.findAll(Sort.by(Sort.Direction.ASC, key));
    }
}
