# Job Portal

## Description

This is a **professional web application** built using **Spring Boot**, designed to manage job postings and user authentication. The application allows users to add, view, and search for jobs, while providing secure registration and email verification workflows.  

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
```
### 2. Build the project

```sh
mvn clean install
```

### 3. Run the Spring Boot application

```sh
mvn spring-boot:run
```
The application will start on http://localhost:8080.

---

## Usage

### Job Pages:

```sh
/homePage – Homepage

/addJob – Add a new job

/viewAllJobs – View all jobs

/searchJobs?keyword=java – Search jobs by keyword
```

### Authentication Pages:

```sh
/req/signup – JSON POST for registration

/req/login – Login page

/req/signup/verify?token=<JWT> – Email verification
```

---

## Notes

- JobRepo currently uses in-memory storage for demonstration purposes. Replace with JPA repositories for production.

- Email sending requires SMTP configuration in application.properties.

- JSP and Thymeleaf templates coexist; JSP views are configured via JspConfig.java.

- Security features include password hashing, JWT verification, and CSRF disabled only for development.

## Maven Dependencies

#### Key dependencies in pom.xml:

- Spring Boot starters: web, data-jpa, security, thymeleaf, mail, test

- PostgreSQL driver

- JWT (io.jsonwebtoken)

- JSP and JSTL support

- Lombok

## Author

- Popescu Paula-Marta

