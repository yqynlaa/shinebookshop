# ShineBookShop – Online Bookstore System

ShineBookShop is a JSP- and Java-based online bookstore system that allows users to browse books, search by categories or keywords, manage shopping carts, place orders, and enables administrators to maintain products, users, and orders through a backend management interface. The system adopts a three-tier architecture consisting of JSP (frontend display), Java Servlets and JavaBeans (business logic), and MySQL (data storage).

---

## 1. Quick Start (One-Click Launch)

### Start the System

1. Double-click `Start_Project.bat`
2. Wait for the script to complete automatic configuration
3. IntelliJ IDEA will open automatically
4. Click **Run** in IntelliJ IDEA to start the project

### Access Addresses

| Module            | URL                                                                                    |
| ----------------- | -------------------------------------------------------------------------------------- |
| Frontend Homepage | [http://localhost:8080/shinebookshop/](http://localhost:8080/shinebookshop/)           |
| Admin Backend     | [http://localhost:8080/shinebookshop/admin](http://localhost:8080/shinebookshop/admin) |

### Default Administrator Account

| Role          | Username | Password |
| ------------- | -------- | -------- |
| Administrator | admin    | admin    |

---

## 2. Automation Scripts

| Script              | Description                                        |
| ------------------- | -------------------------------------------------- |
| `Start_Project.bat` | Full automatic startup script                      |
| `Check_Status.bat`  | Environment and configuration status checking tool |

---

## 3. System Requirements

| Component  | Version Requirement        |
| ---------- | -------------------------- |
| Java       | JDK 1.8 or above           |
| Database   | MySQL 5.7 / 8.0            |
| IDE        | IntelliJ IDEA              |
| Web Server | Apache Tomcat 8.5 or above |

---

## 4. Automated Configuration Included

| Item                                     | Status                  |
| ---------------------------------------- | ----------------------- |
| Database connection and compatibility    | Completed               |
| IntelliJ IDEA project configuration      | Automatically generated |
| Tomcat runtime configuration             | One-click deployment    |
| Dependency libraries (JAR)               | Fully configured        |
| Character encoding                       | UTF-8                   |
| Database initialization and verification | Automatically performed |

---

## 5. Troubleshooting

If the project fails to start, follow the steps below:

1. Run `Check_Status.bat` to view environment reports
2. Ensure MySQL service is running
3. Check whether port **8080** is already occupied
4. Confirm Tomcat is configured in IntelliJ IDEA

---

## 6. Project Structure

```
shinebookshop/
├── Start_Project.bat            # Main startup script
├── Check_Status.bat             # Environment check tool
├── src/                         # Java source code
│   ├── servlet/                 # Servlet controllers
│   ├── beans/                   # JavaBeans data models
│   └── util/                    # JDBC utilities
├── WebContent/                  # JSP pages and web resources
├── lib/                         # Dependency JAR files
├── shinebookshop.sql            # Database schema file
└── README.md
```

---

## 7. System Features

### Frontend Functions

* Book browsing and search
* Category-based display
* Shopping cart and checkout process
* Member registration and login
* Order history and status tracking

### Backend Management

* Book information maintenance (add / edit / delete)
* Category management
* User management (freeze / unfreeze)
* Order processing and details

---

## 8. Database Overview

The database contains six main tables:

* `s_user` — user information
* `s_book` — book details
* `tb_Order` — order main table
* `tb_order_detail` — order item details
* `s_catalog` — categories
* `s_admin` — administrator accounts

Database script file: `shinebookshop.sql`

---


