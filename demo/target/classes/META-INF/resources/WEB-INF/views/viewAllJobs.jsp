<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ro">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lista Joburi</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="/images/favicon.png">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap');

/* ===== BODY ===== */
body{
    font-family:'Poppins',sans-serif;
    margin:0;
    min-height:100vh;
    color:#0f172a;
    background:#f8fafc;
}

/* ===== NAVBAR ===== */
.navbar{
    background:#ffffff !important;
    border-bottom:1px solid #e2e8f0;
}
.navbar-brand{
    color:#0f172a !important;
    font-weight:700;
    letter-spacing:0.5px;
}
.nav-link{
    color:#64748b !important;
    font-weight:500;
}
.nav-link:hover{
    color:#3b82f6 !important;
}

/* ===== TITLU ===== */
.page-title{
    font-size:2.2rem;
    font-weight:700;
    text-align:center;
    margin-bottom:30px;
    color:#0f172a;
}

/* ===== CARD JOB ===== */
.card-custom{
    border:1px solid #e2e8f0;
    border-radius:18px;
    padding:10px;
    background:#ffffff;
    transition:all .35s ease;
    opacity:0;
    transform:translateY(20px);
}

.card-custom:hover{
    transform:translateY(-6px);
    border-color:#3b82f6;
}

/* ===== BUTON MODERN ===== */
.btn-custom{
    background:linear-gradient(135deg,#1d4ed8,#3b82f6);
    border:none;
    border-radius:10px;
    padding:10px 22px;
    font-weight:600;
    color:#fff;
    transition:all 0.2s ease;
}

.btn-custom:hover{
    background:linear-gradient(135deg,#3b82f6,#60a5fa);
}

/* ===== TEHNOLOGII ===== */
.tech-list{
    padding-left:18px;
    margin-bottom:10px;
}

.tech-list li{
    color:#64748b;
}
</style>
</head>

<body>

<nav class="navbar navbar-expand-lg">
<div class="container">
<a class="navbar-brand fs-4" href="/homePage">JOB PORTAL</a>

<div class="collapse navbar-collapse">
<ul class="navbar-nav ms-auto">
<li class="nav-item"><a class="nav-link" href="/homePage">Home</a></li>
<li class="nav-item"><a class="nav-link" href="/viewAllJobs">All Jobs</a></li>
<li class="nav-item"><a class="nav-link" href="/addJob">Add Job</a></li>
<li class="nav-item"><a class="nav-link" href="/profile">Profil</a></li>
<li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
</ul>
</div>
</div>
</nav>

<div class="container mt-5">

<c:if test="${not empty keyword}">
    <h2 class="page-title">
        Rezultatele căutării pentru: ${keyword}
    </h2>
</c:if>

<c:if test="${empty keyword}">
    <h2 class="page-title">
        Lista tuturor joburilor
    </h2>
</c:if>

<div class="row row-cols-1 row-cols-md-2 g-4">

<c:forEach var="job" items="${jobs}">
<div class="col">
<div class="card-custom h-100">

<div class="card-body">
<h5 class="fw-bold">${job.postProfile}</h5>

<p>${job.postDesc}</p>

<p><strong>Experiență necesară:</strong> ${job.reqExperience} ani</p>

<p><strong>Tehnologii:</strong></p>
<ul class="tech-list">
<c:forEach var="tech" items="${job.postTechStack}">
<li>${tech}</li>
</c:forEach>
</ul>

<a href="/viewJob?id=${job.postId}" class="btn btn-custom">
Vezi detalii
</a>
</div>

</div>
</div>
</c:forEach>

</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
// ===== REVEAL ANIMATION =====
const revealElements = document.querySelectorAll('.card-custom');

const revealOnScroll = () => {
  const windowBottom = window.innerHeight + window.scrollY;
  revealElements.forEach(el => {
    if(el.offsetTop + 80 < windowBottom){
      el.style.opacity = 1;
      el.style.transform = 'translateY(0)';
    }
  });
};

window.addEventListener('scroll', revealOnScroll);
revealOnScroll();
</script>

</body>
</html>
