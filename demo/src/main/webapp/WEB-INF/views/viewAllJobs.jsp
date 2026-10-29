<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Jobs</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="/images/favicon.png">

<style>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@700&display=swap');

/* ===== BODY ===== */
body{
    font-family:'Inter',-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;
    margin:0;
    min-height:100vh;
    color:#0f172a;
    background:#e2e8f0;
}

/* ===== NAVBAR ===== */
.navbar{
    background:#ffffff !important;
    border-bottom:1px solid #e2e8f0;
}
.navbar-brand{
    font-family:'Poppins',sans-serif;
    color:#0f172a !important;
    font-weight:700;
    letter-spacing:0.5px;
    display:inline-flex;
    align-items:center;
    gap:8px;
}

.nav-wrap{
    display:flex;
    align-items:center;
    flex-wrap:wrap;
    gap:16px;
    padding:8px 0;
}
.nav-search{
    flex:0 1 200px;
    min-width:120px;
    max-width:200px;
}
.nav-search input{
    width:100%;
    background:#f1f5f9;
    border:1px solid #e2e8f0;
    border-radius:999px;
    padding:6px 14px;
    font-size:0.78rem;
    color:#0f172a;
    outline:none;
}
.nav-search input:focus{
    border-color:#1e293b;
    background:#ffffff;
}
.nav-actions{
    display:flex;
    align-items:center;
    gap:20px;
    margin-left:auto;
    flex-wrap:wrap;
}
.nav-btn{
    color:#64748b;
    font-weight:500;
    font-size:0.85rem;
    text-decoration:none;
    white-space:nowrap;
}
.nav-btn:hover{
    color:#1e293b;
}
.nav-btn-primary{
    background:#0f172a;
    color:#ffffff !important;
    padding:7px 18px;
    border-radius:999px;
    font-weight:600;
}
.nav-btn-primary:hover{
    background:#1e293b;
}

/* ===== TITLU ===== */
.jobs-page-header{
    display:flex;
    align-items:center;
    justify-content:space-between;
    gap:16px;
    max-width:560px;
    margin:0 auto 28px;
}
.page-title{
    font-size:1.7rem;
    font-weight:700;
    margin-bottom:0;
    color:#0f172a;
}
.btn-add-job{
    background:#0f172a;
    color:#ffffff;
    padding:9px 20px;
    border-radius:999px;
    font-weight:600;
    font-size:0.85rem;
    text-decoration:none;
    white-space:nowrap;
    flex-shrink:0;
}
.btn-add-job:hover{
    background:#1e293b;
    color:#ffffff;
}

/* ===== FEED JOBURI (stil aplicatie mobila) ===== */
.job-feed{
    max-width:560px;
    margin:0 auto;
    display:flex;
    flex-direction:column;
    gap:14px;
}
.job-card{
    display:block;
    border:1px solid #e2e8f0;
    border-radius:14px;
    padding:16px 18px;
    background:#ffffff;
    text-decoration:none;
    color:inherit;
    box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 2px 8px rgba(15,23,42,0.04);
    transition:border-color .2s ease, box-shadow .2s ease;
}
.job-card:hover{
    border-color:#1e293b;
    box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 6px 20px rgba(15,23,42,0.08);
}

.job-card-top{
    display:flex;
    align-items:center;
    gap:12px;
    margin-bottom:12px;
}

.job-card-heading{
    flex:1;
    min-width:0;
}
.job-title{
    font-size:1rem;
    font-weight:700;
    color:#0f172a;
    margin:0;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
.job-company{
    color:#64748b;
    font-weight:500;
    font-size:0.82rem;
}
.card-chevron{
    flex-shrink:0;
    color:#cbd5e1;
    font-size:1.4rem;
    line-height:1;
}
.job-desc{
    color:#334155;
    font-size:0.85rem;
    line-height:1.5;
    margin:0 0 12px;
    display:-webkit-box;
    -webkit-line-clamp:2;
    -webkit-box-orient:vertical;
    overflow:hidden;
}
.tech-pills{
    display:flex;
    flex-wrap:wrap;
    gap:6px;
    margin-bottom:12px;
}
.tech-pill{
    background:#f1f5f9;
    border:1px solid #e2e8f0;
    color:#334155;
    border-radius:6px;
    padding:3px 10px;
    font-size:0.72rem;
    font-weight:500;
}

.job-card-footer{
    display:flex;
    align-items:center;
    justify-content:space-between;
    gap:10px;
}
.exp-badge{
    color:#475569;
    background:#f1f5f9;
    font-size:0.72rem;
    font-weight:600;
    padding:4px 11px;
    border-radius:999px;
    white-space:nowrap;
}
.posted-time{
    color:#94a3b8;
    font-size:0.76rem;
    font-weight:500;
    white-space:nowrap;
}
</style>
</head>

<body>

<nav class="navbar navbar-expand-lg">
<div class="container nav-wrap">
<a class="navbar-brand fs-4" href="/homePage">
JOB PORTAL</a>

<form action="/searchJobs" method="GET" class="nav-search">
<input type="text" name="keyword" placeholder="Search...">
</form>

<div class="nav-actions">
<a class="nav-btn" href="/homePage">Home</a>
<a class="nav-btn" href="/viewAllJobs">Jobs</a>
<c:if test="${userRole == 'COMPANIE'}">
<a class="nav-btn" href="/searchCandidates">Network</a>
</c:if>
<a class="nav-btn" href="/messages">Messaging</a>
</div>
</div>
</nav>

<div class="container mt-5">

<div class="jobs-page-header">
<h2 class="page-title">
<c:choose>
<c:when test="${not empty keyword}">Search results for: ${keyword}</c:when>
<c:otherwise>All Jobs</c:otherwise>
</c:choose>
</h2>
<c:if test="${userRole == 'COMPANIE'}">
<a href="/addJob" class="btn-add-job">+ Add Job</a>
</c:if>
</div>

<div class="job-feed">
<c:forEach var="job" items="${jobs}">
<a href="/viewJob?id=${job.postId}" class="job-card">

<div class="job-card-top">
<div class="job-card-heading">
<h5 class="job-title">${job.postProfile}</h5>
<div class="job-company">${job.companyName}</div>
</div>

<span class="card-chevron">&rsaquo;</span>
</div>

<p class="job-desc">${job.postDesc}</p>

<div class="tech-pills">
<c:forEach var="tech" items="${job.postTechStack}">
<span class="tech-pill">${tech}</span>
</c:forEach>
</div>

<div class="job-card-footer">
<span class="exp-badge">${job.experienceLevel}</span>
<c:if test="${not empty job.timeAgo}">
<span class="posted-time">
<c:choose>
<c:when test="${job.timeAgo == 'just now'}">Posted just now</c:when>
<c:otherwise>Posted ${job.timeAgo} ago</c:otherwise>
</c:choose>
</span>
</c:if>
</div>

</a>
</c:forEach>
</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>
