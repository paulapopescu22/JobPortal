<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Privacy Policy · Job Portal</title>

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
.legal-section ul{
    color:#334155;
    font-size:0.9rem;
    line-height:1.7;
    margin:0 0 10px;
    padding-left:20px;
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

<h1>Privacy Policy</h1>
<p class="legal-updated">Last updated: January 2026</p>

<div class="legal-section">
<h2>1. Information We Collect</h2>
<p>We collect information you provide directly, such as your name, email, skills, education, experience, uploaded documents and profile photo, as well as information generated through your use of the platform, such as posts, comments and likes.</p>
</div>

<div class="legal-section">
<h2>2. How We Use Your Information</h2>
<ul>
<li>To create and manage your account</li>
<li>To match candidates with relevant job opportunities</li>
<li>To display your profile and activity to other users as intended by the platform's features</li>
<li>To maintain the security and integrity of the platform</li>
</ul>
</div>

<div class="legal-section">
<h2>3. Sharing of Information</h2>
<p>Information you choose to make visible on your profile, such as your skills, experience and CV, may be viewed by companies using the platform. We do not sell your personal information to third parties.</p>
</div>

<div class="legal-section">
<h2>4. Cookies</h2>
<p>JobPortal uses essential cookies to keep you signed in and to remember your session. We do not use cookies for third-party advertising.</p>
</div>

<div class="legal-section">
<h2>5. Data Security</h2>
<p>We take reasonable technical measures to protect your information, including password hashing and access controls. No method of transmission or storage is completely secure, but we work to protect your data to industry standards.</p>
</div>

<div class="legal-section">
<h2>6. Your Rights</h2>
<p>You can review and update most of your information at any time from your profile. You may also request that your account and associated data be deleted by contacting us.</p>
</div>

<div class="legal-section">
<h2>7. Changes to This Policy</h2>
<p>We may update this Privacy Policy from time to time. We encourage you to review this page periodically for the latest information on our privacy practices.</p>
</div>

<div class="legal-section">
<h2>8. Contact</h2>
<p>If you have questions about this Privacy Policy or how your data is handled, you can reach us through the contact details listed on our platform.</p>
</div>

</div>
</div>

<%@ include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>
