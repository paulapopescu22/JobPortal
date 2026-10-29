package com.example.demo.model;

import java.time.Duration;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Post {

    private static final String[] AVATAR_COLORS = {
        "#0f172a", "#1e293b", "#334155", "#475569", "#64748b"
    };

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String authorUsername;
    private String authorRole;

    @Column(length = 4000)
    private String content;

    private String imagePath;

    private LocalDateTime createdAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getAuthorUsername() { return authorUsername; }
    public void setAuthorUsername(String authorUsername) { this.authorUsername = authorUsername; }

    public String getAuthorRole() { return authorRole; }
    public void setAuthorRole(String authorRole) { this.authorRole = authorRole; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public String getAuthorInitial() {
        if (authorUsername == null || authorUsername.isEmpty()) return "?";
        return authorUsername.substring(0, 1).toUpperCase();
    }

    public String getAvatarColorHex() {
        if (authorUsername == null || authorUsername.isEmpty()) return AVATAR_COLORS[0];
        return AVATAR_COLORS[Math.floorMod(authorUsername.hashCode(), AVATAR_COLORS.length)];
    }

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
}
