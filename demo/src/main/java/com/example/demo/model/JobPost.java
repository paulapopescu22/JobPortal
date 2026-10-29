package com.example.demo.model;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
//@AllArgsConstructor
@Entity
public class JobPost {

    private static final String[] LOGO_COLORS = {
        "#3b82f6", "#0d9488", "#7c3aed", "#d97706", "#e11d48", "#16a34a", "#4f46e5", "#0891b2"
    };
    private static final int LOGO_SHAPE_COUNT = 6;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int postId;
    private String postProfile;
    private String postDesc;
    private String companyName;
    private String experienceLevel;
    @ElementCollection
    private List<String> postTechStack;
    private String authorUsername;
    private LocalDateTime createdAt;

    public JobPost() {
    }

    public JobPost(int postId, String postProfile, String postDesc,
                   String companyName, String experienceLevel, List<String> postTechStack) {
        this.postId = postId;
        this.postProfile = postProfile;
        this.postDesc = postDesc;
        this.companyName = companyName;
        this.experienceLevel = experienceLevel;
        this.postTechStack = postTechStack;
    }

    // getters + setters
    public int getPostId() { return postId; }
    public void setPostId(int postId) { this.postId = postId; }

    public String getAuthorUsername() { return authorUsername; }
    public void setAuthorUsername(String authorUsername) { this.authorUsername = authorUsername; }

    public String getPostProfile() { return postProfile; }
    public void setPostProfile(String postProfile) { this.postProfile = postProfile; }

    public String getPostDesc() { return postDesc; }
    public void setPostDesc(String postDesc) { this.postDesc = postDesc; }

    public String getCompanyName() { return companyName; }
    public void setCompanyName(String companyName) { this.companyName = companyName; }

    public String getExperienceLevel() { return experienceLevel; }
    public void setExperienceLevel(String experienceLevel) { this.experienceLevel = experienceLevel; }

    public List<String> getPostTechStack() { return postTechStack; }
    public void setPostTechStack(List<String> postTechStack) { this.postTechStack = postTechStack; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public String getTimeAgo() {
        if (createdAt == null) return "";
        long seconds = Math.max(0, Duration.between(createdAt, LocalDateTime.now()).getSeconds());
        if (seconds < 60) return "just now";
        long minutes = seconds / 60;
        if (minutes < 60) return minutes + "m";
        long hours = minutes / 60;
        if (hours < 24) return hours + "h";
        long days = hours / 24;
        if (days < 30) return days + "d";
        long months = days / 30;
        if (months < 12) return months + "mo";
        long years = months / 12;
        return years + "y";
    }

    // culoare + forma logo-ului, deterministe (acelasi nume de companie => acelasi logo mereu)
    public int getLogoColorIndex() {
        if (companyName == null || companyName.isEmpty()) return 0;
        return Math.floorMod(companyName.hashCode(), LOGO_COLORS.length);
    }

    public String getLogoColorHex() {
        return LOGO_COLORS[getLogoColorIndex()];
    }

    public int getLogoShapeIndex() {
        if (companyName == null || companyName.isEmpty()) return 0;
        return Math.floorMod(companyName.hashCode() / 7, LOGO_SHAPE_COUNT);
    }
}
