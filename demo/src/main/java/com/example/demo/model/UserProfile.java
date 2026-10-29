package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class UserProfile {

    private static final String[] AVATAR_SKIN_TONES = {
        "#f4c2a1", "#e8b089", "#c68863", "#8d5524", "#5c3a21"
    };
    private static final String[] AVATAR_HAIR_COLORS = {
        "#2d2424", "#4a2c17", "#8b5a2b", "#1c1c1c", "#6b4423", "#d4a843"
    };
    private static final String[] AVATAR_SHIRT_COLORS = {
        "#0f172a", "#1e3a5f", "#1e4d3a", "#5b21b6", "#7c2d12", "#0e7490"
    };
    private static final String[] AVATAR_BG_COLORS = {
        "#e0f2fe", "#fce7f3", "#fef3c7", "#dcfce7", "#ede9fe", "#ffe4e6"
    };
    private static final int AVATAR_HAIR_STYLE_COUNT = 4;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(unique = true, nullable = false)
    private String username;

    private String photoPath;
    private String cvPath;
    private String cvOriginalName;
    private String coverLetterPath;
    private String coverLetterOriginalName;
    private String certificatePath;
    private String certificateOriginalName;

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
    public String getCoverLetterPath() {
        return coverLetterPath;
    }
    public void setCoverLetterPath(String coverLetterPath) {
        this.coverLetterPath = coverLetterPath;
    }
    public String getCoverLetterOriginalName() {
        return coverLetterOriginalName;
    }
    public void setCoverLetterOriginalName(String coverLetterOriginalName) {
        this.coverLetterOriginalName = coverLetterOriginalName;
    }
    public String getCertificatePath() {
        return certificatePath;
    }
    public void setCertificatePath(String certificatePath) {
        this.certificatePath = certificatePath;
    }
    public String getCertificateOriginalName() {
        return certificateOriginalName;
    }
    public void setCertificateOriginalName(String certificateOriginalName) {
        this.certificateOriginalName = certificateOriginalName;
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

    // avatar illustration, deterministic per username (same user always gets the same look)
    public String getAvatarSkinHex() {
        return pickAvatarColor(AVATAR_SKIN_TONES, 1);
    }
    public String getAvatarHairHex() {
        return pickAvatarColor(AVATAR_HAIR_COLORS, 3);
    }
    public String getAvatarShirtHex() {
        return pickAvatarColor(AVATAR_SHIRT_COLORS, 7);
    }
    public String getAvatarBgHex() {
        return pickAvatarColor(AVATAR_BG_COLORS, 13);
    }
    public int getAvatarHairStyle() {
        if (username == null || username.isEmpty()) return 0;
        return Math.floorMod(username.hashCode() / 17, AVATAR_HAIR_STYLE_COUNT);
    }

    private String pickAvatarColor(String[] palette, int divisor) {
        if (username == null || username.isEmpty()) return palette[0];
        return palette[Math.floorMod(username.hashCode() / divisor, palette.length)];
    }
}
