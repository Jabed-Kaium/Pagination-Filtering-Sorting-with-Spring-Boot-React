package com.pagination.Sort;

import com.pagination.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SortingRepository extends JpaRepository<User, Integer> {

}
