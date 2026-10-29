package com.example.demo;

import java.time.LocalDateTime;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.example.demo.model.Post;
import com.example.demo.model.PostComment;
import com.example.demo.model.PostCommentRepository;
import com.example.demo.model.PostLike;
import com.example.demo.model.PostLikeRepository;
import com.example.demo.model.PostRepository;

@Component
public class PostSeeder implements CommandLineRunner {

    private final PostRepository postRepository;
    private final PostCommentRepository commentRepository;
    private final PostLikeRepository likeRepository;

    public PostSeeder(PostRepository postRepository, PostCommentRepository commentRepository,
            PostLikeRepository likeRepository) {
        this.postRepository = postRepository;
        this.commentRepository = commentRepository;
        this.likeRepository = likeRepository;
    }

    @Override
    public void run(String... args) {
        if (postRepository.count() > 0) {
            return;
        }

        Post p1 = post("companytest", "COMPANIE",
                "Spent the morning in a planning session with the whole team, whiteboards full of sticky notes and three different laptops open at once. These are the sessions that actually move things forward: everyone throwing out ideas, someone sketching a rough flow on paper while another person is already stress-testing it out loud. We walked out with a clearer roadmap for the next quarter and, honestly, a lot more energy than we walked in with. Grateful to work with people who care enough to argue about the details.",
                "/images/feed/team-meeting.jpg", 4);

        Post p2 = post("alexmorgan", "CANDIDAT",
                "Just shipped a new microservice at work using Spring Boot and Docker. Always exciting to see an idea go from whiteboard to production.",
                null, 10);

        Post p3 = post("companytest", "COMPANIE",
                "We've settled into our new office and it still feels a bit surreal seeing our name on the building alongside some seriously established neighbors. There's something motivating about sharing a building with teams that have been doing this for decades, it's a good reminder of where we want to be in a few years. The commute is better, the meeting rooms actually have good light, and somehow that makes the Monday standups a little less painful.",
                "/images/feed/office-building.jpg", 18);

        Post p4 = post("liamcarter", "CANDIDAT",
                "Passed the AWS Certified Solutions Architect exam this week! Grateful for the team at CloudNova for the support along the way.",
                null, 26);

        Post p5 = post("danielosei", "CANDIDAT",
                "Been thinking a lot lately about where the line actually sits between a model that predicts and a model that reasons. Working on a project right now where the goal isn't just forecasting a number, it's getting the system to explain WHY it thinks that number is coming. That shift, from 'here's the output' to 'here's the reasoning', feels like the real frontier right now. We're not quite at genuine understanding, but the gap is closing faster than I expected a year ago.",
                "/images/feed/ai-collaboration.jpg", 34);

        Post p6 = post("sarahchen", "CANDIDAT",
                "Three years into my frontend journey and still learning something new every day. Currently diving deeper into TypeScript generics.",
                null, 50);

        Post p7 = post("liamcarter", "CANDIDAT",
                "People talk about infrastructure like it's an abstraction, containers, clusters, YAML files, but every one of those ultimately comes down to something like this: real silicon, real heat, real physical limits. Spent today debugging a performance issue that, three layers down, turned out to be a hardware bottleneck no amount of clever orchestration could fix. Good reminder that 'the cloud' is just someone else's very carefully cooled computer.",
                "/images/feed/circuit-board.jpg", 60);

        Post p8 = post("danielosei", "CANDIDAT",
                "Published a small write-up on feature engineering for time-series models. Happy to share the link with anyone interested.",
                null, 74);

        Post p9 = post("companytest", "COMPANIE",
                "Great energy at the office this week, the team wrapped up a major sprint and we're already planning what's next.",
                null, 95);

        Post p10 = post("mariaionescu", "CANDIDAT",
                "Excited to start contributing to a new backend project this month. Always fun to dive into a fresh codebase.",
                null, 140);

        comment(p1, "sarahchen", "This is exactly the kind of energy that makes a team great.");
        comment(p1, "mariaionescu", "Love seeing the whiteboard full like that!");
        comment(p1, "liamcarter", "This is the kind of planning session that actually produces results.");
        comment(p1, "danielosei", "Sticky notes and whiteboards never go out of style.");

        comment(p2, "danielosei", "Nice work, Spring Boot + Docker is a solid combo.");
        comment(p2, "companytest", "Love seeing this kind of initiative from the team.");
        comment(p2, "mariaionescu", "Docker makes deployments so much less stressful.");

        comment(p3, "alexmorgan", "Congrats on the new space, looks great.");
        comment(p3, "liamcarter", "Congrats on the move, great area too.");
        comment(p3, "mariaionescu", "That's a solid lineup of neighbors!");

        comment(p4, "alexmorgan", "Congrats, that exam is no joke!");
        comment(p4, "danielosei", "Well deserved, that exam has a reputation for being tough.");
        comment(p4, "companytest", "Great achievement, this kind of growth mindset is exactly what we look for.");

        comment(p5, "liamcarter", "Interpretability is going to matter more than raw accuracy soon.");
        comment(p5, "sarahchen", "This is such an important distinction, more people should think about it this way.");
        comment(p5, "mariaionescu", "Explainability is becoming a hard requirement in so many industries now.");

        comment(p6, "mariaionescu", "TypeScript generics took me a while too, worth it though.");
        comment(p6, "alexmorgan", "Generics finally clicked for me after building a few utility types.");
        comment(p6, "companytest", "Always great to see continuous learning like this.");

        comment(p7, "danielosei", "Very true, abstractions leak eventually.");
        comment(p7, "companytest", "Great point, infrastructure problems always humble you eventually.");
        comment(p7, "mariaionescu", "Had a very similar debugging day recently, painfully relatable.");

        comment(p8, "liamcarter", "Sending this to a few people on my team, thanks for sharing.");
        comment(p8, "mariaionescu", "Feature engineering is so underrated compared to model tuning.");

        comment(p9, "mariaionescu", "Love seeing this kind of energy from the team!");
        comment(p9, "sarahchen", "Sounds like a great place to work.");
        comment(p9, "liamcarter", "Nothing beats that post-sprint feeling.");
        comment(p9, "danielosei", "Curious to hear what's next on the roadmap!");

        comment(p10, "sarahchen", "Fresh codebases are always a fun challenge, good luck!");
        comment(p10, "companytest", "Excited to see what you build, welcome aboard!");

        like(p1, "alexmorgan");
        like(p1, "sarahchen");
        like(p1, "mariaionescu");
        like(p1, "liamcarter");
        like(p1, "danielosei");

        like(p2, "liamcarter");
        like(p2, "danielosei");
        like(p2, "sarahchen");
        like(p2, "companytest");
        like(p2, "mariaionescu");

        like(p3, "sarahchen");
        like(p3, "danielosei");
        like(p3, "alexmorgan");
        like(p3, "mariaionescu");
        like(p3, "liamcarter");

        like(p4, "companytest");
        like(p4, "mariaionescu");
        like(p4, "sarahchen");
        like(p4, "danielosei");

        like(p5, "companytest");
        like(p5, "liamcarter");
        like(p5, "alexmorgan");
        like(p5, "sarahchen");
        like(p5, "mariaionescu");

        like(p6, "liamcarter");
        like(p6, "danielosei");
        like(p6, "companytest");
        like(p6, "alexmorgan");

        like(p7, "sarahchen");
        like(p7, "alexmorgan");
        like(p7, "mariaionescu");
        like(p7, "companytest");

        like(p8, "sarahchen");
        like(p8, "alexmorgan");
        like(p8, "companytest");
        like(p8, "mariaionescu");

        like(p9, "alexmorgan");
        like(p9, "sarahchen");
        like(p9, "mariaionescu");
        like(p9, "liamcarter");
        like(p9, "danielosei");

        like(p10, "alexmorgan");
        like(p10, "sarahchen");
        like(p10, "danielosei");
        like(p10, "liamcarter");
    }

    private Post post(String username, String role, String content, String imagePath, int hoursAgo) {
        Post post = new Post();
        post.setAuthorUsername(username);
        post.setAuthorRole(role);
        post.setContent(content);
        post.setImagePath(imagePath);
        post.setCreatedAt(LocalDateTime.now().minusHours(hoursAgo));
        return postRepository.save(post);
    }

    private void comment(Post post, String username, String content) {
        PostComment comment = new PostComment();
        comment.setPostId(post.getId());
        comment.setAuthorUsername(username);
        comment.setContent(content);
        comment.setCreatedAt(post.getCreatedAt().plusMinutes(20));
        commentRepository.save(comment);
    }

    private void like(Post post, String username) {
        PostLike like = new PostLike();
        like.setPostId(post.getId());
        like.setUsername(username);
        likeRepository.save(like);
    }
}
