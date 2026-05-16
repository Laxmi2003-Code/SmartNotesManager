package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBConnection;

@WebServlet("/ViewNotesServlet")

public class ViewNotesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        try {

            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM notes";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            out.println("<h2>All Notes</h2>");

            while(rs.next()) {

                out.println("<hr>");

                out.println("<h3>Subject: "
                        + rs.getString("subject")
                        + "</h3>");

                out.println("<h4>Title: "
                        + rs.getString("title")
                        + "</h4>");

                out.println("<p>"
                        + rs.getString("content")
                        + "</p>");
            }

        } catch(Exception e) {

            e.printStackTrace();

        }
    }
}