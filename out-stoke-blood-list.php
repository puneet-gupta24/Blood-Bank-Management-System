<?php
include("connection.php");
session_start();
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Exchanged Blood Donor List</title>
    <link rel="stylesheet" type="text/css" href="css/out_stoke_blood_list.css">
    <style type="text/css">
    td{
    width:200px;
    height:30px;
    }
    </style>
  </head>
  <body>
    <div id="full">
      <div id="inner_full
        <div id="header
          <div id="full">
            <div id="inner_full">
              <div id="header"><h2 align="center"><a href="admin-home.php" style="text-decoration: none ;color: white;">Blood Bank Management System</a></h2></div>
              <div id="body">
                <br>
                <?php
                $un=$_SESSION['un'];
                if(!$un)
                {
                header("Location:index.php");
                }
                ?>
                <h1 align="center">Blood Used</h1><br><br>
                <center><div id="form">
                  <table>
                    <tr>
                      <td><center><b><font color="black">S.No</font></b></center></td>
                      <td><center><b><font color="black">Name</font></b></center></td>
                      
                     
                      <td><center><b><font color="black">Mobile</font></b></center></td>
                      <td><center><b><font color="black">Blood Type</font></b></center></td>
                     
                    </tr>
                    <?php
                    $q=$db->query("SELECT * FROM out_stoke_b ob RIGHT OUTER JOIN donor_registration dr ON ob.mobile = dr.mobile WHERE ob.mobile IS NOT NULL; ");
                    $q2=$db->query("SELECT * FROM out_stoke_b; ");
                    $count=0;
                    while($r2=$q2->fetch(PDO::FETCH_OBJ)){
                      $count++;
                    
                  
                    ?>
                    <tr>
                     
                     <td><center><?= $count; ?></center></td>
                      <td><center><?= $r2->name; ?></center></td>
                      <td><center><?= $r2->mobile; ?></center></td>
                      
                      <td><center><?= $r2->bgroup; ?></center></td>
                      
                     
                    </tr>
                    <?php
                  }
                    
                    ?>
                    
                  </table>
                </div></center>
                <div id="footer"><h4 align="center">Thapar University Project 22-23</h4>
                  <p align="center" > <a href="logout.php"><font color="white">Logout</font></a></p>
                </div>
              </div>
            </div>
          </body>
        </html>