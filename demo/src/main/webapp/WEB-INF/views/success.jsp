<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job posted · Job Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="/images/favicon.png">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap');

body{
    font-family: Arial, Helvetica, sans-serif;
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

/* ===== CONFIRMATION ===== */
.confirm-wrap{
    max-width:600px;
    margin:70px auto 0;
    text-align:center;
}
.confirm-title{
    font-size:1.8rem;
    font-weight:700;
    color:#0f172a;
    margin-bottom:30px;
}

.job-card{
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-radius:10px;
    box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 4px 14px rgba(15,23,42,0.05);
    padding:28px;
    text-align:left;
    margin-bottom:24px;
}
.job-card h5{
    font-weight:700;
    color:#0f172a;
    margin-bottom:4px;
}
.job-card .company{
    color:#64748b;
    font-weight:600;
    font-size:0.9rem;
    margin-bottom:14px;
}
.job-card .label{
    font-weight:600;
    color:#0f172a;
}
.job-card p{
    color:#0f172a;
}
.tech-pills{
    display:flex;
    flex-wrap:wrap;
    gap:8px;
    margin-top:8px;
}
.tech-pill{
    background:#f1f5f9;
    border:1px solid #e2e8f0;
    color:#0f172a;
    border-radius:6px;
    padding:4px 12px;
    font-size:0.78rem;
}

.btn-main{
    background:#0f172a;
    border:none;
    padding:12px 26px;
    border-radius:6px;
    color:#fff;
    font-weight:600;
    text-decoration:none;
    display:inline-block;
    margin:0 6px;
}
.btn-main:hover{
    background:#1e293b;
    color:#fff;
}
.btn-secondary-link{
    color:#475569;
    font-weight:600;
    text-decoration:none;
    display:inline-block;
    margin:0 6px;
    padding:12px 10px;
}
.btn-secondary-link:hover{
    text-decoration:underline;
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
<c:if test="${userRole == 'COMPANIE'}">
<a class="nav-btn nav-btn-primary" href="/addJob">Add Job</a>
</c:if>
</div>
</div>
</nav>

<div class="container">
<div class="confirm-wrap">

<div class="confirm-title">Your job was posted successfully</div>

<c:if test="${not empty jobPost}">
<div class="job-card">
<h5>${jobPost.postProfile}</h5>
<div class="company">${jobPost.companyName}</div>

<p><span class="label">Experience level:</span> ${jobPost.experienceLevel}</p>
<p><span class="label">Description:</span> ${jobPost.postDesc}</p>

<p class="label" style="margin-bottom:0;">Technologies:</p>
<div class="tech-pills">
<c:forEach var="tech" items="${jobPost.postTechStack}">
<span class="tech-pill">${tech}</span>
</c:forEach>
</div>
</div>
</c:if>

<a href="/viewAllJobs" class="btn-main">View all jobs</a>
<a href="/addJob" class="btn-secondary-link">Post another job</a>

</div>
</div>

<%@ include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>
