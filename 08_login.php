<?php
include('./utils/conn.php');
session_start();
// 檢查是否登入，若有登入重新導向，並依會員等級分流
if (isset($_SESSION["loginMember"]) && ($_SESSION["loginMember"] != "")) {
  // 如會員等級為memeber，導向會員頁面
  if ($_SESSION["memberLevel"] == "member") {
    header("Location:03_member.php");
  } else {
    // 如會員等級不為memeber，導向管理頁面
    header("Location:09_admin.php");
  }
}

// 執行會員登入動作
// 如果收到表單傳來帳號及密碼的值
if (isset($_POST["username"]) && isset($_POST["password"])) {
  $query_RecLogin = "SELECT mb_id, mb_level, mb_password FROM member WHERE mb_account=?";
  $stmt = $db_link->prepare($query_RecLogin);
  $stmt->bind_param("s", $_POST["username"]);
  $stmt->execute();

  // 取出帳號密碼的值
  $stmt->bind_result($userid, $level, $password);
  $stmt->fetch();
  $stmt->close();

  // 比對密碼，若成功則呈現登入狀態
  if (password_verify($_POST["password"], $password)) {
    // 設定登入者的名稱及等級
    // 將會員權限變數$level儲存在$_SESSION["memberLevel"]中
    $_SESSION["loginMember"] = $userid;
    $_SESSION["memberLevel"] = $level;
    if ($_SESSION["memberLevel"] == "admin") {
      header("Location:09_admin.php");
    } else {
      header("Location:03_member.php?id=$userid");
    }
  } else {
    // 若登入失敗，則導回原頁，並帶URL參數?errMsg=1，原頁面接收到此參數後顯示相關訊息
    header("Location: index.php?errMsg=1");
  }
}

// 註冊會員功能
// 自製GetSQLValueString()函式，當接收到外部傳入的資料時，先進行輸入過濾、輸出轉義的動作，提高資安保護
function GetSQLValueString($theValue, $theType)
{
  switch ($theType) {
      // filter_var()函式進行過濾
    case "string":
      // FILTER_SANITIZE_ADD_SLASHES過濾單引號、雙引號、反斜線
      $theValue = ($theValue != "") ? filter_var($theValue, FILTER_SANITIZE_ADD_SLASHES) : "";
      break;
    case "email":
      // FILTER_VALIDATE_EMAIL驗證值是否為電子郵件
      $theValue = ($theValue != "") ? filter_var($theValue, FILTER_VALIDATE_EMAIL) : "";
      break;
  }
  return $theValue;
}

// 如果收到$_POST['action']且值為join(action隱藏欄位)
if (isset($_POST["action"]) && ($_POST["action"] == "join")) {
  // 找尋帳號是否已註冊
  require_once("./utils/conn.php");
  $query_RecFindUser = "SELECT mb_account FROM member WHERE mb_account='{$_POST["mb_account"]}'";
  // 使用$db_link->query方法將結果除存在變數$RecFindUser中
  $RecFindUser = $db_link->query($query_RecFindUser);
  // num_rows>0取得資料筆數，大於0表示該帳號有人使用，將頁面導回login頁面，並帶有參數「errMsg=1」及username
  if ($RecFindUser->num_rows > 0) {
    header("Location: 08_login.php?errMsg=1");
  } else {
    //如果該帳號無人使用，則使用預備語法寫入資料表
    $query_insert = "INSERT INTO member (mb_account, mb_password) VALUES (?,?)";
    $stmt = $db_link->prepare($query_insert);
    $stmt->bind_param(
      "ss",
      GetSQLValueString($_POST["mb_account"], 'string'),
      password_hash($_POST["mb_password"], PASSWORD_BCRYPT)
    );
    $stmt->execute();
    $stmt->close();
    $db_link->close();
    // 新增完資料後回本頁，並帶參數「registerstate=1」，畫面將接收這個值來顯示對話方塊
    header("Location: 08_login.php?registerstate=1");
  }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="./utils/reset.css" />
  <link rel="stylesheet" href="./style/06_login.css" />
  <title>Login Page</title>
  <script>
    // 新增資料的表單
    // function checkForm()檢查表單內容
    function checkForm() {
      upassword = document.registerForm.mb_password.value;
      repassword = document.registerForm.re_password.value;
      if (upassword.length < 8 || upassword.length > 12) {
        alert("密碼長度請介於8至12之間！");
        document.registerForm.mb_password.focus();
        return false;
      } else {
        if (upassword != repassword) {
          alert("密碼不符，請重新輸入");
          document.registerForm.re_password.focus();
          return false;
        }
      }
    }
    // function checkAccount()檢查填寫帳號是否正確
    function checkAccount(account) {
      var filter = /^([a-zA-Z0-9_\.-])+\@(([a-zA-Z0-9\-])+\.)+(([a-zA-Z0-9\-]){2,4})+$/
      if (filter.test(account.value)) {
        return true;
      }
      alert("電子郵件格式不正確")
      return false
    }
  </script>
</head>

<body>
  <?php
  require('./00_header.php')
  ?>
  <?php if (isset($_GET["errMsg"]) && ($_GET["errMsg"] == "1")) { ?>
    <script language="javascript">
      alert('您已是會員\n請重新登入。');
      window.location.href = '08_login.php';
    </script>
  <?php } ?>
  <?php if (isset($_GET["registerstate"]) && ($_GET["registerstate"] == "1")) { ?>
    <script language="javascript">
      alert('會員新增成功\n請用申請的帳號密碼登入。');
      window.location.href = 'index.php';
    </script>
  <?php } ?>
  <div>
    <div class="login-container">
      <div class="login-or-new">
        <div class="sign-in pointer">Sign In</div>
        <div class="switch-container" id="newCustomerLink">
          <div class="new-customer pointer">New customer</div>
        </div>
      </div>
      <div class="login-register">
        <!-- 渲染登入或註冊頁面 -->
      </div>
    </div>

    <?php
    require('./00_footer.php')
    ?>
    <script>
      // 使用 querySelector 選取了相應的元素
      const newCustomer = document.querySelector(".new-customer");
      const signIn = document.querySelector(".sign-in");
      const LoginRegister = document.querySelector(".login-register");

      // 在F12看控制台有沒有選到節點
      console.log(newCustomer);
      console.log(signIn);
      console.log(LoginRegister);

      // 用變數方式設定要出現的內容
      let signInHTML = `
<div class="login-container">
<div class="login-register">
        <form method="post" id="loginForm" action="">

          <div class="input-container">
            <!-- <label for="username"></label> -->
            <div class="input-line">
              <input
                type="text"
                id="username"
                name="username"
                required
                placeholder="會員帳號"
              />
            </div>
          </div>

          <div class="input-container">
            <!-- <label for="password"></label> -->
            <div class="input-line">
              <input
                type="password"
                id="password"
                name="password"
                required
                placeholder="密碼"
              />
            </div>
          </div>
          <button type="submit">會員登入</button>

          <div class="other-methods">
            <div class="social-icon">
              <img src="./icon/black/logo_ci_fb.png" class="pointer" alt="點選以使用fb帳號登入" />
              <img src="./icon/black/logo_sq_line.png" class="pointer" alt="點選以使用line帳號登入"/>
            </div>
            <div>
              <p class="pointer">忘記密碼</p>
            </div>
          </div>
        </form>
      </div>
      </div>
`;
      LoginRegister.innerHTML = signInHTML;
      let newCustomerHTML = `
  <div class="login-container">
<div class="login-register">
  <form id="registerForm" name="registerForm" method="post" action="" onSubmit="return checkForm();">
  <div class="input-container">
    <!-- <label for="username"></label> -->
    <div class="input-line">
      <input
        type="text"
        id="mb_account"
        name="mb_account"
        required
        placeholder="會員帳號"
      />
    </div>
  </div>

  <div class="input-container">
    <!-- <label for="password"></label> -->
    <div class="input-line">
      <input
        type="password"
        id="mb_password"
        name="mb_password"
        required
        placeholder="密碼"
      />
    </div>
  </div>
  <div class="input-container">
    <!-- <label for="username"></label> -->
    <!-- type="password" 表示輸入框中的文本將被隱藏 -->
    <div class="input-line">
      <input
        type="password"
        id="re_password"
        name="re_password"
        required
        placeholder="再次輸入密碼"
      />
    </div>
    
  </div>
  <div>
    <input type="checkbox" id="agreeTerms" name="agreeTerms" required />
    <label for="agreeTerms">我已閱讀並同意會員約定條款說明</label>
  </div>
  <input type="hidden" name="action" id="action" value="join">
  <button type="submit" class="btn-register">註冊</button>

  <div class="other-methods">
    <div class="social-icon">
      <img src="./icon/black/logo_ci_fb.png" class="pointer" alt="點選以使用fb帳號登入" />
      <img
        src="./icon/black/logo_sq_line.png" class="pointer"
        alt="點選以使用line帳號登入"
      />
    </div>
  </div>
</form>

</div>
</div>
</div>
`;

      // 使用 innerHTML 將 HTML 內容設定到該元素中
      // 將 HTML 內容設定到某個元素中
      // (+=：將兩個不同的 HTML 內容追加到同一個元素中。loginHTML 和 signInHTML 的內容都將被追加到 LoginRegister 中。)

      // 添加點擊事件監聽器
      signIn.addEventListener("click", function() {
        // 在這裡添加頁面切換的邏輯，例如導航到 "New customer" 頁面的代碼
        LoginRegister.innerHTML = signInHTML;
      });

      newCustomer.addEventListener("click", function() {
        // 在這裡添加頁面切換的邏輯，例如導航到 "New customer" 頁面的代碼
        LoginRegister.innerHTML = newCustomerHTML;
      });

      // function login() {
      //   var username = document.getElementById("username").value;
      //   var password = document.getElementById("password").value;
      //   var loginMessage = document.getElementById("loginMessage");
      //   console.log(username);

      //   // 處理登入邏輯
      //   if (username === "user" && password === "password") {
      //     loginMessage.textContent = "Login successful!";
      //     loginMessage.style.color = "#28a745";
      //   } else {
      //     loginMessage.textContent =
      //       "Incorrect username or password. Please try again.";
      //     loginMessage.style.color = "#dc3545";
      //   }
      // }

      // document.addEventListener("DOMContentLoaded", function () {
      //   // 獲取 "New customer" 文字的元素
      //   var newCustomerLink = document.getElementById("newCustomerLink");

      //   // 添加點擊事件監聽器
      //   newCustomerLink.addEventListener("click", function () {
      //     // 在這裡添加頁面切換的邏輯，例如導航到 "New customer" 頁面的代碼
      //     alert("切換到 New customer 頁面");
      //   });

      //   var signInLink = document.getElementById("signInLink");

      //   signInLink.addEventListener("click", function () {
      //     window.location.href = "login.html";
      //   });
      // });

      // // JavaScript 函數，名為 register，用於處理用戶註冊的邏輯。
      // function register() {
      //   // 獲取用戶輸入的用戶名和密碼、checkbox狀態
      //   var username = document.getElementById("username").value;
      //   var password = document.getElementById("password").value;
      //   var rePassword = document.getElementById("rePassword").value;
      //   var agreeTerms = document.getElementById("agreeTerms").checked;

      //   // 獲取用於顯示註冊結果消息的 HTML 元素
      //   var registerMessage = document.getElementById("registerMessage");

      //  // 檢查是否同意條款
      //  if (!agreeTerms) {
      //   registerMessage.textContent = "我已閱讀並同意會員約定條款說明";
      //   registerMessage.style.color = "#dc3545";
      //   return; // 中止註冊流程
      // }

      //   // 如果用戶名和密碼都存在(非空)，則顯示註冊成功的消息，並將消息顏色設置為綠色
      //   if (username && password && rePassword && password === rePassword) {
      //     registerMessage.textContent = "Registration successful!";
      //     registerMessage.style.color = "#28a745";
      //   } else {
      //     // 如果用戶名或密碼為空，或者密碼不匹配，則顯示提醒用戶填寫用戶名和密碼的消息，並將消息顏色設置為紅色
      //     registerMessage.textContent =
      //       "Please fill in both username and password.";
      //     registerMessage.style.color = "#dc3545";
      //   }
      // }
    </script>
</body>

</html>