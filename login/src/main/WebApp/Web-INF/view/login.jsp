<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
    <div class="main">
        <h1 class="heding">Login page</h1>
        
        <form action="/loginpage" method="post">
        <div class="input-1">
        <input class="input" type="email" id="Username" name="email" placeholder="UserName" required>
        
        <input class="input" type="password" id="Password" name="password" placeholder="Password" required>
       
    </div>
<button type="submit" class="on-hover">Log in</button>
<button class="on-hover">Forget Password</button>
</form>
</div>
<script>
    let msg="${msg}"
    if (msg) { 
      alert(msg)
    }
   </script>

<!-- <script src="/resources/JavaScript/login.js"></script> -->
</body>
</html>