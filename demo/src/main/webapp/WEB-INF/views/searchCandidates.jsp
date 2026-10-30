<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Candidates</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="/images/favicon.png">

<style>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@700&display=swap');

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
.page-title{
    font-size:1.7rem;
    font-weight:700;
    margin-bottom:28px;
    color:#0f172a;
}

/* ===== SEARCH (sus) ===== */
.search-box{
    max-width:600px;
    margin:0 0 50px;
}
.search-box .form-control{
    background:#ffffff;
    border:1px solid #e2e8f0;
    color:#0f172a;
    border-radius:999px;
    padding:14px 22px;
}
.search-box .form-control:focus{
    border-color:#1e293b;
    outline:none;
}
.search-box .btn-main{
    padding:10px 20px;
    font-size:0.85rem;
    flex-shrink:0;
}
.btn-main{
    background:#0f172a;
    border:none;
    padding:12px 26px;
    border-radius:999px;
    color:white;
    font-weight:600;
}
.btn-main:hover{
    background:#1e293b;
    color:white;
}

/* ===== CARD CANDIDAT ===== */
.card-custom{
    position:relative;
    border:1px solid #e2e8f0;
    border-radius:10px;
    padding:22px;
    background:#ffffff;
    box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 2px 8px rgba(15,23,42,0.04);
    transition:border-color .2s ease, box-shadow .2s ease;
    height:100%;
}
.card-custom:hover{
    border-color:#1e293b;
    box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 6px 20px rgba(15,23,42,0.08);
}
.candidate-header{
    display:flex;
    align-items:flex-start;
    gap:14px;
    margin-bottom:14px;
}
.candidate-avatar{
    width:54px;
    height:54px;
    border-radius:50%;
    background:#f1f5f9;
    border:2px solid #e2e8f0;
    overflow:hidden;
    flex-shrink:0;
}
.candidate-avatar img,
.candidate-avatar svg{
    width:100%;
    height:100%;
    display:block;
    object-fit:cover;
}
.candidate-info{
    min-width:0;
}
.candidate-name{
    font-weight:700;
    font-size:1.05rem;
    color:#0f172a;
    margin:0;
}
.candidate-headline{
    color:#475569;
    font-size:0.82rem;
    font-weight:500;
    margin:3px 0 0;
    white-space:pre-line;
    overflow:hidden;
    display:-webkit-box;
    -webkit-line-clamp:1;
    -webkit-box-orient:vertical;
}
.candidate-meta{
    color:#94a3b8;
    font-size:0.78rem;
    margin:2px 0 0;
    white-space:pre-line;
    overflow:hidden;
    display:-webkit-box;
    -webkit-line-clamp:1;
    -webkit-box-orient:vertical;
}

/* ===== PILLS ===== */
.pill-row{
    display:flex;
    flex-wrap:wrap;
    gap:6px;
    margin-bottom:16px;
    min-height:26px;
}
.pill{
    background:#f1f5f9;
    border:1px solid #e2e8f0;
    color:#334155;
    border-radius:6px;
    padding:4px 12px;
    font-size:0.76rem;
    font-weight:500;
}
.no-skills{
    color:#94a3b8;
    font-size:0.82rem;
}

/* ===== ACTIONS ===== */
.card-actions{
    display:flex;
    flex-direction:column;
    gap:8px;
}
.btn-outline{
    display:block;
    text-align:center;
    background:#ffffff;
    border:1px solid #e2e8f0;
    color:#1e293b;
    border-radius:999px;
    padding:10px 20px;
    font-weight:600;
    font-size:0.85rem;
    text-decoration:none;
}
.btn-outline:hover{
    background:#f1f5f9;
    border-color:#1e293b;
    color:#1e293b;
}

/* ===== EMPTY STATE ===== */
.empty-state{
    text-align:center;
    color:#64748b;
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

<div class="container mt-5">

<c:if test="${not empty keyword}">
<h2 class="page-title">Results for: ${keyword}</h2>
</c:if>

<div class="search-box">
<form action="/searchCandidates" method="GET" class="d-flex gap-2">
<input name="keyword" class="form-control" placeholder="Search by skill..." value="${keyword}">
<button class="btn btn-main">Search</button>
</form>
</div>

<c:if test="${empty candidates}">
<div class="empty-state">No candidates found.</div>
</c:if>

<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
<c:forEach var="c" items="${candidates}">
<div class="col">
<div class="card-custom">

<div class="candidate-header">
<div class="candidate-avatar">
<c:choose>
<c:when test="${not empty c.photoPath}">
<img src="${c.photoPath}" alt="candidate photo">
</c:when>
<c:otherwise>
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
<rect width="100" height="100" fill="${c.avatarBgHex}"/>
<path d="M12,100 L12,82 Q12,62 50,62 Q88,62 88,82 L88,100 Z" fill="${c.avatarShirtHex}"/>
<circle cx="50" cy="38" r="22" fill="${c.avatarSkinHex}"/>
<c:if test="${c.avatarHairStyle == 1}">
<rect x="28" y="16" width="44" height="16" rx="10" fill="${c.avatarHairHex}"/>
</c:if>
<c:if test="${c.avatarHairStyle == 2}">
<rect x="24" y="12" width="52" height="22" rx="14" fill="${c.avatarHairHex}"/>
</c:if>
<c:if test="${c.avatarHairStyle == 3}">
<rect x="26" y="14" width="48" height="19" rx="18" fill="${c.avatarHairHex}"/>
<rect x="22" y="26" width="10" height="20" rx="5" fill="${c.avatarHairHex}"/>
<rect x="68" y="26" width="10" height="20" rx="5" fill="${c.avatarHairHex}"/>
</c:if>
</svg>
</c:otherwise>
</c:choose>
</div>
<div class="candidate-info">
<p class="candidate-name">@<c:out value="${c.username}"/></p>
<c:if test="${not empty c.experience}">
<p class="candidate-headline"><c:out value="${c.experience}"/></p>
</c:if>
<c:if test="${not empty c.education}">
<p class="candidate-meta"><c:out value="${c.education}"/></p>
</c:if>
</div>
</div>

<div class="pill-row">
<c:if test="${empty c.skills}">
<span class="no-skills">No skills added</span>
</c:if>
<c:if test="${not empty c.skills}">
<c:forEach var="skill" items="${c.skills.split(',')}">
<c:if test="${not empty skill.trim()}">
<span class="pill"><c:out value="${skill.trim()}"/></span>
</c:if>
</c:forEach>
</c:if>
</div>

<div class="card-actions">
<a href="/candidateCv?username=${c.username}" class="btn btn-main w-100">View CV</a>
<a href="/messages" class="btn-outline">Message</a>
</div>

</div>
</div>
</c:forEach>
</div>

</div>

<%@ include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>
