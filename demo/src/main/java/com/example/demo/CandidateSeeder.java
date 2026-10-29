package com.example.demo;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.example.demo.model.UserProfile;
import com.example.demo.model.UserProfileRepository;

@Component
public class CandidateSeeder implements CommandLineRunner {

    private final UserProfileRepository userProfileRepository;

    public CandidateSeeder(UserProfileRepository userProfileRepository) {
        this.userProfileRepository = userProfileRepository;
    }

    @Override
    public void run(String... args) {
        seed("alexmorgan", "Java, Spring Boot, Docker, PostgreSQL",
                "English - Fluent/Native\nRomanian - Intermediate",
                "Polytechnic University of Bucharest - Computer Science - 2018-2022",
                "Backend Developer - ByteForge Software - 2022-present",
                "AWS Cloud Practitioner - Amazon - 2023");

        seed("sarahchen", "React, JavaScript, TypeScript, CSS",
                "English - Fluent/Native\nMandarin - Fluent/Native",
                "University of Bucharest - Computer Science - 2019-2023",
                "Frontend Developer - Pixel & Co - 2023-present",
                "");

        seed("danielosei", "Python, Machine Learning, TensorFlow, Data Analysis",
                "English - Fluent/Native",
                "Technical University of Cluj-Napoca - Data Science - 2017-2021",
                "Data Scientist - DataSphere Analytics - 2021-present",
                "TensorFlow Developer Certificate - Google - 2022");

        seed("mariaionescu", "Node.js, Express.js, MongoDB, REST API",
                "Romanian - Fluent/Native\nEnglish - Advanced",
                "Alexandru Ioan Cuza University - Computer Science - 2020-2024",
                "Junior Backend Developer - Quantum Logic Ltd - 2024-present",
                "");

        seed("liamcarter", "Docker, Kubernetes, AWS, CI/CD",
                "English - Fluent/Native",
                "West University of Timisoara - Computer Engineering - 2016-2020",
                "DevOps Engineer - CloudNova Systems - 2020-present",
                "AWS Certified Solutions Architect - Amazon - 2023\nCertified Kubernetes Administrator - CNCF - 2022");
    }

    private void seed(String username, String skills, String languages, String education,
            String experience, String certifications) {
        if (userProfileRepository.findByUsername(username).isPresent()) {
            return;
        }
        UserProfile profile = new UserProfile();
        profile.setUsername(username);
        profile.setSkills(skills);
        profile.setLanguages(languages);
        profile.setEducation(education);
        profile.setExperience(experience);
        profile.setCertifications(certifications);
        userProfileRepository.save(profile);
    }
}
