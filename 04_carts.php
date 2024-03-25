<?php
include('./utils/conn.php');

//購物車初始化，0代表無限。
// $cart=new Cart([
//   'cartMaxItem'=>0,
//   'itemMaxQuantity'=>0,
//   'useCookie'=>false,
// ]);

// 設定pd_id變數，從URL參數綁定pd_id
// 如果 $_GET['id'] 已經被設定，將 $pd_id 設為 $_GET['id'] 的值。
// 如果 $_GET['id'] 沒有被設定（或為 null），則將 $pd_id 設為 0。
$pd_id = isset($_GET['id']) ? $_GET['id'] : 0;

$color_name = "未知顏色";
$pd_name = "未知商品名稱";
$pd_size = "未知尺寸";
$pd_price = "未知價格";
$image_path = "未知圖片路徑";


// 撈取資料庫商品名稱start
if(isset($pd_id) && $pd_id != 0){
  $pdNameQuery = "SELECT pd_name FROM product WHERE pd_id = '$pd_id'";

    // 確認 $db_link 是否被正確初始化
    if($db_link->connect_error){

      // 如果 $db_link 未正確初始化，處理錯誤
      echo "資料庫連接錯誤: " . $db_link->connect_error;

    } else {
      $pdNameResult = $db_link->query($pdNameQuery);
      if($pdNameResult){

        //如果查詢成功
        $pdNameRow = $pdNameResult->fetch_assoc();
        $pd_name=$pdNameRow['pd_name'];
    
      } else {
        //如果商品查詢失敗，處理錯誤
        echo "商品查詢失敗".$db_link->error;
      }
    }
}
// 撈取資料庫商品名稱end



// 撈取資料庫商品顏色start
if(isset($pd_id) && $pd_id != 0){
  $colorIdQuery = "SELECT color_id FROM product WHERE pd_id = '$pd_id'";

    // 確認 $db_link 是否被正確初始化
    if($db_link->connect_error){

      // 如果 $db_link 未正確初始化，處理錯誤
      echo "資料庫連接錯誤: " . $db_link->connect_error;

    } else {
      $colorIdResult = $db_link->query($colorIdQuery);
      if($colorIdResult){

        //如果查詢成功
        $colorIdRow = $colorIdResult->fetch_assoc();
        $color_id=$colorIdRow['color_id'];
    
        //再到color資料表中查詢對應color_id的color_name
        $color_query="SELECT color_name FROM color WHERE color_id = '$color_id'";
        $color_result=$db_link->query($color_query);
    
        if($color_result){
          //如果查詢成功
          $color_row=$color_result->fetch_assoc();
          $color_name=$color_row['color_name'];
    
          //現在$color_name包含了對應pd_id的顏色名稱
          // echo "$color_name";

        } else {
          //如果顏色查詢失敗，處理錯誤
          echo "顏色查詢失敗".$db_link->error;
        }
      } else {
        //如果商品查詢失敗，處理錯誤
        echo "商品查詢失敗".$db_link->error;
      }
    }
}
// 撈取資料庫商品顏色end



// 撈取資料庫商品尺寸start
if(isset($pd_id) && $pd_id != 0){
  $pdSizeQuery = "SELECT pd_size FROM product WHERE pd_id = '$pd_id'";

    // 確認 $db_link 是否被正確初始化
    if($db_link->connect_error){

      // 如果 $db_link 未正確初始化，處理錯誤
      echo "資料庫連接錯誤: " . $db_link->connect_error;

    } else {
      $pdSizeResult = $db_link->query($pdSizeQuery);
      if($pdSizeResult){

        //如果查詢成功
        $pdSizeRow = $pdSizeResult->fetch_assoc();
        $pd_size=$pdSizeRow['pd_size'];
    
      } else {
        //如果商品查詢失敗，處理錯誤
        echo "商品查詢失敗".$db_link->error;
      }
    }
}
// 撈取資料庫商品尺寸end



// 撈取資料庫商品價格start
if(isset($pd_id) && $pd_id != 0){
  $pdPriceQuery = "SELECT pd_price FROM product WHERE pd_id = '$pd_id'";

    // 確認 $db_link 是否被正確初始化
    if($db_link->connect_error){

      // 如果 $db_link 未正確初始化，處理錯誤
      echo "資料庫連接錯誤: " . $db_link->connect_error;

    } else {
      $pdPriceResult = $db_link->query($pdPriceQuery);
      if($pdPriceResult){

        //如果查詢成功
        $pdPriceRow = $pdPriceResult->fetch_assoc();
        $pd_price=$pdPriceRow['pd_price'];
    
      } else {
        //如果商品查詢失敗，處理錯誤
        echo "商品查詢失敗".$db_link->error;
      }
    }
}
// 撈取資料庫商品價格end



// 撈取資料庫商品照片路徑start
if(isset($pd_id) && $pd_id != 0){
  $imagePathQuery = "SELECT image_path_main FROM images WHERE images_id = '$pd_id'";

    // 確認 $db_link 是否被正確初始化
    if($db_link->connect_error){

      // 如果 $db_link 未正確初始化，處理錯誤
      echo "資料庫連接錯誤: " . $db_link->connect_error;

    } else {
      $imagePathResult = $db_link->query($imagePathQuery);
      if($imagePathResult){

        //如果查詢成功
        $imagePathRow = $imagePathResult->fetch_assoc();
        $image_path=$imagePathRow['image_path_main'];
    
      } else {
        //如果商品查詢失敗，處理錯誤
        echo "商品查詢失敗".$db_link->error;
      }
    }
}
// 撈取資料庫商品照片路徑end



?>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>SHINJIN</title>
  <link rel="stylesheet" href="./utils/reset.css">
  <link rel="stylesheet" href="./utils/bootstrap.min.css" />
  <link rel="stylesheet" href="./style/04_carts.css" />
</head>

<body>
  <?php
  require('./00_header.php')
  ?>
  <div class="cart-main">
    <!-- 頁籤 -->
    <div class="tabs d-flex">
      <div class="cart-option">購物車(<span>2</span>)</div>
      <div class="wishlist-option">Wishlist</div>
    </div>
    <div></div>
    <!-- 購物車內容 -->
    <div class="cart-content">

    <?php
      // 添加条件判断，如果 $pd_id 为 0 或者为空，显示提示信息
      if ($pd_id == 0 || empty($pd_id)) {
        echo "<br>"; 
        echo "<br>"; 
        echo "<br>"; 
        echo "<p style='text-align: center;'>購物車目前尚無商品</p>";
        echo "<br>";
        echo "<br>"; 
        echo "<br>"; 
      } else {
      ?>

      <!-- 放進購物車的商品 -->
      <div class="cart-product">
        <div class="product-info d-flex">
          <img class="product-img" src="<?php echo $image_path; ?>" alt="" />
          <div class="product-details">
            <p class="product-name">名稱：<?php echo $pd_name; ?></p>
            <p class="product-number">編號：#<?php echo $pd_id; ?></p>
            <br />
            <span>顏色：</span><span class="product-color"><?php echo $color_name; ?></span><br />
            <span>尺寸：</span><span class="product-size"><?php echo $pd_size; ?></span><br />
            <span>單價：NT.</span><span class="product-price"><?php echo $pd_price; ?></span><br />
            <span>數量：</span>
            <select name="number" id="number">

            <!-- \" 表示一个雙引號字符 -->
              <?php
              for($i=1;$i<=10;$i++){
                echo "<option value=\"$i\">$i</option>";
              }
              ?>
            </select>
            <br />
            <br />
            <span>折扣價：NT.</span><span class="discount-price"><?php echo $pd_price; ?></span><br />
            <span>小計：　NT.</span><span class="final-price"><?php echo $pd_price; ?></span>
          </div>
        </div>
        <a class="next-time-btn" href="">下次買</a>
        <button class="delete-btn">X</button>
      </div>
      <?php
      }
      ?>
    </div>
    <!-- 折價券 -->
    <div class="coupon">
      <span>折價券代碼：</span><input class="carts-input" type="text" />
      <br />
      <button class="coupon-btn"><a href="">Coupon</a></button>
      <p>單筆訂單限折抵一張折價券</p>
    </div>
    <!-- 付款方式、運送方式 -->
    <div class="payment-delivery">
      <!-- 付款方式 -->
      <div class="payment-method">
        <p class="method-title">付款方式</p>
        <form action="" name="form1">
          <div>
            <input type="checkbox" class="carts-input payment-input" id="credit-card" name="payment" onclick="return chk(this)" />
            <label for="credit-card">信用卡線上刷卡</label>
          </div>
          <div>
            <input type="checkbox" class="carts-input payment-input" id="cash-on-store-delivery" name="payment" onclick="return chk(this)" />
            <label for="cash-on-store-delivery">超商貨到付款</label>
          </div>
          <div>
            <input type="checkbox" class="carts-input payment-input" id="ATM" name="payment" onclick="return chk(this)" />
            <label for="ATM">ATM轉帳</label>
          </div>
          <div>
            <input type="checkbox" class="carts-input payment-input" id="line-pay" name="payment" onclick="return chk(this)" />
            <label for="line-pay">LINE Pay(可用LINE POINTS折抵)</label>
          </div>
          <div>
            <input type="checkbox" class="carts-input payment-input" id="cash-on-home-delivery" name="payment" onclick="return chk(this)" />
            <label for="cash-on-home-delivery">貨到付款(宅配)</label>
          </div>
        </form>
      </div>
      <!-- 運送方式 -->
      <div class="delivery-method">
        <p class="method-title">運送方式</p>
        <div>
          <input type="radio" class="carts-input delivery-input" id="7-eleven" name="delivery" />
          <label for="7-eleven">7-11超商取貨(滿$2000免運)</label>
        </div>
        <div>
          <input type="radio" class="carts-input delivery-input" id="family-mart" name="delivery" />
          <label for="family-mart">全家超商取貨(滿$2000免運)</label>
        </div>
        <div>
          <input type="radio" class="carts-input delivery-input" id="home-delivery" name="delivery" />
          <label for="home-delivery">宅配</label>
        </div>
      </div>
      <!-- 選擇門市 -->
      <div class="store-option">
        <span>尚未選擇門市</span><button class="choose-btn"><a href="">選擇門市</a></button>
      </div>
      <div class="reminder">
        <p>※ 提醒您 ：</p>
        <p>
          當包裹送達您指定之7-11門市時，隔日將會發送簡訊到貨通知。門市純取貨之訂單，收件人務必填寫與身分證上相符的姓名，並攜帶證件至門市領取包裹。
        </p>
      </div>
    </div>
    <!-- 結帳資訊 -->
    <div class="sum">
      <!-- 運費提醒 -->
      <div class="shipping-reminder">
        <p>Free Shipping</p>
        <p>商品金額只差NT $ <span>579</span>即可享NT $ 2000免運</p>
      </div>
      <!-- 帳單各項總計 -->
      <div class="payment-details">
        <div class="d-flex justify-content-between">
          <span>小計</span>
          <div><span>NT$ </span><span>1421</span></div>
        </div>
        <div class="d-flex justify-content-between">
          <span>加價購</span>
          <div><span>NT$ </span><span>0</span></div>
        </div>
        <div class="d-flex justify-content-between">
          <span>運費</span>
          <div><span>NT$ </span><span>80</span></div>
        </div>
        <div class="d-flex justify-content-between">
          <span>折價券</span>
          <div><span>- NT$ </span><span>0</span></div>
        </div>
        <div class="d-flex justify-content-between">
          <span>購物金</span>
          <div><span>- NT$ </span><span>0</span></div>
        </div>
        <hr />
        <div class="d-flex justify-content-between">
          <span>總金額</span>
          <div><span>NT$ </span><span>1501</span></div>
        </div>
      </div>
    </div>
    <div class="next">
      <button class="next-btn"><a href="">下一步</a></button>
    </div>
  </div>
  <?php
  require('./00_footer.php')
  ?>
  <script src="./js/04_carts.js"></script>
</body>

</html>