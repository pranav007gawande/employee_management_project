<jsp:include page="/Web-INF/view/heder.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Registration</title>
    <link rel="stylesheet" href="/resources/css/homestyle.css">
    <link rel="stylesheet" href="/resources/css/from.css">
    
</head>
<body>
    
    <div class="container1">
        <form action="/saveEmployee" method="post" enctype="multipart/form-data" id="registrationForm" >
            <fieldset>
                <div class="form">  Employee Registration Form</div>
                <h4 style="color:green;">${msg}</h4>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Employee Name: <span class="mandatory">*</span></label>
                        <input type="text" id="name" name="employeename" placeholder="Enter Your Name">
                        <span id="nameError" class="error"></span>
                    </div>
                    <div class="form-group-item">
                        <label>Employee Address:</label>
                        <input type="text" id="address" name="employeeaddress" placeholder="Enter Your Address">
                    </div>
                </div>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Mobile No: <span class="mandatory">*</span></label>
                        <input type="number" id="mobile" name="mobileno" placeholder="Mobile No">
                        <span id="mobileError" class="error"></span>
                    </div>
                    <div class="form-group-item">
                        <label>Email: <span class="mandatory">*</span></label>
                        <input type="email" id="email" name="email" placeholder="Enter Your Email">
                        
                    </div>

                    
                </div>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Salary: <span class="mandatory">*</span></label>
                        <input type="number" id="salary" name="salary" placeholder="Enter Salary">
                        <span id="salaryError" class="error"></span>
                    </div>
                    <div class="form-group-item">
                        
                        <label>Password: <span class="mandatory">*</span></label>
                        <input type="password" id="password" name="password" placeholder="Enter Your Password">
                        <span id="passwordError" class="error"></span>
                    </div>
                </div>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Date of Joining: <span class="mandatory">*</span> </label>
                        <input type="date" id="doj" name="doj">
                        <span id="dojError" class="error"></span>
                        
                        
                    </div>
                    <div class="form-group-item">
                        
                        <label>Date of Birth:</label>
                        <input type="date" id="dob" name="dob">

                    </div>
                </div>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Employee Department:</label>
                        <select name="Department" id="department">
                            <option value="">---Select Department---</option>
                            <option value="HR">HR Department</option>
                            <option value="Admin">Dsa Department</option>
                            <option value="Developer">Developer Department</option>
                            <option value="Developer">Technical Department</option>
                        </select>
                    </div>
                    <div class="form-group-item">
                        <label>Employee Role:</label>
                        <select name="role" id="role">
                            <option value="">---Select Role---</option>
                            <option value="Employee">Employee</option>
                            <option value="Admin">Admin</option>
                            
                        </select>
                    </div>
                  
                   
            </div>
            <div class="form-group side-by-side">
                <div class="form-group-item">
                    <label for="photo">Photo <span class="mandatory">*</span></label>
            <input type="file" id="photo" name="Pic" accept="image/*" required>
            <!-- <img src="../../resources/uploads/" id="photo"  alt="" height="50px" width="50px" > -->
            <div class="error" id="photoError"></div>

                </div>
                <div class="form-group-item">
                    <label> Select Gender</label>
                    <label for="Gender" style="display: inline-block;">Male</label>
                    <input type="radio" name="Gender" id="Male" value="Male">
                    <label for="Gender" style="display: inline-block;">Female</label>
                    <input type="radio" name="Gender" id="Female" value="Female">
                    <label for="Gender" style="display: inline-block;">other</label>
                    <input type="radio" name="Gender" id="other" value="other">
                    </div>
            </div>
            

                <div class="form-actions">
                    
                    <button type="submit" id="submit">Submit</button>

                </div>
            </fieldset>
        </form>
    </div>
    <script src="/resources/JavaScript/Validaction.js"></script>
</body>
</html>
<jsp:include page="/Web-INF/view/footer.jsp"/>