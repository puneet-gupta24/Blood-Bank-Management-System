<?php
include("connection.php");
session_start();
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Login</title>
        <link rel="stylesheet" type="text/css" href="css/index.css">
    </head>
    <body>
        <div id="full">
            <div id="inner_full
                <div id="header
                    <div id="full">
                        <div id="inner_full">
                            <div id="header"><h2 align="center"><a href="index.php" style="text-decoration: none ;color: white;">Blood Bank Management System</a></h2></div>
                            <div id="body">
                                <br><br><br><br><br>
                                <form action="" method="post">
                                    <table align="center">
                                        <tr>
                                            <td width="200px" height="70px"><b>Enter Username</b></td>
                                            <td width="100px" height="70px"><input type="text" name="un" placeholder="Enter Username" style="
                                            width: 180px; height: 30px; border-radius: 10px;"></td>
                                        </tr>
                                        <tr>
                                            <td width="200px" height="70px"><b>Enter Password</b></td>
                                            <td width="200px" height="70px"><input type="text" name="ps" placeholder="Enter Password" style="
                                            width: 180px; height: 30px; border-radius: 10px;"></td>
                                        </tr>
                                        <tr>
                                            <td><input type="submit" name="sub" value="Login" style="width: 70px;
                                            height: 30px; border-radius: 5px;"></td>
                                        </tr>
                                        
                                    </table>
                                    <p align="center" > <a href="admin-signup.php"><font color="black">SignUp</font></a></p>
                                </form>
                               <?php
    if(isset($_POST['sub'])) {
        $un=$_POST['un'];
        $ps=$_POST['ps'];
        $q=$db->prepare("SELECT * FROM admin WHERE uname='$un' && pass='$ps'");
        $q->execute();
        $res=$q->fetchAll(PDO::FETCH_OBJ);
        if($res) {
            $_SESSION['un']=$un;
            header("Location:admin-home.php");
        } else {
            echo "<script>
                    if(confirm('Login failed. Do you want to signup?')) {
                        window.location.href = 'admin-signup.php';
                    } else {
                        alert('Login failed.');
                    }
                </script>";
        }
    }
?>

                            </div>
                            <div id="footer"><h4 align="center">Thapar University Project 22-23</h4>
                                <p align="center" > <a href="index_user.php"><font color="white">Home</font></a></p>
                            </div>
                        </div>
                    </div>
                </body>
            </html>