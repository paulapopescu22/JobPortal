package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class UserProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(unique = true, nullable = false)
    private String username;

    private String photoPath;
    private String cvPath;
    private String cvOriginalName;

    @Column(length = 1000)
    private String skills;

    @Column(length = 2000)
    private String languages;

    @Column(length = 2000)
    private String education;

    @Column(length = 4000)
    private String experience;

    @Column(length = 2000)
    private String certifications;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPhotoPath() {
        return photoPath;
    }
    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }
    public String getCvPath() {
        return cvPath;
    }
    public void setCvPath(String cvPath) {
        this.cvPath = cvPath;
    }
    public String getCvOriginalName() {
        return cvOriginalName;
    }
    public void setCvOriginalName(String cvOriginalName) {
        this.cvOriginalName = cvOriginalName;
    }
    public String getSkills() {
        return skills;
    }
    public void setSkills(String skills) {
        this.skills = skills;
    }
    public String getLanguages() {
        return languages;
    }
    public void setLanguages(String languages) {
        this.languages = languages;
    }
    public String getEducation() {
        return education;
    }
    public void setEducation(String education) {
        this.education = education;
    }
    public String getExperience() {
        return experience;
    }
    public void setExperience(String experience) {
        this.experience = experience;
    }
    public String getCertifications() {
        return certifications;
    }
    public void setCertifications(String certifications) {
        this.certifications = certifications;
    }
}
