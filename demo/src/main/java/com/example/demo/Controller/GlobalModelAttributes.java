package com.example.demo.Controller;

import java.security.Principal;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.demo.model.MyAppUserRepository;

@ControllerAdvice
public class GlobalModelAttributes {

    private final MyAppUserRepository userRepository;

    public GlobalModelAttributes(MyAppUserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @ModelAttribute("userRole")
    public String userRole(Principal principal) {
        if (principal == null) {
            return null;
        }
        return userRepository.findByUsername(principal.getName())
                .map(u -> u.getRole() == null ? "CANDIDAT" : u.getRole())
                .orElse("CANDIDAT");
    }

    @ModelAttribute("currentUsername")
    public String currentUsername(Principal principal) {
        return principal == null ? null : principal.getName();
    }
}
