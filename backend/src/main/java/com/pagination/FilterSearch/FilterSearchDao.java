package com.pagination.FilterSearch;

import com.pagination.Model.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class FilterSearchDao {

    private final EntityManager entityManager;
    public List<User> findAllByCriteria(SearchRequest request) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(User.class);

        //list to store all the WHERE condition
        List<Predicate> predicates = new ArrayList<>();

        //select * FROM user
        Root<User> root = criteriaQuery.from(User.class);

        //adding WHERE clause (i.e. SELECT * FROM user WHERE email like "%gmail%")
        if(request.getEmail() != null) {
            Predicate emailPredicate = criteriaBuilder.like(root.get("email"), "%" + request.getEmail() + "%");
            predicates.add(emailPredicate);
        }

        //adding WHERE clause (i.e. SELECT * FROM user WHERE salary like "%25000%")
        if(request.getSalary() != null) {
            Predicate salaryPredicate = criteriaBuilder.like(root.get("salary"), "%" + request.getSalary() + "%");
            predicates.add(salaryPredicate);
        }

        //wrap everything (i.e. SELECT * FROM user WHERE email like "%gmail%" AND salary like "%25000%")
        criteriaQuery.where(criteriaBuilder.and(predicates.toArray(new Predicate[0])));

        TypedQuery<User> query = entityManager.createQuery(criteriaQuery);

        return query.getResultList();
    }
}
