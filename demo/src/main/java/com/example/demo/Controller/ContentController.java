package com.example.demo.Controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.JobPost;
import com.example.demo.service.JobService;

@Controller
public class ContentController {

    private final JobService service;

    public ContentController(JobService service) {
        this.service = service;
    }

    // =========================================
    // HTML (Thymeleaf)
    // =========================================
    @GetMapping("/req/login")
    public String login() {
        return "login";
    }

    @GetMapping("/req/signup")
    public String signup() {
        return "signup";
    }

    // =========================================
    // JSP
    // =========================================
    @GetMapping("/homePage")
    public String home() {
        return "homePage";
    }

    @GetMapping("/addJob")
    public String addJob() {
        return "addJob";
    }

    @PostMapping("/handleForm")
    public String handleForm(JobPost jobPost) {
        service.addJob(jobPost);
        return "success";
    }

    // =========================================
    // Vezi toate joburile
    // =========================================
    @GetMapping("/viewAllJobs")
    public String viewJobs(Model model) {
        List<JobPost> allJobs = service.getAllJobs();
        model.addAttribute("jobs", allJobs); // cheia "jobs" pentru JSP
        return "viewAllJobs";
    }

    // =========================================
    // Căutare joburi
    // =========================================
    @GetMapping("/searchJobs")
public String searchJobs(@RequestParam(name = "keyword", required = false) String keyword, Model model) {
    List<JobPost> results = service.searchJobs(keyword); // folosim JobService
    model.addAttribute("jobs", results);
    model.addAttribute("keyword", keyword);
    return "viewAllJobs"; // JSP care afișează rezultatele
}

}
