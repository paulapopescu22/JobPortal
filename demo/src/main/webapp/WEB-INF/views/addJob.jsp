<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Job Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="/images/favicon.png">

<style>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@700&display=swap');

/* ===== BODY ===== */
body{
	font-family:'Inter',-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;
	min-height:100vh;
	margin:0;
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

/* ===== WRAPPER ===== */
.wrapper{
	margin-top:90px;
}

/* ===== CARD ===== */
.card{
	border-radius:10px;
	padding:40px 30px;
	background:#ffffff;
	border:1px solid #e2e8f0;
	box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 4px 14px rgba(15,23,42,0.05);
	transition:border-color .25s ease;
	color:#0f172a;
}
.card:hover{
	border-color:#1e293b;
}

/* ===== FORM INPUT ===== */
.form-control, .form-select, textarea{
	border-radius:6px;
	background:#f8fafc;
	border:1px solid #e2e8f0;
	color:#0f172a;
	padding:12px;
}

.form-control::placeholder{
	color:#94a3b8;
}

.form-control:focus, .form-select:focus, textarea:focus{
	background:#f8fafc;
	color:#0f172a;
	outline:none;
	border:1px solid #1e293b;
}

label{
	color:#334155;
	font-weight:500;
}

/* ===== BUTTON ===== */
.btn-main{
	background:#0f172a;
	border:none;
	border-radius:999px;
	padding:12px 26px;
	font-weight:600;
	color:#fff;
	transition:all 0.2s ease;
}

.btn-main:hover{
	background:#1e293b;
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

<div class="container wrapper">
	<div class="row justify-content-center">
		<div class="col-md-7">

			<div class="card">
				<h4 class="mb-4">
					<c:choose>
						<c:when test="${not empty jobPost}">Edit Job Posting</c:when>
						<c:otherwise>Post a New Job</c:otherwise>
					</c:choose>
				</h4>
				<form action="${not empty jobPost ? '/editJob' : '/handleForm'}" method="post">

					<c:choose>
						<c:when test="${not empty jobPost}">
							<input type="hidden" name="postId" value="${jobPost.postId}">
						</c:when>
						<c:otherwise>
							<input type="hidden" name="postId" value="0">
						</c:otherwise>
					</c:choose>

					<div class="mb-3">
						<label>Post Profile</label>
						<input type="text" class="form-control" name="postProfile" value="<c:out value="${jobPost.postProfile}"/>" required>
					</div>

					<div class="mb-3">
						<label>Company Name</label>
						<input type="text" class="form-control" name="companyName" value="<c:out value="${jobPost.companyName}"/>" required>
					</div>

					<div class="mb-3">
						<label>Description</label>
						<textarea class="form-control" name="postDesc" rows="3" required><c:out value="${jobPost.postDesc}"/></textarea>
					</div>

					<div class="mb-3">
						<label>Experience Level</label>
						<select class="form-select" name="experienceLevel" required>
							<option value="" disabled ${empty jobPost ? 'selected' : ''}>Select a level</option>
							<option value="Junior" ${jobPost.experienceLevel == 'Junior' ? 'selected' : ''}>Junior</option>
							<option value="Middle" ${jobPost.experienceLevel == 'Middle' ? 'selected' : ''}>Middle</option>
							<option value="Senior" ${jobPost.experienceLevel == 'Senior' ? 'selected' : ''}>Senior</option>
						</select>
					</div>

					<div class="mb-4">
						<label>Tech Stack</label>
						<select multiple class="form-select" name="postTechStack">
							<option ${not empty jobPost && jobPost.postTechStack.contains('Java') ? 'selected' : ''}>Java</option>
							<option ${not empty jobPost && jobPost.postTechStack.contains('Spring Boot') ? 'selected' : ''}>Spring Boot</option>
							<option ${not empty jobPost && jobPost.postTechStack.contains('React') ? 'selected' : ''}>React</option>
							<option ${not empty jobPost && jobPost.postTechStack.contains('Angular') ? 'selected' : ''}>Angular</option>
							<option ${not empty jobPost && jobPost.postTechStack.contains('Node.js') ? 'selected' : ''}>Node.js</option>
							<option ${not empty jobPost && jobPost.postTechStack.contains('Docker') ? 'selected' : ''}>Docker</option>
							<option ${not empty jobPost && jobPost.postTechStack.contains('AWS') ? 'selected' : ''}>AWS</option>
							<option ${not empty jobPost && jobPost.postTechStack.contains('Python') ? 'selected' : ''}>Python</option>
						</select>
					</div>

					<button type="submit" class="btn btn-main w-100">
						<c:choose>
							<c:when test="${not empty jobPost}">Save Changes</c:when>
							<c:otherwise>Submit Job</c:otherwise>
						</c:choose>
					</button>

				</form>
			</div>

		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>
