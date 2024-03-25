<?php
include('./utils/conn.php');

$query_RecCategory = "SELECT `category`.`category_id`, `category`.`category_main`, `category`.`category_sub`, COUNT(`product`.`pd_id`) AS `productNum`FROM `category` 
LEFT JOIN `product` ON `category`.`category_id` = `product`.`category_id`
GROUP BY `category`.`category_id`, `category`.`category_main`, `category`.`category_sub`
ORDER BY `category`.`category_id` ASC";
$Rec_Category = $db_link->query($query_RecCategory);
$currentMainCategory = "";

// 設定pd_id變數，從URL參數綁定pd_id
$pd_id = isset($_GET['id']) ? $_GET['id'] : 0;

$query_RecProduct = "SELECT * FROM `images` INNER JOIN `product` ON `images`.`images_id` = `product`.`images_id`
INNER JOIN `color`ON `product`.`color_id` = `color`.`color_id`
WHERE `product`.`pd_id` = $pd_id";

$Rec_Product = $db_link->query($query_RecProduct);

//綁定資料集
$row_RecProduct = $Rec_Product->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>SHINJIN</title>
  <link rel="stylesheet" href="./utils/bootstrap.min.css" />
  <link rel="stylesheet" href="./style/05_products_detail.css" />
</head>

<body>
  <?php
  require('./00_header.php');
  ?>
  <div class="products-main">
    <div class="products-search d-flex justify-content-end">
      <!-- 清單列表模式 -->
      <div class="list-mode d-flex">
        <img class="mode-icon" src="./images/00_icon/col_1_gray.svg" alt="">
        <img class="mode-icon" src="./images/00_icon/col_2_gray.svg" alt="">
      </div>
      <!-- 排序、進階功能 -->
      <div class="search-function d-flex">
        <div>排序</div>
        <div>進階選項</div>
      </div>
    </div>
    <!-- 商品列表 -->
    <div class="products-content d-flex flex-wrap">
      <!-- 左邊欄 -->
      <div class="product-list">
        <div class="center">
          <ul>
            <?php while ($row_RecCategory = $Rec_Category->fetch_assoc()) { ?>
              <div class="main_class">
                <!-- 檢查是否是新的主類別，如果是，則顯示主類別名稱 -->
                <?php
                if ($currentMainCategory != $row_RecCategory['category_main']) {
                  echo "<br>";
                  echo "<li><a href='product.php'>" . $row_RecCategory['category_main'] . "</a></li>";
                  $currentMainCategory = $row_RecCategory['category_main'];
                }
                ?>
              </div>
              <li>　　　<a href="products_by_id.php?category_id=<?php echo $row_RecCategory['category_id']; ?>">
                  <?php echo $row_RecCategory['category_sub']; ?>
                </a>
              </li>
            <?php } ?>
          </ul>

        </div>
      </div>
      <div class="product-detail">
        <div class="what02">
          <!-- SSR -->
          <?php if ($row_RecProduct) { ?>
            <div class="product">
              <div class="product-desc">
                <img src="<?php echo $row_RecProduct['image_path_main']; ?>" alt="" />
                <div class="all-desc">
                  <div class="d-flex justify-content-between mt-2 mb-2 product-text">
                    <p><?php echo $row_RecProduct['pd_name']; ?></p>
                    <div class="favorite">
                      <img src="./icon_collect.png" alt="" />
                    </div>
                  </div>
                  <div>
                    <p class="color mt-2 mb-2"><?php echo $row_RecProduct['color_name']; ?></p>
                    <p class="price mt-2 mb-2">$ <?php echo $row_RecProduct['pd_price']; ?> 元</p>
                    <select class="mb-2" name="size" id="size">
                      <option value="">尺寸</option>
                      <option value="S">S</option>
                      <option value="M">M</option>
                      <option value="L">L</option>
                    </select>
                    <select name="number" id="number">
                      <option value="">數量</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                    </select>
                    <button class="btn-add-carts" onclick="addToCart()">加入購物車</button>
                    <div class="desc pd-desc mt-4">商品描述
                      <p class="mt-2 p-desc"><?php echo $row_RecProduct['pd_description']; ?></p>
                      <p class="p-desc">材質：<?php echo $row_RecProduct['pd_material']; ?></p>
                      <p class="p-desc">厚薄：<?php echo $row_RecProduct['pd_thickness']; ?></p>
                      <p class="p-desc">彈性：<?php echo $row_RecProduct['pd_elasticity']; ?></p>
                    </div>
                    <div class="desc size-desc mt-2">尺寸指南</div>
                    <div class="desc maintain-desc mt-2">保養方式</div>
                  </div>
                </div>
              </div>
              <img src="<?php echo $row_RecProduct['image_path_other1']; ?>" alt="">
              <img src="<?php echo $row_RecProduct['image_path_other2']; ?>" alt="">
            </div>
          <?php } ?>
        </div>
      </div>
    </div>
  </div>
  <?php
  require('./00_footer.php')
  ?>

  <script>
    function addToCart() {

      // 獲取當前 URL
      let currentUrl = window.location.href;

      // 檢查 URL 中是否已包含參數? 如果已包含，就使用'?'作為分隔符，否則使用''。
      let separator = currentUrl.includes('?') ? '?' : '';

      // 將 PHP 變數轉換為 JSON 字符串
      let pdIdJson = <?php echo json_encode($pd_id); ?>;

      // 構建新的 URL，加入 id 參數
      let newUrl = '04_carts.php' + separator + 'id=' + pdIdJson;

      // 導航到新的 URL
      window.location.href = newUrl;
    }
  </script>
</body>

</html>