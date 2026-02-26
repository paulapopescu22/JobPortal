<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ro">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Job Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<link rel="icon" type="image/png" href="/images/favicon.png">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

/* ===== BASE ===== */
body{
    font-family:'Poppins',sans-serif;
    background:linear-gradient(135deg,#071427,#020617 70%);
    color:#e6ecff;
    margin:0;
}

/* ===== NAVBAR ===== */
.navbar{
    background:rgba(10,25,47,0.85) !important;
    backdrop-filter:blur(12px);
    border-bottom:1px solid rgba(46,213,115,0.25);
}

.navbar-brand{
    font-weight:700;
    color:#2ed573 !important;
    letter-spacing:1px;
}

.nav-link{
    color:#9fb0ff !important;
}
.nav-link:hover{
    color:#2ed573 !important;
}

/* ===== HERO ===== */
.main-title{
    text-align:center;
    margin-top:80px;
    font-size:3rem;
    font-weight:700;
}

.subtitle{
    text-align:center;
    color:#8af5c5;
    margin-bottom:40px;
}

/* ===== GLASS CARD ===== */
.glass{
    background:rgba(255,255,255,0.04);
    backdrop-filter:blur(10px);
    border:1px solid rgba(46,213,115,0.18);
    border-radius:16px;
    padding:30px;
    transition:0.25s ease;
}

.glass:hover{
    transform:translateY(-6px);
    border:1px solid rgba(46,213,115,0.45);
}

/* ===== BUTTON ===== */
.btn-main{
    background:linear-gradient(135deg,#27ae60,#2ed573);
    border:none;
    padding:12px 26px;
    border-radius:10px;
    color:white;
    font-weight:600;
    transition:0.25s;
}

.btn-main:hover{
    background:linear-gradient(135deg,#2ed573,#27ae60);
    transform:translateY(-2px);
}

/* ===== SEARCH ===== */
.search-box{
    max-width:600px;
    margin:auto;
}

.form-control{
    background:#0c1f3d;
    border:1px solid rgba(46,213,115,0.25);
    color:white;
    border-radius:10px;
    padding:14px;
}

.form-control:focus{
    border-color:#2ed573;
    box-shadow:0 0 0 0.2rem rgba(46,213,115,0.15);
}

/* ===== STATS ===== */
.stat-number{
    font-size:2rem;
    font-weight:700;
    color:#2ed573;
}

.stat-label{
    color:#9fb0ff;
}

/* ===== SECTION ===== */
.section-title{
    font-weight:600;
    margin-bottom:25px;
}
</style>
</head>

<body>

<nav class="navbar navbar-expand-lg">
<div class="container">
<a class="navbar-brand" href="/homePage">JOB PORTAL</a>


</div>
</nav>

<h1 class="main-title">Găsește jobul potrivit</h1>
<p class="subtitle">Platformă modernă pentru cariera ta</p>

<div class="search-box">
<form action="/searchJobs" method="GET" class="d-flex gap-2">
<input name="keyword" class="form-control" placeholder="Caută job...">
<button class="btn btn-main">Caută</button>
</form>
</div>

<div class="container mt-5">
<div class="row g-4 text-center">
<div class="col-md-4">
<div class="glass">
<div class="stat-number">120+</div>
<div class="stat-label">Joburi disponibile</div>
</div>
</div>

<div class="col-md-4">
<div class="glass">
<div class="stat-number">35</div>
<div class="stat-label">Companii partenere</div>
</div>
</div>

<div class="col-md-4">
<div class="glass">
<div class="stat-number">500+</div>
<div class="stat-label">Aplicanți</div>
</div>
</div>
</div>
</div>

<div class="container mt-5">
<div class="row g-4 justify-content-center">
<div class="col-md-5">
<div class="glass text-center">
<h4 class="mb-3">Vezi toate joburile</h4>
<a href="/viewAllJobs" class="btn btn-main">View Jobs</a>
</div>
</div>

<div class="col-md-5">
<div class="glass text-center">
<h4 class="mb-3">Adaugă un job</h4>
<a href="/addJob" class="btn btn-main">Add Job</a>
</div>
</div>
</div>
</div>

</body>
</html>
