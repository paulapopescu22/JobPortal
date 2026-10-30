<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Profile · Job Portal</title>

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
.file-current{
    display:flex;
    align-items:center;
    gap:8px;
    background:#f8fafc;
    border:1px solid #e2e8f0;
    border-radius:6px;
    padding:10px 14px;
    font-size:0.85rem;
    color:#334155;
    margin-bottom:14px;
    word-break:break-all;
}
.file-current a{
    color:#0f172a;
    text-decoration:none;
    font-weight:600;
}
.file-current a:hover{
    text-decoration:underline;
}

/* ===== INPUTS ===== */
.form-control, textarea.form-control, select.form-control{
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

/* ===== SKILL SEARCH / PILLS ===== */
.skill-search-wrap{
    position:relative;
}
.skill-dropdown{
    position:absolute;
    top:calc(100% + 4px);
    left:0;
    right:0;
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-radius:6px;
    max-height:220px;
    overflow-y:auto;
    box-shadow:0 10px 30px rgba(15,23,42,0.10);
    z-index:30;
    display:none;
}
.skill-dropdown.open{
    display:block;
}
.skill-option{
    padding:9px 14px;
    font-size:0.85rem;
    color:#0f172a;
    cursor:pointer;
}
.skill-option:hover{
    background:#f1f5f9;
    color:#334155;
}
.pill-row{
    display:flex;
    flex-wrap:wrap;
    gap:8px;
    margin-top:12px;
    min-height:28px;
}
.pill{
    display:inline-flex;
    align-items:center;
    gap:6px;
    background:#f1f5f9;
    border:1px solid #e2e8f0;
    color:#334155;
    border-radius:6px;
    padding:4px 8px 4px 14px;
    font-size:0.78rem;
    font-weight:500;
}
.pill button{
    background:none;
    border:none;
    color:#334155;
    cursor:pointer;
    font-size:0.95rem;
    line-height:1;
    padding:2px 4px;
}
.pill button:hover{
    opacity:0.65;
}

/* ===== ADD-TO-LIST ROWS (languages, education, experience, certifications) ===== */
.add-row{
    display:flex;
    gap:8px;
    margin-bottom:14px;
}
.add-row .form-control{
    flex:1;
}
.add-row select.form-control{
    flex:0 0 160px;
}
.btn-add{
    background:#f1f5f9;
    border:1px solid #e2e8f0;
    color:#475569;
    border-radius:999px;
    padding:0 18px;
    font-weight:600;
    font-size:0.82rem;
    cursor:pointer;
    white-space:nowrap;
}
.btn-add:hover{
    background:#e2e8f0;
}
.entry-list{
    margin-top:4px;
}
.entry-item{
    display:flex;
    align-items:center;
    justify-content:space-between;
    background:#f8fafc;
    border:1px solid #e2e8f0;
    border-radius:6px;
    padding:9px 14px;
    font-size:0.85rem;
    color:#334155;
    margin-bottom:8px;
}
.entry-item button{
    background:none;
    border:none;
    color:#94a3b8;
    cursor:pointer;
    font-size:0.95rem;
    line-height:1;
    padding:2px 6px;
}
.entry-item button:hover{
    color:#334155;
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
@media (max-width:480px){
    .add-row{
        flex-direction:column;
    }
    .add-row select.form-control{
        flex:1;
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
</div>
</div>
</nav>

<div class="container mt-5">

<c:if test="${param.updated == 'true'}">
<div class="alert-tech">Profile updated successfully.</div>
</c:if>

<form action="/profile" method="post" enctype="multipart/form-data">

<div class="section-grid">

<!-- LEFT: photo + cv + cover letter -->
<div>

<div class="glass avatar-wrap">
<div class="avatar" id="avatarPreview">
<c:if test="${not empty profile.photoPath}">
<img src="${profile.photoPath}" alt="profile picture" style="width:100%;height:100%;object-fit:cover;">
</c:if>
</div>
<div class="username-tag">@<c:out value="${profile.username}"/></div>
<label class="upload-btn" for="photoInput">Change photo</label>
<input type="file" id="photoInput" name="photo" accept="image/*">
</div>

<div class="glass">
<h3>CV</h3>
<p class="hint">PDF or Word, max 5MB</p>

<c:if test="${not empty profile.cvPath}">
<div class="file-current">
<a href="${profile.cvPath}" target="_blank"><c:out value="${profile.cvOriginalName}"/></a>
</div>
</c:if>

<label class="upload-btn" for="cvInput">Upload CV</label>
<input type="file" id="cvInput" name="cv" accept=".pdf,.doc,.docx">
<div class="file-current" id="cvFileName" style="display:none;"></div>
</div>

<div class="glass">
<h3>Cover Letter</h3>
<p class="hint">PDF or Word, max 5MB</p>

<c:if test="${not empty profile.coverLetterPath}">
<div class="file-current">
<a href="${profile.coverLetterPath}" target="_blank"><c:out value="${profile.coverLetterOriginalName}"/></a>
</div>
</c:if>

<label class="upload-btn" for="coverLetterInput">Upload cover letter</label>
<input type="file" id="coverLetterInput" name="coverLetter" accept=".pdf,.doc,.docx">
<div class="file-current" id="coverLetterFileName" style="display:none;"></div>
</div>

</div>

<!-- RIGHT: details -->
<div>

<div class="glass">
<h3>Skills</h3>
<p class="hint">Search and pick from the list, or type your own and press Enter</p>

<div class="skill-search-wrap">
<input type="text" class="form-control" id="skillSearchInput" placeholder="Search: Java, React, Docker..." autocomplete="off">
<div class="skill-dropdown" id="skillDropdown"></div>
</div>
<div class="pill-row" id="skillsPreview"></div>
<input type="hidden" id="skillsHidden" name="skills" value="${profile.skills}">
</div>

<div class="glass">
<h3>Languages</h3>
<p class="hint">Type the language, pick a level and press Add</p>

<div class="add-row">
<input type="text" class="form-control" id="langNameInput" placeholder="e.g. English">
<select class="form-control" id="langLevelInput">
<option value="Beginner">Beginner</option>
<option value="Intermediate">Intermediate</option>
<option value="Advanced" selected>Advanced</option>
<option value="Fluent/Native">Fluent/Native</option>
</select>
<button type="button" class="btn-add" id="langAddBtn">Add</button>
</div>
<div class="entry-list" id="langList"></div>
<textarea id="languagesHidden" name="languages" style="display:none;">${profile.languages}</textarea>
</div>

<div class="glass">
<h3>Education</h3>
<p class="hint">Type an institution and press Add — you can have several</p>

<div class="add-row">
<input type="text" class="form-control" id="eduInput" placeholder="Polytechnic University - Computer Science - 2020-2024">
<button type="button" class="btn-add" id="eduAddBtn">Add</button>
</div>
<div class="entry-list" id="eduList"></div>
<textarea id="educationHidden" name="education" style="display:none;">${profile.education}</textarea>
</div>

<div class="glass">
<h3>Experience</h3>
<p class="hint">Type an experience and press Add — you can have several</p>

<div class="add-row">
<input type="text" class="form-control" id="expInput" placeholder="Junior Developer - Company Ltd - 2023-present">
<button type="button" class="btn-add" id="expAddBtn">Add</button>
</div>
<div class="entry-list" id="expList"></div>
<textarea id="experienceHidden" name="experience" style="display:none;">${profile.experience}</textarea>
</div>

<div class="glass">
<h3>Certifications</h3>
<p class="hint">Type a certification and press Add — you can have several</p>

<div class="add-row">
<input type="text" class="form-control" id="certInput" placeholder="AWS Cloud Practitioner - Amazon - 2024">
<button type="button" class="btn-add" id="certAddBtn">Add</button>
</div>
<div class="entry-list" id="certList"></div>
<textarea id="certificationsHidden" name="certifications" style="display:none;">${profile.certifications}</textarea>

<c:if test="${not empty profile.certificatePath}">
<div class="file-current" style="margin-top:14px;">
<a href="${profile.certificatePath}" target="_blank"><c:out value="${profile.certificateOriginalName}"/></a>
</div>
</c:if>
<label class="upload-btn" for="certificateInput" style="margin-top:14px;">Upload certificate</label>
<input type="file" id="certificateInput" name="certificateFile" accept=".pdf,.doc,.docx,.jpg,.jpeg,.png">
<div class="file-current" id="certificateFileName" style="display:none;"></div>
</div>

<button type="submit" class="btn-main">Save profile</button>

</div>
</div>

</form>

</div>

<script>
var PROGRAMMING_SKILLS = [
"Java","Python","JavaScript","TypeScript","C","C++","C#","Go","Rust","PHP","Ruby","Kotlin","Swift","Scala","R","Dart","Perl","SQL","Bash/Shell",
"HTML","CSS","Sass/SCSS","React","Angular","Vue.js","Next.js","Svelte","Redux","Tailwind CSS","Bootstrap","jQuery",
"Spring Boot","Spring Framework",".NET","ASP.NET","Node.js","Express.js","Django","Flask","FastAPI","Laravel","Ruby on Rails","Hibernate","GraphQL","REST API","gRPC",
"Android","iOS","React Native","Flutter","Xamarin",
"PostgreSQL","MySQL","MongoDB","Redis","Oracle Database","SQL Server","SQLite","Elasticsearch","Firebase","Cassandra",
"Docker","Kubernetes","AWS","Azure","Google Cloud Platform","CI/CD","Jenkins","Git","GitHub Actions","Terraform","Linux","Nginx","Ansible",
"JUnit","Selenium","Jest","Cypress","Mockito","TDD","Unit Testing",
"OOP","Data Structures","Algorithms","Microservices","Design Patterns","Software Architecture","Agile/Scrum","Jira","Postman","Machine Learning","Data Science","TensorFlow","PyTorch","Pandas","NumPy","Power BI"
];

(function initSkills(){
    var input = document.getElementById('skillSearchInput');
    var dropdown = document.getElementById('skillDropdown');
    var pillRow = document.getElementById('skillsPreview');
    var hidden = document.getElementById('skillsHidden');
    var selected = (hidden.value || '').split(',').map(function(s){ return s.trim(); }).filter(Boolean);

    function renderPills(){
        pillRow.innerHTML = '';
        selected.forEach(function(skill){
            var pill = document.createElement('span');
            pill.className = 'pill';
            var text = document.createElement('span');
            text.textContent = skill;
            var removeBtn = document.createElement('button');
            removeBtn.type = 'button';
            removeBtn.textContent = '×';
            removeBtn.addEventListener('click', function(){
                selected = selected.filter(function(s){ return s !== skill; });
                sync();
            });
            pill.appendChild(text);
            pill.appendChild(removeBtn);
            pillRow.appendChild(pill);
        });
    }
    function sync(){
        hidden.value = selected.join(', ');
        renderPills();
    }
    function addSkill(skill){
        skill = skill.trim();
        if (!skill) return;
        var exists = selected.some(function(s){ return s.toLowerCase() === skill.toLowerCase(); });
        if (!exists){
            selected.push(skill);
            sync();
        }
        input.value = '';
        closeDropdown();
        input.focus();
    }
    function openDropdown(list){
        dropdown.innerHTML = '';
        if (list.length === 0){ closeDropdown(); return; }
        list.slice(0,8).forEach(function(skill){
            var opt = document.createElement('div');
            opt.className = 'skill-option';
            opt.textContent = skill;
            opt.addEventListener('click', function(){ addSkill(skill); });
            dropdown.appendChild(opt);
        });
        dropdown.classList.add('open');
    }
    function closeDropdown(){
        dropdown.classList.remove('open');
        dropdown.innerHTML = '';
    }

    input.addEventListener('input', function(){
        var q = input.value.trim().toLowerCase();
        if (q.length === 0){ closeDropdown(); return; }
        var matches = PROGRAMMING_SKILLS.filter(function(s){
            var already = selected.some(function(sel){ return sel.toLowerCase() === s.toLowerCase(); });
            return !already && s.toLowerCase().indexOf(q) !== -1;
        });
        openDropdown(matches);
    });
    input.addEventListener('keydown', function(e){
        if (e.key === 'Enter'){
            e.preventDefault();
            var q = input.value.trim();
            if (!q) return;
            var exact = PROGRAMMING_SKILLS.filter(function(s){ return s.toLowerCase() === q.toLowerCase(); })[0];
            addSkill(exact || q);
        }
    });
    document.addEventListener('click', function(e){
        if (!e.target.closest('.skill-search-wrap')) closeDropdown();
    });

    renderPills();
})();

function initEntryList(opts){
    var input = document.getElementById(opts.inputId);
    var addBtn = document.getElementById(opts.addBtnId);
    var list = document.getElementById(opts.listId);
    var hidden = document.getElementById(opts.hiddenId);
    var levelSelect = opts.levelSelectId ? document.getElementById(opts.levelSelectId) : null;
    var entries = (hidden.value || '').split('\n').map(function(s){ return s.trim(); }).filter(Boolean);

    function render(){
        list.innerHTML = '';
        entries.forEach(function(entry){
            var row = document.createElement('div');
            row.className = 'entry-item';
            var text = document.createElement('span');
            text.textContent = entry;
            var removeBtn = document.createElement('button');
            removeBtn.type = 'button';
            removeBtn.textContent = '×';
            removeBtn.addEventListener('click', function(){
                entries = entries.filter(function(e){ return e !== entry; });
                sync();
            });
            row.appendChild(text);
            row.appendChild(removeBtn);
            list.appendChild(row);
        });
    }
    function sync(){
        hidden.value = entries.join('\n');
        render();
    }
    function addEntry(){
        var name = input.value.trim();
        if (!name) return;
        var entry = levelSelect ? (name + ' - ' + levelSelect.value) : name;
        entries.push(entry);
        input.value = '';
        sync();
        input.focus();
    }

    addBtn.addEventListener('click', addEntry);
    input.addEventListener('keydown', function(e){
        if (e.key === 'Enter'){
            e.preventDefault();
            addEntry();
        }
    });

    render();
}

initEntryList({ inputId:'langNameInput', addBtnId:'langAddBtn', listId:'langList', hiddenId:'languagesHidden', levelSelectId:'langLevelInput' });
initEntryList({ inputId:'eduInput', addBtnId:'eduAddBtn', listId:'eduList', hiddenId:'educationHidden' });
initEntryList({ inputId:'expInput', addBtnId:'expAddBtn', listId:'expList', hiddenId:'experienceHidden' });
initEntryList({ inputId:'certInput', addBtnId:'certAddBtn', listId:'certList', hiddenId:'certificationsHidden' });

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

function wireFilePreview(inputId, boxId){
    var el = document.getElementById(inputId);
    if (!el) return;
    el.addEventListener('change', function(e){
        var file = e.target.files[0];
        var box = document.getElementById(boxId);
        if (!file){ box.style.display = 'none'; return; }
        box.style.display = 'flex';
        box.textContent = file.name;
    });
}
wireFilePreview('cvInput', 'cvFileName');
wireFilePreview('coverLetterInput', 'coverLetterFileName');
wireFilePreview('certificateInput', 'certificateFileName');
</script>

<%@ include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>
