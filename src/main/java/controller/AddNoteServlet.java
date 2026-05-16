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

@WebServlet("/AddNoteServlet")

public class AddNoteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String subject = request.getParameter("subject");

        String title = request.getParameter("title");

        String content = request.getParameter("content");
        HttpSession session = request.getSession();
        int userId =(Integer)session.getAttribute("user_id");

        try {

            Connection con = DBConnection.getConnection();

            String query =
            "INSERT INTO notes(user_id,subject,title,content) VALUES(?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);
            
            ps.setInt(1, userId);
            ps.setString(2, subject);
            ps.setString(3, title);
            ps.setString(4, content);

            ps.executeUpdate();

            response.sendRedirect("jsp/dashboard.jsp");

        } catch(Exception e) {

            e.printStackTrace();

        }
    }
}