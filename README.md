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


