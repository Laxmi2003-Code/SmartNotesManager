<%@ page import="java.sql.*,util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);

    if(session.getAttribute("user_id") == null) {
        response.sendRedirect("../html/login.html"); 
        return;
    }
    int userId = (Integer) session.getAttribute("user_id");
    String userName = (String)session.getAttribute("user_name");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Notes Dashboard</title>
    <link rel="stylesheet" href="../css/dashboard.css">
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">📝 Notes Manager</div>
    <div style="color:white;font-weight:500;">Welcome, <%=userName %></div>
    <div class="nav-links">
        <a href="../html/addNote.html">+ Add Note</a>
        <a href="../LogoutServlet">Logout</a>
    </div>
</div>

<!-- SEARCH BAR -->
<div style="max-width: 1100px; margin: 20px auto 0 auto; padding: 0 20px;">
    <form method="get" action="dashboard.jsp" style="display: flex; gap: 10px;">
        <input type="text" name="search" placeholder="Search by title or subject..." 
               value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>"
               style="flex: 1; padding: 12px; border: 1px solid #ddd; border-radius: 6px; font-size: 15px;">
        <button type="submit" style="padding: 12px 25px; background: #4e73df; color: white; border: none; border-radius: 6px; cursor: pointer;">Search</button>
        <a href="dashboard.jsp" style="padding: 12px 25px; background: #6c757d; color: white; border: none; border-radius: 6px; text-decoration: none;">Clear</a>
    </form>
</div>

<!-- NOTES SECTION -->
<div class="container">
<%
    Connection con = null;
    try {
        con = DBConnection.getConnection();
        
        String search = request.getParameter("search");
        String sql;
        PreparedStatement ps;

        if(search != null && !search.trim().isEmpty()) {
            sql = "SELECT * FROM notes WHERE user_id=? AND (title LIKE ? OR subject LIKE ?) ORDER BY id DESC";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, "%" + search + "%");
            ps.setString(3, "%" + search + "%");
        } else {
            sql = "SELECT * FROM notes WHERE user_id=? ORDER BY id DESC";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
        }
        ResultSet rs = ps.executeQuery();
        
        boolean hasNotes = false;
        while(rs.next()) {
            hasNotes = true;
            int noteId = rs.getInt("id");
%>
    <!-- NOTE CARD -->
    <div class="note-card">
        <h3><%= rs.getString("title") %></h3>  
        <h4 style="color:#666;margin:5px 0;">Subject: <%= rs.getString("subject") %></h4>
        <p><%= rs.getString("content").replace("\n", "<br>") %></p>
        <div class="buttons">
            <a href="../ViewSingleNoteServlet?id=<%= noteId %>" class="view">View</a>
            <a href="../EditNotesServlet?id=<%= noteId %>" class="edit">Edit</a>
            <a href="../DeleteNoteServlet?id=<%= noteId %>" class="delete" onclick="return confirm('Delete this note?')">Delete</a>
        </div>
    </div>
<%
        }
        
        if(!hasNotes) {
            if(search != null && !search.trim().isEmpty()) {
%>
        <p style="text-align:center; width:100%;">No notes found for "<b><%=search%></b>"</p>
<%
            } else {
%>
        <p style="text-align:center; width:100%;">There is no note yet. Click on "Add Note" to create one</p>
<%
            }
        }
        
    } catch(Exception e) {
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        if(con != null) con.close();
    }
%>
</div>

</body>
</html>