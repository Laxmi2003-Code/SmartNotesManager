package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Session nikalo, false ka matlab naya mat banao agar exist nahi karta
        HttpSession session = request.getSession(false);
        
        // 2. Agar session mila to invalidate kar do
        if(session != null) {
            session.invalidate();
        }
        
        // 3. Browser ko bolo ki ye page cache mat karna
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0  
        response.setDateHeader("Expires", 0); // Proxies
        
        // 4. Login page pe bhej do
        response.sendRedirect("html/login.html");
    }
    
    // POST se bhi logout ho sake isliye
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}