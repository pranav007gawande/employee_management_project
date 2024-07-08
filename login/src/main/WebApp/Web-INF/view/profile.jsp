<jsp:include page="/Web-INF/view/heder.jsp"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Registration</title>
        <link rel="stylesheet" href="/resources/css/homestyle.css">
        <link rel="stylesheet" href="/resources/css/profile.css">
    <body>
        
    <div class="container1">
        <form action=""  id="registrationForm" >
            <fieldset>
                <div class="form">  Employee Profile  </div>
                <center>
                <img style="margin-bottom: 10px; border-radius: 50px;" src="../../resources/uploads/${emp.photo}" alt="" height="150px" width="150px">

            </center>
         
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Employee Name: </label>
                        <input type="text" id="name"  value="${emp.employeename}" name="employeename" placeholder="Enter Your Name" disabled>
                        <span id="nameError" class="error-message"></span>
                    </div>
                    <div class="form-group-item">
                        <label>Employee Address:</label>
                        <input type="text" id="address"  value="${emp.employeeaddress}" name="employeeaddress" placeholder="Enter Your Address" disabled>
                    </div>
                </div>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Mobile No: </label>
                        <input type="number" id="mobile" value="${emp.mobileno}" name="mobileno" placeholder="Mobile No" disabled>
                    </div>
                    <div class="form-group-item">
                        <label>Email: </label>
                        <input type="email" id="email" value="${emp.email}" name="email" placeholder="Enter Your Email" disabled>
                        <span id="emailError" class="error-message">Email must be filled out</span>
                    </div>

                    
                </div>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Salary: </label>
                        <input type="number" id="salary" value="${emp.salary}" name="salary" placeholder="Enter Salary" disabled>
                        <span id="salaryError" class="error-message">Salary must be filled out and must be a number</span>
                    </div>
                    <div class="form-group-item">
                        
                        <label>Password: </label>
                        <input type="password" id="password" value="${emp.password}" name="password" placeholder="Enter Your Password" disabled>
                    </div>
                </div>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Date of Joining: </label>
                        <input type="date" id="doj" value="${emp.doj}" name="doj" disabled>
                        <span id="dojError" class="error-message">date of joining is mandatory</span>
                        
                        
                    </div>
                    <div class="form-group-item">
                        
                        <label>Date of Birth:</label>
                        <input type="date" id="dob" value="${emp.dob}" name="dob" disabled>

                    </div>
                </div>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Employee Department:</label>
                        <input type="text" name="Department" value="${emp.department}" id="department" disabled>
                        
                    </div>
                    <div class="form-group-item">
                        <label>Employee Role:</label>
                        <input type="text"name="role" id="role" value="${emp.role}" disabled>
                        
                    </div>
                  
                   
            </div>
            <div class="form-group side-by-side">
                <div class="form-group-item">
                    <label>EmployeeID:</label>
                    <input type="number" name="employeeid" id="id" value="${emp.employeeid}" disabled>
                   
                </div>
                <div class="form-group-item">
                    <label> Select Gender</label>
                    <input type="text" name="Gender" id="gender" value="${emp.gender}" disabled>
                   
                    </div>
            </div>

                <!-- <div class="form-actions">
                    
                    <button type="submit" id="submit">Submit</button>

                </div> -->
            </fieldset>
        </form>
    </div>
    <!-- <script src="/resources/css/profile.css"></script> -->
</body>
</html>
<jsp:include page="/Web-INF/view/footer.jsp"/>