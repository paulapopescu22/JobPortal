package com.example.demo.Controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.JobPost;
import com.example.demo.model.UserProfile;
import com.example.demo.model.UserProfileRepository;
import com.example.demo.service.JobService;

@Controller
public class ContentController {

    private final JobService service;
    private final UserProfileRepository userProfileRepository;

    public ContentController(JobService service, UserProfileRepository userProfileRepository) {
        this.service = service;
        this.userProfileRepository = userProfileRepository;
    }

    @GetMapping("/req/login")
    public String login() { return "login"; }

    @GetMapping("/req/signup")
    public String signup() { return "signup"; }

    @GetMapping("/terms")
    public String terms() { return "terms"; }

    @GetMapping("/privacy")
    public String privacy() { return "privacy"; }

    @GetMapping("/addJob")
    public String addJob() { return "addJob"; }

    @PostMapping("/handleForm")
    public String handleForm(JobPost jobPost, Principal principal) {
        jobPost.setAuthorUsername(principal == null ? null : principal.getName());
        jobPost.setCreatedAt(LocalDateTime.now());
        service.addJob(jobPost);
        return "success";
    }

    @GetMapping("/editJob")
    public String editJobForm(@RequestParam("id") int id, Model model, Principal principal) {
        JobPost jobPost = service.getJobById(id);
        if (jobPost == null || principal == null || !principal.getName().equals(jobPost.getAuthorUsername())) {
            return "redirect:/viewAllJobs";
        }
        model.addAttribute("jobPost", jobPost);
        return "addJob";
    }

    @PostMapping("/editJob")
    public String editJobSubmit(JobPost jobPost, Principal principal) {
        JobPost existing = service.getJobById(jobPost.getPostId());
        if (existing != null && principal != null && principal.getName().equals(existing.getAuthorUsername())) {
            jobPost.setAuthorUsername(existing.getAuthorUsername());
            jobPost.setCreatedAt(existing.getCreatedAt());
            service.updateJob(jobPost);
        }
        return "redirect:/viewJob?id=" + jobPost.getPostId();
    }

    @PostMapping("/deleteJob")
    public String deleteJob(@RequestParam("id") int id, Principal principal) {
        JobPost existing = service.getJobById(id);
        if (existing != null && principal != null && principal.getName().equals(existing.getAuthorUsername())) {
            service.deleteJob(id);
        }
        return "redirect:/viewAllJobs";
    }

    @GetMapping("/viewAllJobs")
    public String viewJobs(Model model) {
        List<JobPost> allJobs = service.getAllJobs();
        model.addAttribute("jobs", allJobs);
        return "viewAllJobs";
    }

    @GetMapping("/searchJobs")
    public String searchJobs(@RequestParam(name = "keyword", required = false) String keyword, Model model) {
        List<JobPost> results = service.searchJobs(keyword);
        model.addAttribute("jobs", results);
        model.addAttribute("keyword", keyword);
        return "viewAllJobs";
    }

    @GetMapping("/viewJob")
    public String viewJob(@RequestParam("id") int id, Model model) {
        JobPost job = service.getJobById(id);
        model.addAttribute("job", job);
        return "jobDetails";
    }

    @GetMapping("/searchCandidates")
    public String searchCandidates(@RequestParam(name = "keyword", required = false) String keyword, Model model) {
        List<UserProfile> results = (keyword == null || keyword.isBlank())
                ? userProfileRepository.findAll()
                : userProfileRepository.findBySkillsContainingIgnoreCase(keyword);
        model.addAttribute("candidates", results);
        model.addAttribute("keyword", keyword);
        return "searchCandidates";
    }

    @GetMapping("/candidateCv")
    public String candidateCv(@RequestParam("username") String username, Model model) {
        UserProfile candidate = userProfileRepository.findByUsername(username).orElse(null);
        model.addAttribute("candidate", candidate);
        return "candidateCv";
    }

    @GetMapping("/messages")
    public String messages() { return "messages"; }
}
