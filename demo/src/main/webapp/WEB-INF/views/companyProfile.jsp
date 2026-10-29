<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Company Profile · Job Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="/images/favicon.png">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap');

body{
    font-family: Arial, Helvetica, sans-serif;
    background:#e2e8f0;
    color:#0f172a;
    margin:0;
}

/* ===== NAVBAR ===== */
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
    border-color:#334155;
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
    background:#475569;
    color:#ffffff !important;
    padding:7px 18px;
    border-radius:999px;
    font-weight:600;
}
.nav-btn-primary:hover{
    background:#334155;
}

/* ===== ALERT ===== */
.alert-tech{
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-left:3px solid #1e293b;
    color:#334155;
    border-radius:6px;
    padding:12px 18px;
    margin-bottom:28px;
}

/* ===== CARD ===== */
.glass{
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-radius:10px;
    box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 4px 14px rgba(15,23,42,0.05);
    padding:28px;
    margin-bottom:24px;
    color:#0f172a;
}
.glass h3{
    font-size:1.05rem;
    font-weight:600;
    margin-bottom:6px;
    color:#0f172a;
}
.glass .hint{
    color:#64748b;
    font-size:0.82rem;
    margin-bottom:18px;
}

/* ===== LOGO ===== */
.logo-wrap{
    text-align:center;
}
.logo-preview{
    width:140px;
    height:140px;
    border-radius:8px;
    object-fit:cover;
    background:#f1f5f9;
    border:3px solid #e2e8f0;
    display:flex;
    align-items:center;
    justify-content:center;
    margin:0 auto 18px;
    overflow:hidden;
}
.username-tag{
    color:#64748b;
    font-size:0.85rem;
    margin-bottom:18px;
}

/* ===== FILE UPLOAD BUTTON ===== */
.upload-btn{
    display:inline-flex;
    align-items:center;
    justify-content:center;
    gap:8px;
    background:#f1f5f9;
    border:1px solid #e2e8f0;
    color:#475569;
    border-radius:999px;
    padding:9px 16px;
    font-size:0.85rem;
    font-weight:500;
    cursor:pointer;
    transition:.2s ease;
    width:100%;
}
.upload-btn:hover{
    background:#e2e8f0;
}
input[type="file"]{
    display:none;
}

/* ===== INPUTS ===== */
.form-control, textarea.form-control{
    background:#f8fafc;
    border:1px solid #e2e8f0;
    color:#0f172a;
    border-radius:6px;
    padding:12px 14px;
}
.form-control:focus{
    background:#f8fafc;
    color:#0f172a;
    border-color:#1e293b;
    outline:none;
}
.form-control::placeholder{
    color:#94a3b8;
}
label.field-label{
    font-size:0.82rem;
    font-weight:600;
    color:#334155;
    margin-bottom:8px;
    display:block;
}
.field-group{
    margin-bottom:20px;
}

/* ===== SAVE BUTTON ===== */
.btn-main{
    background:#475569;
    border:none;
    padding:13px 30px;
    border-radius:999px;
    color:white;
    font-weight:600;
    transition:0.25s;
    width:100%;
    font-size:0.95rem;
}
.btn-main:hover{
    background:#334155;
}

.section-grid{
    display:grid;
    grid-template-columns:300px 1fr;
    gap:24px;
    align-items:start;
}
@media (max-width:860px){
    .section-grid{
        grid-template-columns:1fr;
    }
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
<c:if test="${userRole == 'COMPANIE'}">
<a class="nav-btn nav-btn-primary" href="/addJob">Add Job</a>
</c:if>
</div>
</div>
</nav>

<div class="container mt-5">

<c:if test="${param.updated == 'true'}">
<div class="alert-tech">Profile updated successfully.</div>
</c:if>

<form action="/companyProfile" method="post" enctype="multipart/form-data">

<div class="section-grid">

<!-- LEFT: logo -->
<div>
<div class="glass logo-wrap">
<div class="logo-preview" id="logoPreview">
<c:if test="${not empty companyProfile.logoPath}">
<img src="${companyProfile.logoPath}" alt="company logo" style="width:100%;height:100%;object-fit:cover;">
</c:if>
</div>
<div class="username-tag">@<c:out value="${companyProfile.username}"/></div>
<label class="upload-btn" for="logoInput">Change logo</label>
<input type="file" id="logoInput" name="logo" accept="image/*">
</div>
</div>

<!-- RIGHT: company details -->
<div>
<div class="glass">
<h3>Company Details</h3>
<p class="hint">This information is shown to candidates viewing the company's jobs</p>

<div class="field-group">
<label class="field-label" for="companyCode">Registration Number</label>
<input type="text" class="form-control" id="companyCode" name="companyCode" value="${companyProfile.companyCode}" placeholder="123456789">
</div>

<div class="field-group">
<label class="field-label" for="website">Website</label>
<input type="url" class="form-control" id="website" name="website" value="${companyProfile.website}" placeholder="https://my-company.com">
</div>

<div class="field-group" style="margin-bottom:0;">
<label class="field-label" for="description">Company Description</label>
<textarea class="form-control" id="description" name="description" rows="5" placeholder="What your company does, what you're looking for in candidates, what you offer...">${companyProfile.description}</textarea>
</div>
</div>

<button type="submit" class="btn-main">Save profile</button>

</div>
</div>

</form>

</div>

<script>
document.getElementById('logoInput').addEventListener('change', function(e){
    var file = e.target.files[0];
    if (!file) return;
    var reader = new FileReader();
    reader.onload = function(ev){
        var wrap = document.getElementById('logoPreview');
        wrap.innerHTML = '<img src="' + ev.target.result + '" style="width:100%;height:100%;object-fit:cover;">';
    };
    reader.readAsDataURL(file);
});
</script>

<%@ include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>
