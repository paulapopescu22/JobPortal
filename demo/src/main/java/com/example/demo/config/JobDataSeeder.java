package com.example.demo.config;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.example.demo.model.JobPost;
import com.example.demo.repo.JobPostRepository;

@Component
public class JobDataSeeder implements CommandLineRunner {

    private final JobPostRepository jobPostRepository;

    public JobDataSeeder(JobPostRepository jobPostRepository) {
        this.jobPostRepository = jobPostRepository;
    }

    @Override
    public void run(String... args) {
        if (jobPostRepository.count() > 0) {
            return;
        }

        jobPostRepository.saveAll(List.of(
                aged(new JobPost(0, "Java Developer", "We're looking for a Java developer for our backend team, involved in building scalable services.", "ByteForge Software", "Middle (2-4 years)",
                        List.of("Core Java", "J2EE", "Spring Boot", "Hibernate")), 12),

                aged(new JobPost(0, "Frontend Developer", "You'll build modern, responsive interfaces alongside a dedicated design team.", "Pixel & Co", "Junior",
                        List.of("HTML", "CSS", "JavaScript", "React")), 9),

                aged(new JobPost(0, "Data Scientist", "You'll analyze large datasets and build machine learning models for our products.", "DataSphere Analytics", "Senior (5+ years)",
                        List.of("Python", "Machine Learning", "Data Analysis", "TensorFlow")), 7),

                aged(new JobPost(0, "Network Engineer", "You'll design and implement networks for efficient data communication across client infrastructure.", "NetWave Solutions", "Middle",
                        List.of("Networking", "Cisco", "Routing", "Switching")), 5),

                aged(new JobPost(0, "Mobile App Developer", "You'll develop native mobile apps for iOS and Android, from idea to the App Store.", "CodeCraft Studio", "Junior-Middle (1-3 years)",
                        List.of("iOS Development", "Android Development", "Kotlin")), 3),

                aged(new JobPost(0, "DevOps Engineer", "You'll maintain and optimize cloud infrastructure and CI/CD pipelines for all product teams.", "CloudNova Systems", "Senior",
                        List.of("Docker", "Kubernetes", "AWS", "CI/CD")), 2),

                aged(new JobPost(0, "Backend Developer", "You'll build and maintain REST APIs for a high-traffic platform.", "Quantum Logic Ltd", "Middle (3-5 years)",
                        List.of("Node.js", "Express.js", "MongoDB", "REST API")), 1)
        ));
    }

    private JobPost aged(JobPost job, long daysAgo) {
        job.setCreatedAt(LocalDateTime.now().minusDays(daysAgo));
        return job;
    }
}
