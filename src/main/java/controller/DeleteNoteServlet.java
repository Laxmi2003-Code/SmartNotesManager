package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DBConnection;

@WebServlet("/DeleteNoteServlet")
public class DeleteNoteServlet extends HttpServlet {
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
            // user_id check karna zaroori hai warna koi bhi kisi ka note delete kar dega
            String sql = "DELETE FROM notes WHERE id=? AND user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, noteId);
            ps.setInt(2, userId);
            ps.executeUpdate();
            con.close();
            
            response.sendRedirect("jsp/dashboard.jsp");
            
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}