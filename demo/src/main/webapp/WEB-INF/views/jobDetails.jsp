<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><c:if test="${not empty job}">${job.postProfile} · </c:if>Job Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="/images/favicon.png">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

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

/* ===== BACK LINK ===== */
.back-link{
    display:inline-flex;
    align-items:center;
    gap:6px;
    color:#1e293b;
    font-weight:600;
    font-size:0.88rem;
    text-decoration:none;
    margin-bottom:24px;
}
.back-link:hover{
    text-decoration:underline;
}

/* ===== HEADER CARD ===== */
.job-header-card{
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-radius:10px;
    box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 4px 14px rgba(15,23,42,0.05);
    padding:32px;
    margin-bottom:24px;
}
.job-header-top{
    display:flex;
    gap:22px;
    align-items:flex-start;
    flex-wrap:wrap;
}

/* ===== OWNER MENU (edit/delete) ===== */
.post-menu-wrap{
    position:relative;
    flex-shrink:0;
}
.post-menu-btn{
    display:inline-flex;
    align-items:center;
    justify-content:center;
    width:34px;
    height:34px;
    border-radius:50%;
    background:none;
    border:none;
    color:#94a3b8;
    font-size:1.2rem;
    font-weight:700;
    line-height:1;
    cursor:pointer;
}
.post-menu-btn:hover{
    background:#f1f5f9;
    color:#1e293b;
}
.post-menu-toggle{
    display:none;
}
.post-menu{
    display:none;
    flex-direction:column;
    gap:2px;
    position:absolute;
    top:calc(100% + 6px);
    right:0;
    min-width:150px;
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-radius:12px;
    box-shadow:0 4px 16px rgba(15,23,42,0.12);
    padding:8px;
    z-index:6;
}
.post-menu-toggle:checked ~ .post-menu{
    display:flex;
}
.post-menu-option{
    display:flex;
    align-items:center;
    gap:10px;
    width:100%;
    background:none;
    border:none;
    text-align:left;
    color:#1e293b;
    font-weight:600;
    font-size:0.83rem;
    padding:9px 10px;
    border-radius:8px;
    cursor:pointer;
    text-decoration:none;
    font-family:inherit;
}
.post-menu-option:hover{
    background:#f1f5f9;
}
.post-menu-option svg{
    flex-shrink:0;
    color:#64748b;
}
.delete-confirm-toggle{
    display:none;
}
.delete-confirm-toggle:checked ~ .menu-default{
    display:none;
}
.delete-confirm-box{
    display:none;
}
.delete-confirm-toggle:checked ~ .delete-confirm-box{
    display:block;
    padding:4px 10px 6px;
}
.delete-confirm-text{
    margin:0 0 10px;
    color:#1e293b;
    font-size:0.8rem;
    font-weight:500;
    line-height:1.4;
}
.delete-confirm-actions{
    display:flex;
    gap:8px;
}
.delete-confirm-form{
    flex:1;
    display:flex;
}
.btn-cancel-mini, .btn-confirm-mini{
    flex:1;
    text-align:center;
    padding:7px 0;
    border-radius:7px;
    font-size:0.78rem;
    font-weight:600;
    cursor:pointer;
    border:1px solid #e2e8f0;
    background:#ffffff;
    color:#1e293b;
    font-family:inherit;
}
.btn-cancel-mini:hover{
    background:#f1f5f9;
}
.btn-confirm-mini{
    width:100%;
    background:#0f172a;
    color:#ffffff;
    border-color:#0f172a;
}
.btn-confirm-mini:hover{
    background:#1e293b;
}

.job-header-info{
    flex:1;
    min-width:200px;
}
.job-title-lg{
    font-size:1.8rem;
    font-weight:700;
    color:#0f172a;
    margin:0 0 6px;
}
.job-company-lg{
    color:#1e293b;
    font-weight:600;
    font-size:1rem;
    margin-bottom:14px;
}
.job-meta-row{
    display:flex;
    flex-wrap:wrap;
    gap:10px;
    align-items:center;
}
.exp-badge{
    color:#0f172a;
    font-size:0.82rem;
    font-weight:600;
}
.posted-time-lg{
    color:#94a3b8;
    font-size:0.82rem;
    font-weight:500;
}

/* ===== CONTENT CARD ===== */
.content-card{
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-radius:10px;
    box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 4px 14px rgba(15,23,42,0.05);
    padding:32px;
    margin-bottom:24px;
}
.content-card h3{
    font-size:1.1rem;
    font-weight:700;
    color:#0f172a;
    margin-bottom:16px;
}
.job-description{
    color:#0f172a;
    font-size:0.98rem;
    line-height:1.7;
}
.tech-pills{
    display:flex;
    flex-wrap:wrap;
    gap:10px;
}
.tech-pill{
    background:#f1f5f9;
    border:1px solid #e2e8f0;
    color:#0f172a;
    border-radius:6px;
    padding:6px 16px;
    font-size:0.84rem;
    font-weight:500;
}

/* ===== EMPTY STATE ===== */
.empty-state{
    text-align:center;
    color:#0f172a;
    padding:60px 0;
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

<div class="container mt-5" style="max-width:800px;">

<a class="back-link" href="/viewAllJobs">&larr; Back to all jobs</a>

<c:if test="${empty job}">
<div class="empty-state">This job posting was not found.</div>
</c:if>

<c:if test="${not empty job}">

<div class="job-header-card">
<div class="job-header-top">

<div class="job-header-info">
<h1 class="job-title-lg">${job.postProfile}</h1>
<div class="job-company-lg">${job.companyName}</div>
<div class="job-meta-row">
<span class="exp-badge">${job.experienceLevel}</span>
<c:if test="${not empty job.timeAgo}">
<span class="posted-time-lg">
<c:choose>
<c:when test="${job.timeAgo == 'just now'}">&middot; Posted just now</c:when>
<c:otherwise>&middot; Posted ${job.timeAgo} ago</c:otherwise>
</c:choose>
</span>
</c:if>
</div>
</div>

<c:if test="${not empty currentUsername && job.authorUsername == currentUsername}">
<div class="post-menu-wrap">
<input type="checkbox" id="job-menu-toggle" class="post-menu-toggle">
<label for="job-menu-toggle" class="post-menu-btn">&#8942;</label>
<div class="post-menu">
<input type="checkbox" id="job-delete-confirm" class="delete-confirm-toggle">
<a href="/editJob?id=${job.postId}" class="post-menu-option menu-default">
<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4Z"/></svg>
Edit
</a>
<label for="job-delete-confirm" class="post-menu-option menu-default">
<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"/><path d="M19 6l-1 14a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2L5 6"/><path d="M10 11v6"/><path d="M14 11v6"/><path d="M9 6V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/></svg>
Delete
</label>
<div class="delete-confirm-box">
<p class="delete-confirm-text">Delete this job posting? This cannot be undone.</p>
<div class="delete-confirm-actions">
<label for="job-delete-confirm" class="btn-cancel-mini">Cancel</label>
<form action="/deleteJob?id=${job.postId}" method="POST" class="delete-confirm-form">
<button type="submit" class="btn-confirm-mini">Delete</button>
</form>
</div>
</div>
</div>
</div>
</c:if>

</div>
</div>

<div class="content-card">
<h3>About the job</h3>
<p class="job-description">${job.postDesc}</p>
</div>

<div class="content-card">
<h3>Required technologies</h3>
<div class="tech-pills">
<c:forEach var="tech" items="${job.postTechStack}">
<span class="tech-pill">${tech}</span>
</c:forEach>
</div>
</div>

</c:if>

</div>

<%@ include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>
