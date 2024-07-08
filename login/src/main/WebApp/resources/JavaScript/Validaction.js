
    document.addEventListener('DOMContentLoaded', (event) => {
        const form = document.getElementById('registrationForm');
        const mobileNo = document.getElementById('mobile');
        const password = document.getElementById('password');
        const photo = document.getElementById('photo');
        const doj = document.getElementById('doj');
        const salary = document.getElementById('salary');
        const name = document.getElementById('name');
    
        // Set default date for DOJ as today's date
        doj.value = new Date().toISOString().split('T')[0];
    
        form.addEventListener('submit', function(event) {
            let isValid = true;
    
            // Validate name
            const namePattern = /^[A-Za-z\s]+$/;
            if (!namePattern.test(name.value)) {
                document.getElementById('nameError').textContent = 'Name can only contain letters and spaces.';
                isValid = false;
            } else {
                document.getElementById('nameError').textContent = '';
            }
    
            // Validate mobile number
            const mobilePattern = /^[0-9]{10}$/;
            if (!mobilePattern.test(mobileNo.value)) {
                document.getElementById('mobileError').textContent = 'Mobile number must be 10 digits.';
                isValid = false;
            } else {
                document.getElementById('mobileError').textContent = '';
            }
    
            // Validate password (minimum 6 characters)
            if (password.value.length < 8) {
                document.getElementById('passwordError').textContent = 'Password must be at least 8 characters long.';
                isValid = false;
            } else {
                document.getElementById('passwordError').textContent = '';
            }
    
            // Validate salary (greater than 1000)
            if (salary.value <= 1000) {
                document.getElementById('salaryError').textContent = 'Salary must be greater than 1000.';
                isValid = false;
            } else {
                document.getElementById('salaryError').textContent = '';
            }
    
            // Validate photo (only jpg, jpeg, png formats)
            const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;
            if (!allowedExtensions.test(photo.value)) {
                document.getElementById('photoError').textContent = 'Please upload jpg, jpeg, or png photo.';
                isValid = false;
            } else {
                document.getElementById('photoError').textContent = '';
            }
    
            // Validate DOJ (must not be empty)
            if (!doj.value) {
                document.getElementById('dojError').textContent = 'Date of Joining is required.';
                isValid = false;
            } else {
                document.getElementById('dojError').textContent = '';
            }
    
            if (!isValid) {
                event.preventDefault();
            }
        });
        
    });
    
   
    
     
    