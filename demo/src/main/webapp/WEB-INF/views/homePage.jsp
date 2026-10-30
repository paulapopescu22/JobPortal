<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

/* ===== BASE ===== */
body{
    font-family:'Inter',-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;
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


/* ===== BUTTON ===== */
.btn-main{
    background:#0f172a;
    border:none;
    padding:12px 26px;
    border-radius:999px;
    color:white;
    font-weight:600;
    transition:0.2s ease;
}

.btn-main:hover{
    background:#1e293b;
    color:white;
}

/* ===== SEARCH ===== */
.search-box{
    max-width:600px;
    margin:0;
}

.form-control{
    background:#ffffff;
    border:1px solid #e2e8f0;
    color:#0f172a;
    border-radius:6px;
    padding:14px;
}

.form-control:focus{
    border-color:#1e293b;
}

/* ===== FEED ===== */
.feed{
    max-width:600px;
    margin:36px 0 60px;
}

/* composer */
.composer{
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-radius:14px;
    padding:20px;
    margin-bottom:24px;
    box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 2px 8px rgba(15,23,42,0.04);
}
.composer input[type="text"]{
    width:100%;
    border:1px solid #e2e8f0;
    border-radius:8px;
    padding:10px 14px;
    font-family:inherit;
    font-size:0.85rem;
    color:#0f172a;
    box-sizing:border-box;
    outline:none;
}
.composer input[type="text"]:focus{
    border-color:#1e293b;
}
.composer-textarea{
    width:100%;
    border:1px solid #e2e8f0;
    border-radius:10px;
    padding:12px 14px;
    font-family:inherit;
    font-size:0.88rem;
    color:#0f172a;
    resize:vertical;
    min-height:64px;
    box-sizing:border-box;
    outline:none;
}
.composer-textarea:focus{
    border-color:#1e293b;
}
.composer-footer{
    display:flex;
    justify-content:flex-end;
    margin-top:12px;
}

/* post card */
.post-card{
    position:relative;
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-radius:14px;
    padding:20px;
    margin-bottom:20px;
    box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 2px 8px rgba(15,23,42,0.04);
    transition:box-shadow .2s ease;
}
.post-card:hover{
    box-shadow:0 1px 2px rgba(15,23,42,0.04), 0 6px 20px rgba(15,23,42,0.08);
}
.post-header{
    display:flex;
    align-items:center;
    gap:12px;
    margin-bottom:12px;
}
.post-avatar{
    width:42px;
    height:42px;
    border-radius:50%;
    flex-shrink:0;
    display:flex;
    align-items:center;
    justify-content:center;
    color:#ffffff;
    font-weight:700;
    font-size:0.95rem;
}
.post-author-info{
    min-width:0;
    flex:1;
}
.post-author-name{
    font-weight:700;
    font-size:0.92rem;
    color:#0f172a;
    margin:0;
}
.post-meta{
    color:#94a3b8;
    font-size:0.76rem;
    margin:2px 0 0;
}
.post-text{
    color:#1e293b;
    font-size:0.9rem;
    line-height:1.6;
    white-space:pre-line;
    margin:0 0 14px;
}
.post-image{
    display:block;
    width:100%;
    max-height:360px;
    object-fit:cover;
    border-radius:10px;
    border:1px solid #e2e8f0;
    margin:0 0 14px;
}

/* post owner menu (edit/delete) */
.post-menu-wrap{
    position:relative;
    flex-shrink:0;
}
.post-menu-btn{
    display:inline-flex;
    align-items:center;
    justify-content:center;
    width:30px;
    height:30px;
    border-radius:50%;
    background:none;
    border:none;
    color:#94a3b8;
    font-size:1.1rem;
    font-weight:700;
    line-height:1;
    cursor:pointer;
}
.post-menu-btn:hover{
    background:#f1f5f9;
    color:#1e293b;
}
.post-menu-toggle{
    display:none;
}
.post-menu{
    display:none;
    flex-direction:column;
    gap:2px;
    position:absolute;
    top:calc(100% + 6px);
    right:0;
    min-width:150px;
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-radius:12px;
    box-shadow:0 4px 16px rgba(15,23,42,0.12);
    padding:8px;
    z-index:6;
}
.post-menu-toggle:checked ~ .post-menu{
    display:flex;
}
.post-menu-option{
    display:flex;
    align-items:center;
    gap:10px;
    width:100%;
    background:none;
    border:none;
    text-align:left;
    color:#1e293b;
    font-weight:600;
    font-size:0.83rem;
    padding:9px 10px;
    border-radius:8px;
    cursor:pointer;
    text-decoration:none;
    font-family:inherit;
}
.post-menu-option:hover{
    background:#f1f5f9;
}
.post-menu-option svg{
    flex-shrink:0;
    color:#64748b;
}
.delete-confirm-toggle{
    display:none;
}
.delete-confirm-toggle:checked ~ .menu-default{
    display:none;
}
.delete-confirm-box{
    display:none;
}
.delete-confirm-toggle:checked ~ .delete-confirm-box{
    display:block;
    padding:4px 10px 6px;
}
.delete-confirm-text{
    margin:0 0 10px;
    color:#1e293b;
    font-size:0.8rem;
    font-weight:500;
    line-height:1.4;
}
.delete-confirm-actions{
    display:flex;
    gap:8px;
}
.delete-confirm-form{
    flex:1;
    display:flex;
}
.btn-cancel-mini, .btn-confirm-mini{
    flex:1;
    text-align:center;
    padding:7px 0;
    border-radius:7px;
    font-size:0.78rem;
    font-weight:600;
    cursor:pointer;
    border:1px solid #e2e8f0;
    background:#ffffff;
    color:#1e293b;
    font-family:inherit;
}
.btn-cancel-mini:hover{
    background:#f1f5f9;
}
.btn-confirm-mini{
    width:100%;
    background:#0f172a;
    color:#ffffff;
    border-color:#0f172a;
}
.btn-confirm-mini:hover{
    background:#1e293b;
}

/* edit mode */
.edit-toggle{
    display:none;
}
.edit-toggle:checked ~ .post-text,
.edit-toggle:checked ~ .post-image{
    display:none;
}
.edit-form{
    display:none;
    margin:0 0 14px;
}
.edit-toggle:checked ~ .edit-form{
    display:block;
}
.edit-textarea{
    width:100%;
    min-height:90px;
    border:1px solid #e2e8f0;
    border-radius:10px;
    padding:12px 14px;
    font-size:0.9rem;
    font-family:inherit;
    color:#1e293b;
    resize:vertical;
    outline:none;
}
.edit-textarea:focus{
    border-color:#1e293b;
}
.edit-actions{
    display:flex;
    justify-content:flex-end;
    gap:8px;
    margin-top:10px;
}
.edit-save-btn{
    background:#0f172a;
    color:#fff;
    border:none;
    border-radius:999px;
    padding:8px 18px;
    font-weight:600;
    font-size:0.8rem;
    cursor:pointer;
}
.edit-save-btn:hover{
    background:#1e293b;
}
.edit-cancel-btn{
    display:inline-flex;
    align-items:center;
    background:none;
    border:1px solid #e2e8f0;
    color:#64748b;
    border-radius:999px;
    padding:8px 18px;
    font-weight:600;
    font-size:0.8rem;
    cursor:pointer;
}
.edit-cancel-btn:hover{
    background:#f1f5f9;
    color:#1e293b;
}

.comments-toggle{
    display:none;
}
.post-actions{
    display:flex;
    gap:4px;
    padding-top:10px;
    border-top:1px solid #f1f5f9;
}
.action-btn{
    display:inline-flex;
    align-items:center;
    gap:6px;
    flex:1;
    justify-content:center;
    background:none;
    border:none;
    color:#64748b;
    font-weight:600;
    font-size:0.8rem;
    padding:9px 10px;
    border-radius:8px;
    cursor:pointer;
    text-decoration:none;
}
.action-btn:hover{
    background:#f1f5f9;
    color:#1e293b;
}
.action-btn.liked{
    color:#0f172a;
}
.action-form{
    flex:1;
    display:flex;
}
.action-form .action-btn{
    width:100%;
}

.share-wrap{
    position:relative;
    flex:1;
    display:flex;
}
.share-wrap .action-btn{
    width:100%;
}
.share-toggle{
    display:none;
}
.share-menu{
    display:none;
    flex-direction:column;
    gap:2px;
    position:absolute;
    bottom:calc(100% + 8px);
    right:0;
    min-width:175px;
    background:#ffffff;
    border:1px solid #e2e8f0;
    border-radius:12px;
    box-shadow:0 4px 16px rgba(15,23,42,0.12);
    padding:8px;
    z-index:5;
}
.share-toggle:checked ~ .share-menu{
    display:flex;
}
.share-option{
    display:flex;
    align-items:center;
    gap:10px;
    width:100%;
    background:none;
    border:none;
    text-align:left;
    color:#1e293b;
    font-weight:600;
    font-size:0.83rem;
    padding:9px 10px;
    border-radius:8px;
    cursor:pointer;
}
.share-option:hover{
    background:#f1f5f9;
}
.share-option svg{
    flex-shrink:0;
    color:#64748b;
}

.comments-section{
    display:none;
    margin-top:14px;
    padding-top:14px;
    border-top:1px solid #f1f5f9;
}
.comments-toggle:checked ~ .comments-section{
    display:block;
}
.comment-row{
    font-size:0.83rem;
    color:#334155;
    padding:6px 0;
}
.comment-author{
    font-weight:700;
    color:#0f172a;
    margin-right:6px;
}
.comment-form{
    display:flex;
    gap:8px;
    margin-top:10px;
}
.comment-form input{
    flex:1;
    border:1px solid #e2e8f0;
    border-radius:999px;
    padding:8px 14px;
    font-size:0.82rem;
    font-family:inherit;
    outline:none;
}
.comment-form input:focus{
    border-color:#1e293b;
}
.comment-form button{
    background:#0f172a;
    color:#fff;
    border:none;
    border-radius:999px;
    padding:8px 18px;
    font-weight:600;
    font-size:0.8rem;
    cursor:pointer;
}
.comment-form button:hover{
    background:#1e293b;
}
.empty-feed{
    text-align:center;
    color:#64748b;
    padding:40px 0;
    font-size:0.88rem;
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
<div class="feed">

<c:if test="${not empty userRole}">
<div class="composer">
<form action="/posts/create" method="POST">

<textarea name="content" class="composer-textarea" placeholder="Share an update with your network..." maxlength="4000" required></textarea>

<div class="composer-footer">
<button type="submit" class="btn-main">Post</button>
</div>

</form>
</div>
</c:if>

<c:if test="${empty posts}">
<div class="empty-feed">No posts yet. Be the first to share something.</div>
</c:if>

<c:forEach var="pv" items="${posts}">
<div class="post-card" id="post-${pv.post.id}">

<div class="post-header">
<div class="post-avatar" style="background:${pv.post.avatarColorHex};">${pv.post.authorInitial}</div>
<div class="post-author-info">
<p class="post-author-name">@<c:out value="${pv.post.authorUsername}"/></p>
<p class="post-meta">
<c:choose>
<c:when test="${pv.post.authorRole == 'COMPANIE'}">Company</c:when>
<c:otherwise>Candidate</c:otherwise>
</c:choose>
&middot; <c:out value="${pv.post.timeAgo}"/>
</p>
</div>

<c:if test="${not empty currentUsername && pv.post.authorUsername == currentUsername}">
<div class="post-menu-wrap">
<input type="checkbox" id="post-menu-toggle-${pv.post.id}" class="post-menu-toggle">
<label for="post-menu-toggle-${pv.post.id}" class="post-menu-btn">&#8942;</label>
<div class="post-menu">
<input type="checkbox" id="post-delete-confirm-${pv.post.id}" class="delete-confirm-toggle">
<label for="edit-toggle-${pv.post.id}" class="post-menu-option menu-default"
    onclick="document.getElementById('post-menu-toggle-${pv.post.id}').checked=false;">
<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4Z"/></svg>
Edit
</label>
<label for="post-delete-confirm-${pv.post.id}" class="post-menu-option menu-default">
<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"/><path d="M19 6l-1 14a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2L5 6"/><path d="M10 11v6"/><path d="M14 11v6"/><path d="M9 6V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/></svg>
Delete
</label>
<div class="delete-confirm-box">
<p class="delete-confirm-text">Delete this post? This cannot be undone.</p>
<div class="delete-confirm-actions">
<label for="post-delete-confirm-${pv.post.id}" class="btn-cancel-mini">Cancel</label>
<form action="/posts/${pv.post.id}/delete" method="POST" class="delete-confirm-form">
<button type="submit" class="btn-confirm-mini">Delete</button>
</form>
</div>
</div>
</div>
</div>
</c:if>

</div>

<input type="checkbox" id="edit-toggle-${pv.post.id}" class="edit-toggle">

<p class="post-text"><c:out value="${pv.post.content}"/></p>

<c:if test="${not empty pv.post.imagePath}">
<img src="<c:out value="${pv.post.imagePath}"/>" alt="" class="post-image">
</c:if>

<div class="edit-form">
<form action="/posts/${pv.post.id}/edit" method="POST">
<textarea name="content" class="edit-textarea" maxlength="4000" required><c:out value="${pv.post.content}"/></textarea>
<div class="edit-actions">
<label for="edit-toggle-${pv.post.id}" class="edit-cancel-btn">Cancel</label>
<button type="submit" class="edit-save-btn">Save</button>
</div>
</form>
</div>

<input type="checkbox" id="comments-toggle-${pv.post.id}" class="comments-toggle">

<div class="post-actions">
<form action="/posts/${pv.post.id}/like" method="POST" class="action-form">
<button type="submit" class="action-btn ${pv.likedByMe ? 'liked' : ''}">
<c:choose><c:when test="${pv.likedByMe}">&#9829;</c:when><c:otherwise>&#9825;</c:otherwise></c:choose>
Like<c:if test="${pv.likeCount > 0}"> &middot; ${pv.likeCount}</c:if>
</button>
</form>
<label for="comments-toggle-${pv.post.id}" class="action-btn">
<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.3" stroke-linecap="round" stroke-linejoin="round" style="flex-shrink:0;"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>
Comment<c:if test="${pv.commentCount > 0}"> &middot; ${pv.commentCount}</c:if>
</label>

<div class="share-wrap">
<input type="checkbox" id="share-toggle-${pv.post.id}" class="share-toggle">
<label for="share-toggle-${pv.post.id}" class="action-btn">&#8599; Share</label>

<div class="share-menu">
<button type="button" class="share-option" onclick="shareTo('whatsapp', ${pv.post.id})">
<svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
<span class="share-option-label">WhatsApp</span>
</button>
<button type="button" class="share-option" onclick="shareTo('facebook', ${pv.post.id})">
<svg width="15" height="15" viewBox="0 0 24 24" fill="currentColor"><path d="M17 3h-3a5 5 0 0 0-5 5v3H6v4h3v9h4v-9h3.2l.8-4H13V8a1 1 0 0 1 1-1h3z"/></svg>
<span class="share-option-label">Facebook</span>
</button>
<button type="button" class="share-option" onclick="copyPostLink(${pv.post.id}, this)">
<svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="22" y1="2" x2="11" y2="13"></line><polygon points="22 2 15 22 11 13 2 9 22 2"></polygon></svg>
<span class="share-option-label">Messenger</span>
</button>
<button type="button" class="share-option" onclick="copyPostLink(${pv.post.id}, this)">
<svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.5" y2="6.5"></line></svg>
<span class="share-option-label">Instagram</span>
</button>
</div>
</div>

</div>

<div class="comments-section">
<c:forEach var="cm" items="${pv.comments}">
<div class="comment-row">
<span class="comment-author">@<c:out value="${cm.authorUsername}"/></span>
<span class="comment-text"><c:out value="${cm.content}"/></span>
</div>
</c:forEach>

<c:if test="${not empty userRole}">
<form action="/posts/${pv.post.id}/comment" method="POST" class="comment-form">
<input type="text" name="content" placeholder="Write a comment..." maxlength="500" required>
<button type="submit">Send</button>
</form>
</c:if>
</div>

</div>
</c:forEach>

</div>
</div>

<%@ include file="/WEB-INF/views/footer.jspf" %>

<script>
function shareTo(platform, id){
    var url = window.location.origin + '/homePage#post-' + id;
    var encoded = encodeURIComponent(url);
    if (platform === 'whatsapp') {
        window.open('https://wa.me/?text=' + encoded, '_blank', 'noopener');
    } else if (platform === 'facebook') {
        window.open('https://www.facebook.com/sharer/sharer.php?u=' + encoded, '_blank', 'noopener');
    }
    var toggle = document.getElementById('share-toggle-' + id);
    if (toggle) { toggle.checked = false; }
}

function copyPostLink(id, btn){
    var url = window.location.origin + '/homePage#post-' + id;
    var label = btn.querySelector('.share-option-label') || btn;
    var original = label.textContent;
    function flash(){
        label.textContent = 'Copied!';
        setTimeout(function(){ label.textContent = original; }, 1500);
    }
    if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(url).then(flash, flash);
    } else {
        flash();
    }
}
</script>

</body>
</html>
