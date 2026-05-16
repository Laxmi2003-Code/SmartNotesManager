<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if(session.getAttribute("user_id") == null) {
        response.sendRedirect("../html/login.html"); 
        return;
    }
    String userName = (String)session.getAttribute("user_name");
    
    String subject = (String) request.getAttribute("subject");
    String title = (String) request.getAttribute("title");
    String content = (String) request.getAttribute("content");
    
    if(title == null) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title><%=title%> - Notes Manager</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f6f9;
        }
        /* NAVBAR - Dashboard jaisa */
         .navbar {
    background: #2c3e50;
    color: white;
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 20px;
    font-weight: bold;
}

.nav-links a {
    color: white;
    text-decoration: none;
    margin-left: 10px;
    padding: 8px 12px;
    background: #3498db;
    border-radius: 5px;
}

.nav-links a:hover {
    background: #2980b9;
}
         
        /* VIEW CONTAINER */
        .view-container {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }
        .note-title {
            font-size: 32px;
            color: #2c3e50;
            margin-bottom: 15px;
        }
        .note-subject {
            font-size: 15px;
            color: #4e73df;
            background: #e8efff;
            padding: 6px 14px;
            border-radius: 20px;
            display: inline-block;
            margin-bottom: 25px;
            font-weight: 500;
        }
        .note-content {
            font-size: 18px;
            line-height: 1.8;
            color: #333;
            white-space: pre-wrap;
            border-top: 1px solid #eee;
            padding-top: 25px;
        }
        .back-btn {
            margin-top: 35px;
            padding: 12px 28px;
            background: #6c757d;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
        }
        .back-btn:hover {
            background: #5a6268;
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">📝 Notes Manager</div>
    <div class="user-info">Welcome, <%=userName %></div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp">Dashboard</a>
        <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
    </div>
</div>

<!-- VIEW NOTE SECTION -->
<div class="view-container">
    <h1 class="note-title"><%=title%></h1>
    <span class="note-subject">Subject: <%=subject%></span>
    
    <div class="note-content"><%=content%></div>
    
    <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp" class="back-btn">← Back to Dashboard</a>
</div>

</body>
</html>