package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DBConnection;

@WebServlet("/EditNotesServlet")
public class EditNotesServlet extends HttpServlet {
    
    // STEP 1: Form dikhana GET se - purana data load karke
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        if(session.getAttribute("user_id") == null) {
            response.sendRedirect("html/login.html");
            return;
        }
        
        int noteId = Integer.parseInt(request.getParameter("id"));
        int userId = (Integer) session.getAttribute("user_id");
        
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM notes WHERE id=? AND user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, noteId);
            ps.setInt(2, userId);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
                request.setAttribute("noteId", rs.getInt("id"));
                request.setAttribute("subject", rs.getString("subject"));
                request.setAttribute("title", rs.getString("title"));
                request.setAttribute("content", rs.getString("content"));
                request.getRequestDispatcher("jsp/editNote.jsp").forward(request, response);
            } else {
                response.sendRedirect("jsp/dashboard.jsp"); // Note nahi mila ya kisi aur ka hai
            }
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("jsp/dashboard.jsp");
        }
    }

    // STEP 2: Update karna POST se - form submit hone pe
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        if(session.getAttribute("user_id") == null) {
            response.sendRedirect("html/login.html");
            return;
        }
        
        int userId = (Integer) session.getAttribute("user_id");
        int noteId = Integer.parseInt(request.getParameter("id"));
        String subject = request.getParameter("subject");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        System.out.println("Updating Note ID: " + noteId + " for User: " + userId);
        
        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE notes SET subject=?, title=?, content=? WHERE id=? AND user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, subject);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.setInt(4, noteId);
            ps.setInt(5, userId);
            
            int rowsUpdated = ps.executeUpdate(); // Kitni row update hui?
            System.out.println("Rows Updated: " + rowsUpdated);
            
            con.close();
            
            response.sendRedirect("jsp/dashboard.jsp");
            
        } catch(Exception e) {
            System.out.println("Update Error: ");
            e.printStackTrace();
            response.sendRedirect("jsp/dashboard.jsp");
        }
    }
}