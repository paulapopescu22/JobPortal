<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ro">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Job Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="/images/favicon.png">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

/* ===== BODY ===== */
body{
	font-family:'Poppins',sans-serif;
	min-height:100vh;
	margin:0;
	color:#0f172a;
	background:#f8fafc;
}

/* ===== NAVBAR ===== */
.navbar{
	background:#ffffff !important;
	border-bottom:1px solid #e2e8f0;
}
.navbar-brand{
	color:#0f172a !important;
	font-weight:700;
	letter-spacing:0.5px;
}
.nav-link{
	color:#64748b !important;
	font-weight:500;
}
.nav-link:hover{
	color:#3b82f6 !important;
}

/* ===== WRAPPER ===== */
.wrapper{
	margin-top:90px;
}

/* ===== CARD ===== */
.card{
	border-radius:18px;
	padding:40px 30px;
	background:#ffffff;
	border:1px solid #e2e8f0;
	transition:border-color .25s ease;
	color:#0f172a;
}
.card:hover{
	border-color:#3b82f6;
}

/* ===== CARD TITLE ===== */
.card-title{
	font-weight:700;
	text-align:center;
	margin-bottom:30px;
	color:#0f172a;
}

/* ===== FORM INPUT ===== */
.form-control, .form-select, textarea{
	border-radius:10px;
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
	border:1px solid #3b82f6;
}

label{
	color:#334155;
	font-weight:500;
}

/* ===== BUTTON ===== */
.btn-main{
	background:linear-gradient(135deg,#1d4ed8,#3b82f6);
	border:none;
	border-radius:10px;
	padding:12px 26px;
	font-weight:600;
	color:#fff;
	transition:all 0.2s ease;
}

.btn-main:hover{
	background:linear-gradient(135deg,#3b82f6,#60a5fa);
}
</style>
</head>

<body>

<nav class="navbar navbar-expand-lg">
<div class="container">
<a class="navbar-brand fs-4" href="/homePage">JOB PORTAL</a>

<div class="collapse navbar-collapse">
<ul class="navbar-nav ms-auto">
<li class="nav-item"><a class="nav-link" href="/homePage">Home</a></li>
<li class="nav-item"><a class="nav-link" href="/viewAllJobs">All Jobs</a></li>
<li class="nav-item"><a class="nav-link" href="/profile">Profil</a></li>
<li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
</ul>
</div>
</div>
</nav>

<div class="container wrapper">
	<div class="row justify-content-center">
		<div class="col-md-7">

			<div class="card">
				<h3 class="card-title">Post a New Job</h3>

				<form action="handleForm" method="post">

					<div class="mb-3">
						<label>Post ID</label>
						<input type="text" class="form-control" name="postId" required>
					</div>

					<div class="mb-3">
						<label>Post Profile</label>
						<input type="text" class="form-control" name="postProfile" required>
					</div>

					<div class="mb-3">
						<label>Description</label>
						<textarea class="form-control" name="postDesc" rows="3" required></textarea>
					</div>

					<div class="mb-3">
						<label>Required Experience</label>
						<input type="number" class="form-control" name="reqExperience" required>
					</div>

					<div class="mb-4">
						<label>Tech Stack</label>
						<select multiple class="form-select" name="postTechStack">
							<option>Java</option>
							<option>Spring Boot</option>
							<option>React</option>
							<option>Angular</option>
							<option>Node.js</option>
							<option>Docker</option>
							<option>AWS</option>
							<option>Python</option>
						</select>
					</div>

					<button type="submit" class="btn btn-main w-100">Submit Job</button>

				</form>
			</div>

		</div>
	</div>
</div>

</body>
</html>
