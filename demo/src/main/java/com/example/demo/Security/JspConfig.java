package com.example.demo.Security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class JspConfig {

    @Bean
    public ViewResolver jspViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/"); // folderul JSP-urilor
        resolver.setSuffix(".jsp");             // toate JSP-urile au extensia .jsp
        resolver.setOrder(10);                  // prioritate mai mica decat Thymeleaf
        
        resolver.setViewNames("homePage*", "addJob*", "viewAllJobs*", "success*"); 

        return resolver;
    }
}
