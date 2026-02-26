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
	color:#e8eefc;
	background: linear-gradient(135deg,#0b1e3a,#08162c 70%);
	scroll-behavior:smooth;
	position:relative;
}

/* ===== GLOW FUNDAL ===== */
body::before{
	content:"";
	position:fixed;
	width:140%;
	height:140%;
	background:linear-gradient(
		120deg,
		transparent 20%,
		rgba(46,213,115,0.2),
		rgba(0,140,255,0.15),
		transparent 80%
	);
	filter:blur(80px);
	animation:moveGlow 15s linear infinite;
	z-index:0;
}
@keyframes moveGlow{
	from{transform:translateX(-20%) translateY(-10%) rotate(0deg);}
	to{transform:translateX(20%) translateY(10%) rotate(360deg);}
}

/* ===== NAVBAR ===== */
.navbar{
	background:#08162c !important;
	box-shadow:0 4px 18px rgba(0,0,0,0.45);
	border-bottom:3px solid #27ae60; /* linia verde jos */
	position:relative;
	z-index:1;
}
.navbar-brand{
	color:#27ae60 !important;
	font-weight:700;
	letter-spacing:1px;
}
.nav-link{
	color:#bcd0ff !important;
	font-weight:500;
}
.nav-link:hover{
	color:#27ae60 !important;
}

/* ===== WRAPPER ===== */
.wrapper{
	margin-top:90px;
	position:relative;
	z-index:1;
}

/* ===== GLASS CARD ===== */
.card{
	border:none;
	border-radius:18px;
	padding:40px 30px;
	background:linear-gradient(145deg,#0f2a52,#08162c);
	box-shadow:0 10px 30px rgba(0,0,0,0.45);
	transition:all .25s ease;
	color:#e8eefc;
}
.card:hover{
	transform:translateY(-6px);
	box-shadow:0 18px 45px rgba(0,0,0,0.55), 0 0 20px rgba(46,213,115,0.2);
}

/* ===== CARD TITLE ===== */
.card-title{
	font-weight:700;
	text-align:center;
	margin-bottom:30px;
}

/* ===== FORM INPUT ===== */
.form-control, .form-select, textarea{
	border-radius:10px;
	background:#0f2a52;
	border:none;
	color:#fff;
	padding:12px;
}

.form-control::placeholder{
	color:#bcd0ff;
}

.form-control:focus, .form-select:focus, textarea:focus{
	background:#0f2a52;
	color:#fff;
	outline:none;
	border:1px solid #27ae60;
	box-shadow:0 0 10px rgba(46,213,115,0.4);
}

/* ===== BUTTON ===== */
.btn-main{
	background:linear-gradient(135deg,#27ae60,#1abc9c);
	border:none;
	border-radius:10px;
	padding:12px 26px;
	font-weight:600;
	color:#fff;
	transition:all 0.3s ease;
}

.btn-main:hover{
	background:linear-gradient(135deg,#2ed573,#1abc9c);
	transform:translateY(-2px);
	box-shadow:0 10px 20px rgba(46,213,115,0.3);
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
