<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/heder.css">
</head>
<body>
    <header>
        <div class="nav-bar">
            <img src="https://www.nitssoftwares.com/assets/img/logo-headers-Black.png" alt="Nits_logo" height="50px" class="logo">
            <a href="/home">Home</a>
            <% 

          String role=(String)session.getAttribute("role");

          if(role.equalsIgnoreCase("Admin"))
          { %>
              <a href="/addEmployee">Add Employee</a>

            <%
           
          }
          
          
          %>
          
            <a href="/emplist">List of Employee </a>
            <a href="/getEmployeeById/<%= session.getAttribute("id") %>">Profile-(<%= session.getAttribute("name") %>)</a>
            <a style="margin-right: 25px;" href="/logout?eid=<%= session.getAttribute("id") %>">Logout</a>
        </div>
    </header>
</body>
</html>