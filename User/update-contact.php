<?php
include("connection.php");
session_start();
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Update Donor Contact</title>
    <link rel="stylesheet" type="text/css" href="css/updatecontact.css">
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
                
                <h1 align="center">Update Donor Contact</h1>
                <center><div id="form">
                  <form action="" method="post">
                    <table>
                      
                      <tr>
                        <td width="200px" height="50px">ID</td>
                        <td width="200px" height="50px"><input type="text" name="id" placeholder="Enter ID"></td>
                        </tr><tr><td width="200px" height="50px">Mobile</td>
                        <td width="200px" height="50px"><input type="text" name="mobile" placeholder="Enter Mobile"> </tr>
                      </tr>
                      <tr>
                        <td><input type="submit" name="sub" value="Submit"></td><center></center>
                      </tr>
                      <?php
                      if(isset($_POST['sub'])) {
                      $id = $_POST['id'];
                      $mobile = $_POST['mobile'];
                      
                      
                      // $q = $db->query("SELECT dr.name, dr.mobile, dr.bgroup, da.state, dr.age FROM donor_registration dr INNER JOIN address_d da ON dr.id = da.id WHERE dr.bgroup='$bgroup' AND da.state='$state'");
                      $q = $db->prepare("SELECT update_mobile(:id, :mobile) AS result");
                      $q->bindParam(":id", $id);
                      $q->bindParam(":mobile", $mobile);
                      $q->execute();
                      $result = $q->fetch(PDO::FETCH_ASSOC);
                      $message = $result['result'];
                       echo "<script>alert(' $message')</script>";
                      // Fetch the result set
                      
                      
                      
                      ?>
                      
                      
                      
                      <?php
                      }
                      
                      
                      ?>
                      
                      
                    </table>
                  </form>
                  
                  
                </div></center>
                <div id="footer"><h4 align="center">Thapar University Project 22-23</h4>
 <p align="center" > <a href="index.php"><font color="white">Home</font></a></p>                </div>
              </div>
            </div>
          </body>
        </html>