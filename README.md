# Ebook Management System

An advanced Java web application project to manage an ebook store using Servlets, JSP, and MySQL database.

---

## 📌 Features

- User authentication with login and registration
- Role-based access (admin and user)
- Add, update, delete, and view ebooks
- Search and filter ebooks by title, author, and category
- Pagination for ebook listings
- Responsive user interface
- Input validation and error handling

---

## 🧰 Technologies Used

| Component | Technology |
|-----------|------------|
| Backend   | Java (Servlets & JSP) |
| Frontend  | HTML, CSS, JavaScript |
| Database  | MySQL |
| Server    | Apache Tomcat |

---

## 🗂️ Project Structure

Ebook-app/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── com.admin.servlet/     # Admin-related servlets
│   │   │   ├── com.user.servlet/      # User-related servlets
│   │   │   ├── com.DAO/               # Data Access Objects
│   │   │   ├── com.DB/                # Database connection configuration
│   │   │   └── com.entity/            # Entity / Model classes
│   │   ├── resources/                # Configuration files
│   │   └── webapp/
│   │       ├── css/                  # Stylesheets
│   │       ├── js/                   # JavaScript files
│   │       ├── images/               # Image assets
│   │       └── WEB-INF/              # JSP pages & web.xml
│   └── test/
│       ├── java/                     # Test classes
│       └── resources/
├── pom.xml                            # Maven dependencies
├── target/                           
└── README.md
