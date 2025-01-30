<?php
include("connection.php");
session_start();
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Donor List</title>
    <link rel="stylesheet" type="text/css" href="css/stoke_blood_list.css">
    <style type="text/css">
    td{
    width:200px;
    height:30px;
    }
    </style>
  </head>
  <body>
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
          <h1 align="center">Blood Stock Availability</h1><br><br>
          <center>
          <div id="form"><br><br>
            <table>
              <tr>
                <td><center><b><font color="black">Name</font></b></center></td>
                <td><center><b><font color="black">Quantity (in Units)</font></b></center></td>
              </tr>
              <?php
              $stmt = $db->prepare("CALL list_bgroup()");
              $stmt->execute();
              $row = $stmt->fetch(PDO::FETCH_ASSOC);
              echo '<table>';
                while ($row !== false) {
                echo $row['@result'];
                $row = $stmt->fetch(PDO::FETCH_ASSOC);
                }
              echo '</table>';
              ?>
            </table>
          </div>
          </center>
          <div id="footer"><h4 align="center">Thapar University Project 22-23</h4>
            <p align="center" > <a href="logout.php"><font color="white">Logout</font></a></p>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>