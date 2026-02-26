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

/* ===== BODY BACKGROUND TECH ===== */
body{
    font-family:'Poppins',sans-serif;
    margin:0;
    min-height:100vh;
    color:#e8eefc;
    position:relative;
    overflow-x:hidden;

    background:
        radial-gradient(circle at 20% 30%, rgba(0,255,170,0.25), transparent 40%),
        radial-gradient(circle at 80% 70%, rgba(0,140,255,0.25), transparent 45%),
        linear-gradient(135deg,#081a36,#0a1f44 60%,#06152d);
}

/* glow animat */
body::before{
    content:"";
    position:fixed;
    width:140%;
    height:140%;
    background:linear-gradient(
        120deg,
        transparent 20%,
        rgba(0,255,170,0.25),
        rgba(0,140,255,0.25),
        transparent 80%
    );
    filter:blur(80px);
    animation:moveGlow 14s linear infinite;
    z-index:0;
}

@keyframes moveGlow{
    from{transform:translateX(-20%) translateY(-10%) rotate(0deg);}
    to{transform:translateX(20%) translateY(10%) rotate(360deg);}
}

/* ===== TITLU ===== */
.page-title{
    font-size:2.4rem;
    font-weight:700;
    text-align:center;
    margin-bottom:30px;
    position:relative;
    z-index:1;
}

/* ===== CARD JOB ===== */
.card-custom{
    border:none;
    border-radius:18px;
    padding:10px;
    background:linear-gradient(145deg,#0f2a52,#08162c);
    box-shadow:0 10px 30px rgba(0,0,0,0.45);
    transition:all .35s ease;
    opacity:0;
    transform:translateY(20px);
    position:relative;
    z-index:1;
}

/* hover premium */
.card-custom:hover{
    transform:translateY(-10px) scale(1.02);
    box-shadow:
        0 0 25px rgba(0,255,170,0.2),
        0 0 45px rgba(0,140,255,0.2);
}

/* ===== BUTON MODERN ===== */
.btn-custom{
    background:linear-gradient(135deg,#27ae60,#1abc9c);
    border:none;
    border-radius:10px;
    padding:10px 22px;
    font-weight:600;
    color:#fff;
    transition:all 0.3s ease;
}

.btn-custom:hover{
    background:linear-gradient(135deg,#2ed573,#1abc9c);
    box-shadow:0 0 15px rgba(0,255,170,0.4);
    transform:translateY(-2px);
}

/* ===== TEHNOLOGII ===== */
.tech-list{
    padding-left:18px;
    margin-bottom:10px;
}

.tech-list li{
    color:#bcd0ff;
}
</style>
</head>

<body>

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
<div class="card-custom h-100 text-white">

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
