<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if(session.getAttribute("user_id") == null) {
        response.sendRedirect("../html/login.html"); 
        return;
    }
    String userName = (String)session.getAttribute("user_name");
    
    Integer noteId = (Integer) request.getAttribute("noteId");
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
    <title>Edit Note - Notes Manager</title>
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
        
        /* NAVBAR - DASHBOARD JAISE HI */
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
        /* EDIT CONTAINER */
        .edit-container {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }
        .edit-container h2 {
            font-size: 28px;
            color: #2c3e50;
            margin-bottom: 25px;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 15px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            font-family: inherit;
        }
        .form-group textarea {
            min-height: 200px;
            resize: vertical;
        }
        .form-group input:focus, .form-group textarea:focus {
            outline: none;
            border-color: #4e73df;
        }
        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 25px;
        }
        .btn {
            padding: 12px 28px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
        }
        .btn-update {
            background: #28a745;
            color: white;
        }
        .btn-update:hover {
            background: #218838;
        }
        .btn-cancel {
            background: #6c757d;
            color: white;
        }
        .btn-cancel:hover {
            background: #5a6268;
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">📝 Notes Manager</div>
    <div style="color:white;font-weight:500;">Welcome, <%=userName %></div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp">Dashboard</a>
        <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
    </div>
</div>

<!-- EDIT FORM -->
<div class="edit-container">
    <h2>Edit Note</h2>
    <form action="${pageContext.request.contextPath}/EditNotesServlet" method="post">
        <input type="hidden" name="id" value="<%=noteId%>">
        
        <div class="form-group">
            <label>Subject:</label>
            <input type="text" name="subject" value="<%=subject%>" required>
        </div>
        
        <div class="form-group">
            <label>Title:</label>
            <input type="text" name="title" value="<%=title%>" required>
        </div>
        
        <div class="form-group">
            <label>Content:</label>
            <textarea name="content" required><%=content%></textarea>
        </div>
        
        <div class="btn-group">
            <button type="submit" class="btn btn-update">Update Note</button>
            <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp" class="btn btn-cancel">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>