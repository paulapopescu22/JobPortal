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

import com.example.demo.model.CompanyProfile;
import com.example.demo.model.CompanyProfileRepository;

@Controller
@RequestMapping("/companyProfile")
public class CompanyProfileController {

    private final CompanyProfileRepository companyProfileRepository;

    @Value("${app.upload-dir:uploads}")
    private String uploadDir;

    public CompanyProfileController(CompanyProfileRepository companyProfileRepository) {
        this.companyProfileRepository = companyProfileRepository;
    }

    @GetMapping
    public String viewCompanyProfile(Model model, Principal principal) {
        CompanyProfile companyProfile = companyProfileRepository.findByUsername(principal.getName())
                .orElseGet(() -> {
                    CompanyProfile p = new CompanyProfile();
                    p.setUsername(principal.getName());
                    return p;
                });
        model.addAttribute("companyProfile", companyProfile);
        return "companyProfile";
    }

    @PostMapping
    public String saveCompanyProfile(
            @RequestParam(value = "companyCode", required = false) String companyCode,
            @RequestParam(value = "website", required = false) String website,
            @RequestParam(value = "description", required = false) String description,
            @RequestParam(value = "logo", required = false) MultipartFile logo,
            Principal principal) throws IOException {

        CompanyProfile companyProfile = companyProfileRepository.findByUsername(principal.getName())
                .orElseGet(CompanyProfile::new);
        companyProfile.setUsername(principal.getName());

        if (companyCode != null) companyProfile.setCompanyCode(companyCode);
        if (website != null) companyProfile.setWebsite(website);
        if (description != null) companyProfile.setDescription(description);

        if (logo != null && !logo.isEmpty()) {
            companyProfile.setLogoPath(storeFile(logo, "logo"));
        }

        companyProfileRepository.save(companyProfile);
        return "redirect:/companyProfile?updated=true";
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
