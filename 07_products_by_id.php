<?php
include('./utils/conn.php');

$query_RecCategory = "SELECT `category`.`category_id`, `category`.`category_main`, `category`.`category_sub`, COUNT(`product`.`pd_id`) AS `productNum`FROM `category` 
LEFT JOIN `product` ON `category`.`category_id` = `product`.`category_id`
GROUP BY `category`.`category_id`, `category`.`category_main`, `category`.`category_sub`
ORDER BY `category`.`category_id` ASC";
$Rec_Category = $db_link->query($query_RecCategory);
$currentMainCategory = "";

// 從 URL 中擷取 category_id，如果不存在，則使用默認值（在這裡沒有預設）
$category_id = isset($_GET['category_id']) ? $_GET['category_id'] : null;

// 如果 category_id 存在，則更新商品查詢以依據 URL 中的 category_id 進行篩選
$query_RecProduct_1 = $category_id
  ? "SELECT * FROM `images` 
        INNER JOIN `product` ON `images`.`images_id` = `product`.`images_id`
        INNER JOIN `color` ON `product`.`color_id` = `color`.`color_id`
        WHERE `product`.`category_id` = $category_id
        ORDER BY `product`.`pd_id` ASC"
  : "SELECT * FROM `images` 
        INNER JOIN `product` ON `images`.`images_id` = `product`.`images_id`
        INNER JOIN `color` ON `product`.`color_id` = `color`.`color_id`
        ORDER BY `product`.`pd_id` ASC";


$Rec_Product_1 = $db_link->query($query_RecProduct_1);
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>商品分類</title>
  <link rel="stylesheet" href="./utils/bootstrap.min.css" />
  <link rel="stylesheet" href="./style/02_products.css" />
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
      <div class="product-list">
        <div class="center">
          <ul>
            <?php while ($row_RecCategory = $Rec_Category->fetch_assoc()) { ?>
              <div class="main_class">
                <!-- 檢查是否是新的主類別，如果是，則顯示主類別名稱 -->
                <?php
                if ($currentMainCategory != $row_RecCategory['category_main']) {
                  echo "<br>";
                  echo "<li>" . $row_RecCategory['category_main'] . "</li>";
                  $currentMainCategory = $row_RecCategory['category_main'];
                }
                ?>
              </div>
              <li class="category-sub">　　　<a href="07_products_by_id.php?category_id=<?php echo $row_RecCategory['category_id']; ?>">
                  <?php echo $row_RecCategory['category_sub']; ?>
                </a>
              </li>
            <?php } ?>
          </ul>

        </div>
      </div>
      <div class="what01 data-area">
        <div class="what02 d-flex flex-wrap">
          <!-- SSR -->
          <?php while ($row_RecProduct = $Rec_Product_1->fetch_assoc()) { ?>
            <div class="product">
              <a href="./05_product_detail.php?id=<?php echo $row_RecProduct['pd_id']; ?>">
                <img src="<?php echo $row_RecProduct['image_path_main']; ?>" alt="" />
              </a>
              <div class="d-flex justify-content-between mt-2 mb-4">
                <div class="product-text">
                  <a href="" class="item-name">
                    <?php echo $row_RecProduct['pd_name']; ?>
                  </a>
                  <p class="price">
                    <span><?php echo $row_RecProduct['color_name']; ?></span>
                    &emsp;$ <?php echo $row_RecProduct['pd_price']; ?> 元
                  </p>
                </div>
                <div class="favorite">
                  <img src="./icon_collect.png" alt="" />
                </div>
              </div>
            </div>
          <?php } ?>

        </div>
      </div>
    </div>
    <!-- Paginator -->
    <ul class="pagination justify-content-center">
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </div>
  <?php
  require('./00_footer.php')
  ?>
  <!-- <script src="./js/02_products.js"></script> -->
</body>

</html>