package com.example.demo.Controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.MyAppUserRepository;
import com.example.demo.model.Post;
import com.example.demo.model.PostComment;
import com.example.demo.model.PostCommentRepository;
import com.example.demo.model.PostLike;
import com.example.demo.model.PostLikeRepository;
import com.example.demo.model.PostRepository;

@Controller
public class FeedController {

    private final PostRepository postRepository;
    private final PostCommentRepository commentRepository;
    private final PostLikeRepository likeRepository;
    private final MyAppUserRepository userRepository;

    public FeedController(PostRepository postRepository, PostCommentRepository commentRepository,
            PostLikeRepository likeRepository, MyAppUserRepository userRepository) {
        this.postRepository = postRepository;
        this.commentRepository = commentRepository;
        this.likeRepository = likeRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/homePage")
    public String home(Model model, Principal principal) {
        String currentUser = principal == null ? null : principal.getName();

        List<PostView> views = new ArrayList<>();
        for (Post post : postRepository.findAllByOrderByCreatedAtDesc()) {
            long likeCount = likeRepository.countByPostId(post.getId());
            boolean likedByMe = currentUser != null
                    && likeRepository.findByPostIdAndUsername(post.getId(), currentUser).isPresent();
            List<PostComment> comments = commentRepository.findByPostIdOrderByCreatedAtAsc(post.getId());
            views.add(new PostView(post, likeCount, likedByMe, comments));
        }

        model.addAttribute("posts", views);
        return "homePage";
    }

    @PostMapping("/posts/create")
    public String createPost(
            @RequestParam("content") String content,
            Principal principal) {

        if (content == null || content.isBlank()) {
            return "redirect:/homePage";
        }

        Post post = new Post();
        post.setAuthorUsername(principal.getName());
        post.setAuthorRole(userRepository.findByUsername(principal.getName())
                .map(u -> u.getRole() == null ? "CANDIDAT" : u.getRole())
                .orElse("CANDIDAT"));
        post.setContent(content.trim());
        post.setCreatedAt(LocalDateTime.now());
        postRepository.save(post);

        return "redirect:/homePage";
    }

    @PostMapping("/posts/{id}/like")
    public String toggleLike(@PathVariable("id") Long id, Principal principal) {
        String username = principal.getName();
        likeRepository.findByPostIdAndUsername(id, username)
                .ifPresentOrElse(
                        likeRepository::delete,
                        () -> {
                            PostLike like = new PostLike();
                            like.setPostId(id);
                            like.setUsername(username);
                            likeRepository.save(like);
                        });
        return "redirect:/homePage#post-" + id;
    }

    @PostMapping("/posts/{id}/comment")
    public String addComment(@PathVariable("id") Long id,
            @RequestParam("content") String content,
            Principal principal) {

        if (content != null && !content.isBlank()) {
            PostComment comment = new PostComment();
            comment.setPostId(id);
            comment.setAuthorUsername(principal.getName());
            comment.setContent(content.trim());
            comment.setCreatedAt(LocalDateTime.now());
            commentRepository.save(comment);
        }
        return "redirect:/homePage#post-" + id;
    }

    @PostMapping("/posts/{id}/edit")
    public String editPost(@PathVariable("id") Long id,
            @RequestParam("content") String content,
            Principal principal) {

        if (principal != null && content != null && !content.isBlank()) {
            postRepository.findById(id).ifPresent(post -> {
                if (principal.getName().equals(post.getAuthorUsername())) {
                    post.setContent(content.trim());
                    postRepository.save(post);
                }
            });
        }
        return "redirect:/homePage#post-" + id;
    }

    @Transactional
    @PostMapping("/posts/{id}/delete")
    public String deletePost(@PathVariable("id") Long id, Principal principal) {
        if (principal != null) {
            postRepository.findById(id).ifPresent(post -> {
                if (principal.getName().equals(post.getAuthorUsername())) {
                    commentRepository.deleteByPostId(id);
                    likeRepository.deleteByPostId(id);
                    postRepository.delete(post);
                }
            });
        }
        return "redirect:/homePage";
    }

    public static class PostView {
        private final Post post;
        private final long likeCount;
        private final boolean likedByMe;
        private final List<PostComment> comments;

        public PostView(Post post, long likeCount, boolean likedByMe, List<PostComment> comments) {
            this.post = post;
            this.likeCount = likeCount;
            this.likedByMe = likedByMe;
            this.comments = comments;
        }

        public Post getPost() { return post; }
        public long getLikeCount() { return likeCount; }
        public boolean isLikedByMe() { return likedByMe; }
        public List<PostComment> getComments() { return comments; }
        public long getCommentCount() { return comments.size(); }
    }
}
