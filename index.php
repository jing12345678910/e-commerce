<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SHINJIN</title>
  <link rel="stylesheet" href="./utils/reset.css">
  <link rel="stylesheet" href="./style/01_homepage.css">
</head>

<body>
  <?php
  require('./00_header.php')
  ?>
  <?php if (isset($_GET["errMsg"]) && ($_GET["errMsg"] == "1")) { 
    $alert = "登入帳號或密碼錯誤！";
    echo "<script type='text/javascript'>alert('$alert');</script>";
  } ?>

  <div class="home-banner">
    <video src="./images/01_homepage/homepage-banner.mp4" autoplay="true" type="video/mp4" muted="true"></video>
  </div>
  <div class="home-category">
    <div class="home-category-left">
      <a href="./02_products.php">
        <img src="./images/01_homepage/all.png" alt="">
      </a>
      <a href="">
        <img src="./images/01_homepage/tops.png" alt="">
      </a>
      <a href="">
        <img src="./images/01_homepage/accessories.png" alt="">
      </a>
    </div>
    <div class="home-category-right">
      <a href="./06_wishlist.php">
        <img src="./images/01_homepage/collection.png" alt="">
      </a>
      <a href="">
        <img src="./images/01_homepage/bottoms.png" alt="">
      </a>
      <a href="">
        <img src="./images/01_homepage/fittings.png" alt="">
      </a>
    </div>
  </div>
  <?php
  require('./00_footer.php')
  ?>
</body>

</html>