<?php
include("connection.php");
session_start();
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Admin Sign Up</title>
    <link rel="stylesheet" type="text/css" href="css/admin_home.css">
  </head>
  <body>
    <div id="full">
      <div id="inner_full
        <div id="header
          <div id="full">
            <div id="inner_full">
              <div id="header"><h2 align="center"><a href="index.php" style="text-decoration: none ;color: white;">Blood Bank Management System</a></h2></div>
              <div id="body">
                <br>
                <h1 align="center">Sign Up </h1>
                <center><div id="form">
                  <form action="" method="post">
                    <table>
                      
                      <tr>
                        <td width="200px" height="50px">Name</td>
                        <td width="200px" height="50px"><input type="text" name="name" placeholder="Enter Name"></td>
                      </td>
                    </tr>
                    <tr>
                      
                      <td width="200px" height="50px">Username</td>
                      <td width="200px" height="50px"><input type="text" name="uname" placeholder="Enter Username">
                    </td>
                  </tr>
                  <tr>
                    
                    
                    <td width="200px" height="50px">Password</td>
                    <td width="200px" height="50px"><input type="text" name="pass" placeholder="Enter Password">
                  </td>
                </tr>
                
                <tr>
                  <td width="200px" height="50px">Confirm Password</td>
                  <td width="200px" height="50px"><input type="text" name="con_pass" placeholder=" "></td>
                  
                </tr>
                
                <tr>
                  <td width="200px" height="50px">E-mail</td>
                  <td width="200px" height="50px"><input type="text" name="email" placeholder="Enter E-Mail"></td>
                  
                </tr>
                
                <tr>
                  <td width="200px" height="50px">Special Id</td>
                  <td width="200px" height="50px"><input type="text" name="special_id" placeholder="Enter Special ID"></td>
                  
                </tr>
                
                <tr>
                  <td><input type="submit" name="sub" value="Save"></td>
                </tr>
              </table>
            </form>
            
            <?php
            if(isset($_POST['sub']))
            {
            
            $uname=$_POST['uname'];
            $pass=$_POST['pass'];
            $con_pass=$_POST['con_pass'];
            $name=$_POST['name'];
            $email=$_POST['email'];
            $special_id=$_POST['special_id'];
            $q = $db->prepare("CALL admin_insert(:uname, :pass,:con_pass,:name, :email, :special_id,@message)");
            $q->bindValue(':uname', $uname);
            $q->bindValue(':pass', $pass);
            $q->bindValue(':con_pass', $con_pass);
            $q->bindValue(':name', $name);
            $q->bindValue(':email', $email);
            $q->bindValue(':special_id', $special_id);
            $q->execute();
            $message = $db->query("SELECT @message")->fetch(PDO::FETCH_ASSOC)['@message'];
            echo "<script>alert('$message')</script>";
            }
            ?>
          </div></center>
          <div id="footer"><h4 align="center">Thapar University Project 22-23</h4>
          </div>
        </div>
      </div>
    </body>
  </html>