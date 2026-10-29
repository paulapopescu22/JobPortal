package com.example.demo.Controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.UserProfile;
import com.example.demo.model.UserProfileRepository;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    private final UserProfileRepository profileRepository;

    @Value("${app.upload-dir:uploads}")
    private String uploadDir;

    public ProfileController(UserProfileRepository profileRepository) {
        this.profileRepository = profileRepository;
    }

    @GetMapping
    public String viewProfile(Model model, Principal principal) {
        UserProfile profile = profileRepository.findByUsername(principal.getName())
                .orElseGet(() -> {
                    UserProfile p = new UserProfile();
                    p.setUsername(principal.getName());
                    return p;
                });
        model.addAttribute("profile", profile);
        return "profile";
    }

    @PostMapping
    public String saveProfile(
            @RequestParam(value = "skills", required = false) String skills,
            @RequestParam(value = "languages", required = false) String languages,
            @RequestParam(value = "education", required = false) String education,
            @RequestParam(value = "experience", required = false) String experience,
            @RequestParam(value = "certifications", required = false) String certifications,
            @RequestParam(value = "photo", required = false) MultipartFile photo,
            @RequestParam(value = "cv", required = false) MultipartFile cv,
            @RequestParam(value = "coverLetter", required = false) MultipartFile coverLetter,
            @RequestParam(value = "certificateFile", required = false) MultipartFile certificateFile,
            Principal principal) throws IOException {

        UserProfile profile = profileRepository.findByUsername(principal.getName())
                .orElseGet(UserProfile::new);
        profile.setUsername(principal.getName());

        if (skills != null) profile.setSkills(skills);
        if (languages != null) profile.setLanguages(languages);
        if (education != null) profile.setEducation(education);
        if (experience != null) profile.setExperience(experience);
        if (certifications != null) profile.setCertifications(certifications);

        if (photo != null && !photo.isEmpty()) {
            profile.setPhotoPath(storeFile(photo, "photo"));
        }
        if (cv != null && !cv.isEmpty()) {
            profile.setCvPath(storeFile(cv, "cv"));
            profile.setCvOriginalName(cv.getOriginalFilename());
        }
        if (coverLetter != null && !coverLetter.isEmpty()) {
            profile.setCoverLetterPath(storeFile(coverLetter, "coverletter"));
            profile.setCoverLetterOriginalName(coverLetter.getOriginalFilename());
        }
        if (certificateFile != null && !certificateFile.isEmpty()) {
            profile.setCertificatePath(storeFile(certificateFile, "certificate"));
            profile.setCertificateOriginalName(certificateFile.getOriginalFilename());
        }

        profileRepository.save(profile);
        return "redirect:/profile?updated=true";
    }

    private String storeFile(MultipartFile file, String prefix) throws IOException {
        Path dir = Paths.get(uploadDir);
        Files.createDirectories(dir);

        String original = file.getOriginalFilename();
        String ext = "";
        if (original != null && original.contains(".")) {
            ext = original.substring(original.lastIndexOf('.')).replaceAll("[^a-zA-Z0-9.]", "");
        }

        String filename = prefix + "_" + UUID.randomUUID() + ext;
        Path target = dir.resolve(filename);
        Files.copy(file.getInputStream(), target, StandardCopyOption.REPLACE_EXISTING);

        return "/uploads/" + filename;
    }
}
