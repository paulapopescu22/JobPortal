package com.example.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.JobPost;

public interface JobPostRepository extends JpaRepository<JobPost, Integer> {
}
