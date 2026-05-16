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

@WebServlet("/ViewSingleNoteServlet")
public class ViewSingleNoteServlet extends HttpServlet {
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
                request.getRequestDispatcher("jsp/viewNote.jsp").forward(request, response);
            } else {
                response.sendRedirect("jsp/dashboard.jsp"); // Note nahi mila
            }
            con.close();
            
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}