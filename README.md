# Job Management Web Application - Spring Boot Project

## Description

This is a **professional web application** built using **Spring Boot**, designed to manage job postings and user authentication. The application allows users to add, view, and search for jobs, while providing secure registration and email verification workflows.  

The project is currently **in progress** and demonstrates modern backend development practices, enterprise-ready features, and secure workflows.

---

## Features

### Job Management
- Add new job postings via a form.
- View all available job listings.
- Search for jobs by keyword (title, description, or tech stack).

### User Authentication
- Secure user registration with email verification.
- Login using **Spring Security** with **BCrypt password hashing**.
- JWT-based tokens for verification and secure workflows.

### Email Integration
- Verification email upon registration.
- Password reset emails.
- HTML templates for emails using `JavaMailSender`.

---

## Technology Stack
- **Backend:** Spring Boot 3.5.10, Java 17, Spring MVC, Spring Security
- **Templating:** Thymeleaf (login/signup) + JSP (job management pages)
- **Persistence:** JPA / Hibernate, PostgreSQL (runtime)
- **Email:** JavaMailSender
- **Authentication:** JWT (JSON Web Tokens)
- **Build Tool:** Maven
- **Additional Tools:** Lombok, Tomcat embedded, JSTL

---

## Project Structure

- `Controller/` – Handles HTTP requests for jobs, user registration, and email verification.
- `model/` – Entity classes (`JobPost`, `MyAppUser`) and repository interfaces for database operations.
- `service/` – Business logic for jobs and email sending.
- `repo/` – In-memory repository (`JobRepo`) for job management.
- `Security/` – Spring Security configuration and JSP view resolver.
- `utils/` – JWT token generation and validation utilities.
- `DemoApplication.java` – Entry point for Spring Boot.

---

## Installation & Running

### 1. Clone the repository

```sh
git clone https://github.com/yourusername/job-management-spring.git
cd job-management-spring
