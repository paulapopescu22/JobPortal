<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ro">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Profilul meu · Job Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="/images/favicon.png">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

body{
    font-family:'Poppins',sans-serif;
    background:#f8fafc;
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
    font-weight:700;
    color:#0f172a !important;
    letter-spacing:0.5px;
}
.nav-link{
    color:#64748b !important;
    font-weight:500;
    transition:color .2s ease;
}
.nav-link:hover, .nav-link.active{
    color:#3b82f6 !important;
}

/* ===== HEADER ===== */
.page-header{
    text-align:center;
    margin:60px 0 40px;
}
.badge-tech{
    display:block;
    font-size:0.8rem;
    font-weight:600;
    letter-spacing:1px;
    text-transform:uppercase;
    color:#3b82f6;
    margin-bottom:12px;
}
.page-header h1{
    font-size:2.4rem;
    font-weight:700;
    margin-bottom:8px;
    color:#0f172a;
}
.page-header p{
    color:#64748b;
}

/* ===== ALERT ===== */
.alert-tech{
    background:#eff6ff;
    border:1px solid #bfdbfe;
    color:#1d4ed8;
    border-radius:12px;
    padding:14px 20px;
    max-width:600px;
    margin:0 auto 30px;
    text-align:center;
}

/* ===== CARD ===== */
.glass{
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-radius:18px;
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

/* ===== AVATAR ===== */
.avatar-wrap{
    text-align:center;
}
.avatar{
    width:140px;
    height:140px;
    border-radius:50%;
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
    background:#eff6ff;
    border:1px solid #bfdbfe;
    color:#1d4ed8;
    border-radius:10px;
    padding:9px 16px;
    font-size:0.85rem;
    font-weight:500;
    cursor:pointer;
    transition:.2s ease;
    width:100%;
}
.upload-btn:hover{
    background:#dbeafe;
}
input[type="file"]{
    display:none;
}
.file-current{
    display:flex;
    align-items:center;
    gap:8px;
    background:#f8fafc;
    border:1px solid #e2e8f0;
    border-radius:10px;
    padding:10px 14px;
    font-size:0.85rem;
    color:#334155;
    margin-bottom:14px;
    word-break:break-all;
}
.file-current a{
    color:#2563eb;
    text-decoration:none;
    font-weight:600;
}
.file-current a:hover{
    text-decoration:underline;
}

/* ===== INPUTS ===== */
.form-control, textarea.form-control{
    background:#f8fafc;
    border:1px solid #e2e8f0;
    color:#0f172a;
    border-radius:10px;
    padding:12px 14px;
}
.form-control:focus{
    background:#f8fafc;
    color:#0f172a;
    border-color:#3b82f6;
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

/* ===== SKILL PILLS ===== */
.pill-row{
    display:flex;
    flex-wrap:wrap;
    gap:8px;
    margin-top:12px;
    min-height:28px;
}
.pill{
    background:#eff6ff;
    border:1px solid #bfdbfe;
    color:#1d4ed8;
    border-radius:999px;
    padding:4px 14px;
    font-size:0.78rem;
    font-weight:500;
}

/* ===== BUTTON ===== */
.btn-main{
    background:linear-gradient(135deg,#1d4ed8,#3b82f6);
    border:none;
    padding:13px 30px;
    border-radius:10px;
    color:white;
    font-weight:600;
    transition:0.25s;
    width:100%;
    font-size:0.95rem;
}
.btn-main:hover{
    background:linear-gradient(135deg,#3b82f6,#60a5fa);
    transform:translateY(-2px);
    color:white;
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
<div class="container d-flex justify-content-between align-items-center">
<a class="navbar-brand" href="/homePage">JOBPORTAL</a>

<div class="d-flex align-items-center gap-4">
<a class="nav-link d-none d-md-inline" href="/viewAllJobs">Joburi</a>
<a class="nav-link d-none d-md-inline" href="/addJob">Adaugă Job</a>
<a class="nav-link d-none d-md-inline active" href="/profile">Profil</a>
<a class="nav-link" href="/logout">Logout</a>
</div>
</div>
</nav>

<div class="container">

<div class="page-header">
<span class="badge-tech">Cont candidat</span>
<h1>Profilul meu</h1>
<p>Completează-ți CV-ul digital ca să fii găsit mai ușor de recrutori</p>
</div>

<c:if test="${param.updated == 'true'}">
<div class="alert-tech">Profilul a fost actualizat cu succes.</div>
</c:if>

<form action="/profile" method="post" enctype="multipart/form-data">

<div class="section-grid">

<!-- LEFT: photo + cv -->
<div>
<div class="glass avatar-wrap">
<div class="avatar" id="avatarPreview">
<c:if test="${not empty profile.photoPath}">
<img src="${profile.photoPath}" alt="poza de profil" style="width:100%;height:100%;object-fit:cover;">
</c:if>
</div>
<div class="username-tag">@<c:out value="${profile.username}"/></div>
<label class="upload-btn" for="photoInput">Schimbă poza</label>
<input type="file" id="photoInput" name="photo" accept="image/*">
</div>

<div class="glass">
<h3>CV</h3>
<p class="hint">PDF sau Word, max 5MB</p>

<c:if test="${not empty profile.cvPath}">
<div class="file-current">
<a href="${profile.cvPath}" target="_blank"><c:out value="${profile.cvOriginalName}"/></a>
</div>
</c:if>

<label class="upload-btn" for="cvInput">Încarcă CV</label>
<input type="file" id="cvInput" name="cv" accept=".pdf,.doc,.docx">
<div class="file-current" id="cvFileName" style="display:none;"></div>
</div>
</div>

<!-- RIGHT: details -->
<div>

<div class="glass">
<h3>Skill-uri</h3>
<p class="hint">Desparte prin virgulă — ex: React, Java, Spring Boot</p>
<input type="text" class="form-control" id="skillsInput" name="skills" value="${profile.skills}" placeholder="React, Java, Spring Boot, Docker">
<div class="pill-row" id="skillsPreview"></div>
</div>

<div class="glass">
<h3>Limbi străine</h3>
<p class="hint">O limbă pe linie — ex: Engleză - Avansat</p>
<textarea class="form-control" name="languages" rows="3" placeholder="Engleză - Avansat&#10;Franceză - Mediu">${profile.languages}</textarea>
</div>

<div class="glass">
<h3>Studii</h3>
<p class="hint">O instituție pe linie — ex: Universitatea X - Specializare - 2020-2024</p>
<textarea class="form-control" name="education" rows="3" placeholder="Universitatea Politehnica - Calculatoare - 2020-2024">${profile.education}</textarea>
</div>

<div class="glass">
<h3>Experiență</h3>
<p class="hint">O poziție pe linie — ex: Rol - Companie - Perioadă</p>
<textarea class="form-control" name="experience" rows="4" placeholder="Junior Developer - Firma SRL - 2023-prezent">${profile.experience}</textarea>
</div>

<div class="glass">
<h3>Certificări</h3>
<p class="hint">O certificare pe linie — ex: Nume - Organizație - An</p>
<textarea class="form-control" name="certifications" rows="3" placeholder="AWS Cloud Practitioner - Amazon - 2024">${profile.certifications}</textarea>
</div>

<button type="submit" class="btn-main">Salvează profilul</button>

</div>
</div>
</form>

</div>

<script>
function renderPills(){
    var input = document.getElementById('skillsInput');
    var preview = document.getElementById('skillsPreview');
    preview.innerHTML = '';
    var parts = input.value.split(',');
    for (var i = 0; i < parts.length; i++){
        var val = parts[i].trim();
        if (val.length === 0) continue;
        var span = document.createElement('span');
        span.className = 'pill';
        span.textContent = val;
        preview.appendChild(span);
    }
}
document.getElementById('skillsInput').addEventListener('input', renderPills);
renderPills();

document.getElementById('photoInput').addEventListener('change', function(e){
    var file = e.target.files[0];
    if (!file) return;
    var reader = new FileReader();
    reader.onload = function(ev){
        var wrap = document.getElementById('avatarPreview');
        wrap.innerHTML = '<img src="' + ev.target.result + '" style="width:100%;height:100%;object-fit:cover;">';
    };
    reader.readAsDataURL(file);
});

document.getElementById('cvInput').addEventListener('change', function(e){
    var file = e.target.files[0];
    var box = document.getElementById('cvFileName');
    if (!file){ box.style.display = 'none'; return; }
    box.style.display = 'flex';
    box.textContent = file.name;
});
</script>

</body>
</html>
