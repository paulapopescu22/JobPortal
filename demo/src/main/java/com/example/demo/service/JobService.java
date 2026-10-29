package com.example.demo.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.JobPost;
import com.example.demo.repo.JobPostRepository;

@Service
public class JobService {
    @Autowired
    public JobPostRepository repo;

    // method to add a jobPost
    public void addJob(JobPost jobPost) {
        repo.save(jobPost);

    }

    //method to return all JobPosts
    public List<JobPost> getAllJobs() {
        return repo.findAll();

    }

     public List<JobPost> searchJobs(String keyword) {
        if (keyword == null || keyword.isBlank()) {
            return getAllJobs();
        }

        String lowerKeyword = keyword.toLowerCase();

        return repo.findAll().stream()
                .filter(job -> job.getPostProfile().toLowerCase().contains(lowerKeyword) ||
                               job.getPostDesc().toLowerCase().contains(lowerKeyword) ||
                               job.getPostTechStack().stream()
                                  .anyMatch(tech -> tech.toLowerCase().contains(lowerKeyword)))
                .toList();
    }

    public JobPost getJobById(int id) {
        return repo.findById(id).orElse(null);
    }

    public void updateJob(JobPost jobPost) {
        repo.save(jobPost);
    }

    public void deleteJob(int id) {
        repo.deleteById(id);
    }

}
