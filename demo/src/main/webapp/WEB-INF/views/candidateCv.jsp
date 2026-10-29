<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><c:if test="${not empty candidate}">${candidate.username} &middot; </c:if>CV</title>

<link rel="icon" type="image/png" href="/images/favicon.png">

<style>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

body{
    font-family:'Inter',-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;
    margin:0;
    min-height:100vh;
    color:#0f172a;
    background:#e2e8f0;
}

.cv-topbar{
    max-width:720px;
    margin:0 auto;
    padding:28px 20px 0;
    display:flex;
    justify-content:space-between;
    align-items:center;
}
.back-link{
    color:#1e293b;
    font-weight:600;
    font-size:0.88rem;
    text-decoration:none;
}
.back-link:hover{
    text-decoration:underline;
}
.btn-download{
    background:#0f172a;
    border:none;
    border-radius:999px;
    padding:10px 22px;
    color:#ffffff;
    font-weight:600;
    font-size:0.85rem;
    cursor:pointer;
}
.btn-download:hover{
    background:#1e293b;
}

.cv-sheet{
    max-width:720px;
    margin:20px auto 60px;
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-radius:10px;
    box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 4px 14px rgba(15,23,42,0.05);
    padding:48px;
}
.cv-header{
    border-bottom:2px solid #0f172a;
    padding-bottom:18px;
    margin-bottom:28px;
}
.cv-name{
    font-size:1.9rem;
    font-weight:700;
    color:#0f172a;
    margin:0;
}

.cv-section{
    margin-bottom:26px;
}
.cv-section:last-child{
    margin-bottom:0;
}
.cv-section h3{
    font-size:0.78rem;
    font-weight:700;
    letter-spacing:0.08em;
    text-transform:uppercase;
    color:#64748b;
    margin:0 0 12px;
}
.cv-list{
    white-space:pre-line;
    color:#0f172a;
    font-size:0.92rem;
    line-height:1.8;
    margin:0;
}
.tech-pills{
    display:flex;
    flex-wrap:wrap;
    gap:8px;
}
.tech-pill{
    background:#f1f5f9;
    border:1px solid #e2e8f0;
    color:#334155;
    border-radius:6px;
    padding:5px 14px;
    font-size:0.82rem;
    font-weight:500;
}

.empty-state{
    text-align:center;
    color:#64748b;
    padding:80px 0;
}

@media print{
    body{
        background:#ffffff;
    }
    .cv-topbar{
        display:none;
    }
    .site-footer{
        display:none;
    }
    .site-footer{
        display:none;
    }
    .cv-sheet{
        box-shadow:none;
        border:none;
        margin:0;
        max-width:100%;
        padding:0;
    }
}
</style>
</head>

<body>

<div class="cv-topbar">
<a class="back-link" href="/searchCandidates">&larr; Back to Network</a>
<button type="button" class="btn-download" onclick="window.print()">Download</button>
</div>

<c:if test="${empty candidate}">
<div class="cv-sheet">
<div class="empty-state">This candidate could not be found.</div>
</div>
</c:if>

<c:if test="${not empty candidate}">
<div class="cv-sheet">

<div class="cv-header">
<h1 class="cv-name">@<c:out value="${candidate.username}"/></h1>
</div>

<c:if test="${not empty candidate.skills}">
<div class="cv-section">
<h3>Skills</h3>
<div class="tech-pills">
<c:forEach var="skill" items="${candidate.skills.split(',')}">
<c:if test="${not empty skill.trim()}">
<span class="tech-pill"><c:out value="${skill.trim()}"/></span>
</c:if>
</c:forEach>
</div>
</div>
</c:if>

<c:if test="${not empty candidate.experience}">
<div class="cv-section">
<h3>Experience</h3>
<p class="cv-list"><c:out value="${candidate.experience}"/></p>
</div>
</c:if>

<c:if test="${not empty candidate.education}">
<div class="cv-section">
<h3>Education</h3>
<p class="cv-list"><c:out value="${candidate.education}"/></p>
</div>
</c:if>

<c:if test="${not empty candidate.languages}">
<div class="cv-section">
<h3>Languages</h3>
<p class="cv-list"><c:out value="${candidate.languages}"/></p>
</div>
</c:if>

<c:if test="${not empty candidate.certifications}">
<div class="cv-section">
<h3>Certifications</h3>
<p class="cv-list"><c:out value="${candidate.certifications}"/></p>
</div>
</c:if>

</div>
</c:if>

<%@ include file="/WEB-INF/views/footer.jspf" %>

<%@ include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>
