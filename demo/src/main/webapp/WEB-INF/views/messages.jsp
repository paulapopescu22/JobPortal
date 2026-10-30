<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ro">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Messaging · Job Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="/images/favicon.png">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap');

body{
    font-family: Arial, Helvetica, sans-serif;
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
    flex:1;
    min-width:160px;
    max-width:340px;
}
.nav-search input{
    width:100%;
    background:#f1f5f9;
    border:1px solid #e2e8f0;
    border-radius:999px;
    padding:8px 18px;
    font-size:0.85rem;
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

/* ===== MESAJE ===== */
.messages-shell{
    display:flex;
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-radius:10px;
    box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 4px 14px rgba(15,23,42,0.05);
    overflow:hidden;
    height:70vh;
    min-height:460px;
}

/* ===== LISTA CONVERSATII ===== */
.conv-pane{
    width:300px;
    flex-shrink:0;
    border-right:1px solid #e2e8f0;
    overflow-y:auto;
}
.conv-pane-header{
    padding:16px 20px;
    font-weight:700;
    font-size:0.95rem;
    color:#0f172a;
    border-bottom:1px solid #e2e8f0;
}
.conv-item{
    display:flex;
    gap:12px;
    padding:14px 20px;
    border-bottom:1px solid #f1f5f9;
    cursor:pointer;
}
.conv-item:hover{
    background:#f8fafc;
}
.conv-item.active{
    background:#f1f5f9;
}
.conv-avatar{
    width:42px;
    height:42px;
    border-radius:50%;
    background:#475569;
    color:#ffffff;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:700;
    font-size:0.8rem;
    flex-shrink:0;
}
.conv-info{
    min-width:0;
    flex:1;
}
.conv-name-row{
    display:flex;
    justify-content:space-between;
    align-items:baseline;
    gap:8px;
    margin-bottom:3px;
}
.conv-name{
    font-weight:600;
    font-size:0.88rem;
    color:#0f172a;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
.conv-time{
    font-size:0.7rem;
    color:#94a3b8;
    flex-shrink:0;
}
.conv-preview{
    font-size:0.8rem;
    color:#64748b;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}

/* ===== FIR DE CONVERSATIE ===== */
.chat-pane{
    flex:1;
    display:flex;
    flex-direction:column;
    min-width:0;
}
.chat-header{
    display:flex;
    align-items:center;
    gap:12px;
    padding:14px 24px;
    border-bottom:1px solid #e2e8f0;
}
.chat-header .conv-avatar{
    width:36px;
    height:36px;
}
.chat-header-name{
    font-weight:700;
    color:#0f172a;
    font-size:0.92rem;
}
.chat-messages{
    flex:1;
    overflow-y:auto;
    padding:24px;
    display:flex;
    flex-direction:column;
    gap:10px;
}
.msg-bubble{
    max-width:70%;
    padding:10px 16px;
    border-radius:16px;
    font-size:0.86rem;
    line-height:1.45;
}
.msg-received{
    align-self:flex-start;
    background:#f1f5f9;
    color:#0f172a;
    border-bottom-left-radius:4px;
}
.msg-sent{
    align-self:flex-end;
    background:#1e293b;
    color:#ffffff;
    border-bottom-right-radius:4px;
}
.msg-status{
    align-self:flex-end;
    font-size:0.72rem;
    color:#94a3b8;
    margin-top:-4px;
    margin-right:6px;
}
.chat-input-bar{
    display:flex;
    gap:10px;
    padding:14px 20px;
    border-top:1px solid #e2e8f0;
}
.chat-input-bar input{
    flex:1;
    background:#f1f5f9;
    border:1px solid #e2e8f0;
    border-radius:999px;
    padding:10px 18px;
    font-size:0.86rem;
    color:#0f172a;
    outline:none;
}
.chat-input-bar input:focus{
    border-color:#334155;
    background:#ffffff;
}
.chat-send-btn{
    background:#475569;
    border:none;
    border-radius:999px;
    padding:0 22px;
    color:#ffffff;
    font-weight:600;
    font-size:0.84rem;
    cursor:pointer;
}
.chat-send-btn:hover{
    background:#334155;
}

@media (max-width:760px){
    .messages-shell{
        flex-direction:column;
        height:auto;
    }
    .conv-pane{
        width:100%;
        max-height:220px;
        border-right:none;
        border-bottom:1px solid #e2e8f0;
    }
    .chat-pane{
        min-height:420px;
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
<input type="text" name="keyword" placeholder="Caută joburi...">
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

<div class="container mt-5" style="max-width:1000px;">

<div class="messages-shell">

<div class="conv-pane">
<div class="conv-pane-header">Conversations</div>

<div class="conv-item active">
<div class="conv-avatar">AM</div>
<div class="conv-info">
<div class="conv-name-row">
<span class="conv-name">Alex Morgan</span>
<span class="conv-time">2h</span>
</div>
<div class="conv-preview">Thanks for reaching out! I'm available for an interview next week.</div>
</div>
</div>

<div class="conv-item">
<div class="conv-avatar">SC</div>
<div class="conv-info">
<div class="conv-name-row">
<span class="conv-name">Sarah Chen</span>
<span class="conv-time">5h</span>
</div>
<div class="conv-preview">I've attached my updated CV, let me know if you need anything else.</div>
</div>
</div>

<div class="conv-item">
<div class="conv-avatar">DO</div>
<div class="conv-info">
<div class="conv-name-row">
<span class="conv-name">Daniel Osei</span>
<span class="conv-time">1d</span>
</div>
<div class="conv-preview">Looking forward to hearing back from your team.</div>
</div>
</div>

<div class="conv-item">
<div class="conv-avatar">MI</div>
<div class="conv-info">
<div class="conv-name-row">
<span class="conv-name">Maria Ionescu</span>
<span class="conv-time">2d</span>
</div>
<div class="conv-preview">Is the Backend Developer role still open?</div>
</div>
</div>

<div class="conv-item">
<div class="conv-avatar">LC</div>
<div class="conv-info">
<div class="conv-name-row">
<span class="conv-name">Liam Carter</span>
<span class="conv-time">3d</span>
</div>
<div class="conv-preview">Thank you for the opportunity!</div>
</div>
</div>

</div>

<div class="chat-pane">

<div class="chat-header">
<div class="conv-avatar">AM</div>
<div class="chat-header-name">Alex Morgan</div>
</div>

<div class="chat-messages">
<div class="msg-bubble msg-received">Hi! I saw your Java Developer posting and I'm very interested.</div>
<div class="msg-bubble msg-sent">Hi Alex, thanks for reaching out! Could you tell me more about your experience with Spring Boot?</div>
<div class="msg-bubble msg-received">Sure, I've worked with Spring Boot for about 3 years, mainly on REST APIs and microservices.</div>
<div class="msg-bubble msg-sent">That sounds great. Are you available for a quick call next week?</div>
<div class="msg-status">Seen</div>
<div class="msg-bubble msg-received">Thanks for reaching out! I'm available for an interview next week.</div>
</div>

<div class="chat-input-bar">
<input type="text" placeholder="Write a message...">
<button type="button" class="chat-send-btn">Send</button>
</div>

</div>

</div>

</div>

<%@ include file="/WEB-INF/views/footer.jspf" %>

</body>
</html>
