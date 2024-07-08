<jsp:include page="/Web-INF/view/heder.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- onclick="return confirm('You Want to Delete This Record')" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/popup.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/homestyle.css">
</head>
<body>

    <div class="mt-5 mb-5">
    <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">employeename</th>
            <th scope="col">mobileno</th>
            <th scope="col">email</th>
            <th scope="col">dob</th>
            <%
            String role=(String)session.getAttribute("role");
            if(role.equalsIgnoreCase("Admin"))
            { 
                
                %>
            <th scope="col">doj</th>
            <th scope="col">salary</th>
            <th scope="col">Role</th>
            <th scope="col">Status</th>

            <%
            
              }
            %>
            <th scope="col">Department</th>
            <th scope="col">Gender</th>
            <th scope="col">employeeaddress</th>
            <%
           
              if(role.equalsIgnoreCase("Admin"))
              { 
              
            %>
           
            <th scope="col">Action</th>

            <%
            
              }
            %>
            
           
          </tr>
        </thead>
        <tbody>
            <c:forEach var="employee" items="${list}" varStatus="status">
          <tr>
            <th scope="row">${status.index + 1}</th>
            <td class="d-flex align-items-center pt-4 pb-4"><img src="../../resources/uploads/${employee.photo}" alt="" class="rounded-circle bg-primary me-3" height="40px" width="40px"><c:out value="${employee.employeename}"/></td>
               
            <td><c:out value="${employee.mobileno}"/></td>
            <td><c:out value="${employee.email}"/></td>
            <td><c:out value="${employee.dob}"/></td>
            <%
            
            if(role.equalsIgnoreCase("Admin"))
            { 
                %>
                  <td><c:out value="${employee.doj}"/></td>
                  <td><c:out value="${employee.salary}"/></td>
                  <td><c:out value="${employee.role}"/></td>
                  <td><c:out value="${employee.status}"/></td>
           
            <%
            
        }
      %>
            <td><c:out value="${employee.department}"/></td>
            <td><c:out value="${employee.gender}"/></td>
            <td><c:out value="${employee.employeeaddress}"/></td>

            <%
           
            if(role.equalsIgnoreCase("Admin"))
            { 
              %>
                
              <td class="d-flex align-items-center pt-4"><a  type="button"  class="btn btn outline-none" data-toggle="modal" data-target="#editModal" onclick="Editemployee('${employee.employeeid}')"><img  src="../../resources/Images/edit_icon.png" alt="edit_icon"  height="35px"></a><a type="button" class="btn btn outline-none" href="/deleteEmpbyid/${employee.employeeid}" onclick="return confirm('You Want to Delete This Record')"  ><img src="../../resources/Images/delete_icon.png" alt="delete_icon"  height="35px" ></a></td>
            </tr>
         
          <%
          
      }
    %>
           
          
        </c:forEach>
        </tbody>
      </table>
    </div>
    <!-- Modal -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
      <div style="width: 900px; margin-left: -200px;" class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Edit Employee</h5>
              <button style="    margin-left: 650px;" type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
          </div>
          <div class="modal-body">
              <!-- Employee Registration Form -->

              <form action="/updateEmp" method="post" enctype="multipart/form-data" id="registrationForm">
                <input type="text" name="employeeid" hidden id="">
                  <fieldset>
                      <div class="form">Employee Registration Form</div>
                      <!-- <h4 style="color:green;">${msg}</h4> -->
                      <!-- Form Fields Here -->
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
                      <!-- Other form groups -->
                      
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
                                <option value="Admin">Admin Department</option>
                                <option value="Developer">Developer Department</option>
                            </select>
                        </div>
                        <div class="form-group-item">
                            <label>Employee Role:</label>
                            <select name="role" id="role">
                                <option value="">---Select Role---</option>
                                <option value="HR">HR</option>
                                <option value="Admin">Admin</option>
                                <option value="Developer">Developer</option>
                            </select>
                        </div>
                      
                       
                </div>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label for="photo">Photo <span class="mandatory">*</span></label>
                        <input type="file"  name="Pic">
                        <img src="../../resources/uploads" alt="" id="photo" style="width: 80px;height: 80px;">
    
                    </div>
                    <div class="form-group-item">
                        <label> Select Gender</label>

                        <select name="Gender" id="gender">
                            <option value="">Select Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                        </div>
                </div>
                <div class="form-actions">
                  <button type="submit" id="submit" style="margin-left: 750px;">Submit</button>
              </div>
                  </fieldset>
              </form>
          </div>
      </div>
  </div>
</div>

</body>


    <script src="/resources/JavaScript/Validaction.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>

function Editemployee(employeeid)
    {
       
        $.ajax({
            url:'/getEmpById/'+employeeid,
            success:function(data)
            {

                console.log(data);  
                
                let obj=data;
                console.log(obj);
                $("[name=employeeid]").val(obj.employeeid);
                $("[name=employeename]").val(obj.employeename);
                $("[name=employeeaddress]").val(obj.employeeaddress);
                $("[name=mobileno]").val(obj.mobileno);
                $("[name=email]").val(obj.email);
                $("[name=salary]").val(obj.salary);
                $("[name=password]").val(obj.password);
                $("[name=doj]").val(obj.doj);
                $("[name=dob]").val(obj.dob);
                $("[name=Department]").val(obj.department);
                $("[name=role]").val(obj.role);
                $("[name=Photo]").val(obj.photo);
                $("[name=Gender]").val(obj.gender);
               document.getElementById('photo').src='../../resources/uploads/'+obj.photo;
               
                // console.log(photo.src);
                
            }
        });
    }
    </script>
</html>
<jsp:include page="/Web-INF/view/footer.jsp"/>

