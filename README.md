# 📝 SmartNotesManager

A full-stack web application to create, manage and organize personal notes with secure user authentication.

## 🚀 Live Demo


## ✨ Features
- **User Authentication**: Secure registration and login system with session management
- **CRUD Operations**: Create, view, edit, and delete notes seamlessly  
- **Search Functionality**: Instantly search notes by title or content
- **Responsive Design**: Clean UI built with Bootstrap, works on all devices
- **Database Integration**: Persistent data storage using MySQL + JDBC

## 🛠️ Tech Stack
**Backend**: Java, Jakarta Servlet, JSP, JDBC  
**Frontend**: HTML5, CSS3, Bootstrap 5  
**Database**: MySQL  
**Server**: Apache Tomcat 9+  
**Tools**: Eclipse IDE, Git, GitHub

## 📂 Project Structure
SmartNotesManager/
├── src/main/
│   ├── java/                 # Java Source Files
│   │   ├── controller/       # Servlet Controllers
│   │   ├── dao/             # Data Access Objects
│   │   ├── model/           # POJO Classes
│   │   └── util/            # DBConnection utility
│   └── webapp/              # Web Resources
│       ├── WEB-INF/         # web.xml config
│       ├── css/             # Stylesheets
│       └── .jsp            # JSP Pages
├── .classpath
├── .project
└── README.md
## Setup Instructions
1. Clone this repository
2. Create MySQL database smartnotes_db
3. Import the SQL file from /database folder
4. Update database credentials in src/main/java/util/DBConnection.java
5. Import project into Eclipse as Dynamic Web Project
6. Add to Tomcat Server and Run

## Screenshots
<img width="700" height="400" alt="Screenshot 2026-05-16 114548" src="https://github.com/user-attachments/assets/9c38dc5f-ea9a-4ea1-a2ca-52c4212f38fd" />
<img width="700" height="400" alt="Screenshot 2026-05-16 114601" src="https://github.com/user-attachments/assets/b46ef83b-a45d-4131-a288-9d9a3f0a05f7" />
<img width="1000" height="327" alt="Screenshot 2026-05-16 120333" src="https://github.com/user-attachments/assets/9ec8a216-3d75-47a3-b032-c43d6035188f" />


