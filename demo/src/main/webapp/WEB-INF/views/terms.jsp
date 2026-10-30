<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Terms &amp; Conditions · Job Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="/images/favicon.png">

<style>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@700&display=swap');

body{
    font-family:'Inter',-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;
    background:#e2e8f0;
    color:#0f172a;
    margin:0;
}

.navbar{
    background:#ffffff !important;
    border-bottom:1px solid #e2e8f0;
    position:sticky;
    top:0;
    z-index:10;
}
.navbar-brand{
    font-family:'Poppins',sans-serif;
    font-weight:700;
    color:#0f172a !important;
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

.legal-sheet{
    max-width:760px;
    margin:48px auto 0;
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-radius:14px;
    box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 4px 14px rgba(15,23,42,0.05);
    padding:48px;
}
.legal-sheet h1{
    font-size:1.7rem;
    font-weight:700;
    color:#0f172a;
    margin:0 0 6px;
}
.legal-updated{
    color:#94a3b8;
    font-size:0.82rem;
    margin:0 0 32px;
}
.legal-section{
    margin-bottom:26px;
}
.legal-section:last-child{
    margin-bottom:0;
}
.legal-section h2{
    font-size:1rem;
    font-weight:700;
    color:#0f172a;
    margin:0 0 10px;
}
.legal-section p{
    color:#334155;
    font-size:0.9rem;
    line-height:1.7;
    margin:0 0 10px;
}
.legal-section p:last-child{
    margin-bottom:0;
}
</style>
</head>

<body>

<nav class="navbar navbar-expand-lg">
<div class="container nav-wrap">
<a class="navbar-brand" href="/homePage">
JOBPORTAL</a>

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

<div class="container">
<div class="legal-sheet">

<h1>Terms &amp; Conditions</h1>
<p class="legal-updated">Last updated: January 2026</p>

<div class="legal-section">
<h2>1. Acceptance of Terms</h2>
<p>By creating an account or using JobPortal in any way, you agree to be bound by these Terms &amp; Conditions. If you do not agree with any part of these terms, please do not use the platform.</p>
</div>

<div class="legal-section">
<h2>2. Who Can Use JobPortal</h2>
<p>JobPortal is available to individuals seeking employment opportunities and to companies seeking to list open roles. You must provide accurate information when creating your account and keep it up to date.</p>
</div>

<div class="legal-section">
<h2>3. Accounts &amp; Security</h2>
<p>You are responsible for maintaining the confidentiality of your login credentials and for all activity that occurs under your account. Notify us immediately if you suspect unauthorized use of your account.</p>
</div>

<div class="legal-section">
<h2>4. Job Postings &amp; Content</h2>
<p>Companies are responsible for the accuracy of the job listings they publish. Candidates are responsible for the accuracy of the profile information, documents and posts they share on the platform. Content that is false, misleading or discriminatory may be removed at our discretion.</p>
</div>

<div class="legal-section">
<h2>5. Acceptable Use</h2>
<p>You agree not to misuse the platform, including attempting to access accounts that are not your own, scraping data without permission, or posting content that is unlawful, abusive or infringes on the rights of others.</p>
</div>

<div class="legal-section">
<h2>6. Limitation of Liability</h2>
<p>JobPortal is provided "as is" without warranties of any kind. We are not responsible for the outcome of any application, hiring decision, or interaction between candidates and companies facilitated through the platform.</p>
</div>

<div class="legal-section">
<h2>7. Changes to These Terms</h2>
<p>We may update these Terms &amp; Conditions from time to time. Continued use of JobPortal after changes are posted constitutes acceptance of the revised terms.</p>
</div>

<div class="legal-section">
<h2>8. Contact</h2>
<p>If you have questions about these Terms &amp; Conditions, you can reach us through the contact details listed on our platform.</p>
</div>

</div>
</div>

<%@ include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>
