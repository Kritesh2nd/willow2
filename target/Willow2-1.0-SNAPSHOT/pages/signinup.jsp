<!DOCTYPE html>
<html>
  <head>
    <title>Sign | In | Up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/stylex.css">
    <style>
      .signBody{height:100vh;background:var(--col6);background:#f3f2ee;}
      .signContainer{height:500px;width:860px;background:#f3f2ee;box-shadow:-4px 4px 10px #777;}
      .signSideTrunk{width: 50%;}
      .signLogoCrate{padding:50px;}


      /* .signSideTrunk[data-side="right"] */
      .signSideTrunk[data-side="right"]{background:#018790;padding:50px;}
      .signTitleTrunk{font-family:var(--ff1);font-size:30px;color:#fff;margin-bottom: 30px;text-decoration: none;}
      .signTwoTileCrate{font-family:var(--ff1);font-size:18px;color:#aaa;}
      .signTitleCrate{font-family:inherit;color:#aaa;cursor: pointer;}
      .signTitleCrateActive{color:#fff;font-size:20px;}

      /* form */
      .signFormText{font-family:var(--ff1);font-size:15px;color:#fff;text-transform: uppercase;padding:25px 0 5px 0;}
      .signFormInput{font-family:var(--ff1);font-size:15px;color:#fff;background:#018790;border:none;
        border-bottom:1px solid #fff;width:260px;padding:3px 0;}
      .signFormInput:focus{outline:none;}
      .signFormInput::placeholder {color:#ccc;opacity:1;font-size:13px;}

      .signFormSubmitBtn{background:#f3f2ee;color:#018790;border:none;padding:7px 25px;font-size:18px;
        cursor: pointer;cursor: pointer;border-radius:1px;margin:3px 0 0 0;transition:.2s;}
      .signFormSubmitBtn:hover{margin:0 0 3px 0;}
    </style>
  </head>
  <body>
    <div class="signBody flexmid bor">
      <div class="signContainer flex bor">
        <div class="signSideTrunk flexmid bor" data-side="left">
          <div class="signLogoCrate">
            <img src="image/logo1.png" alt="" class="signLogoSloth w100 bor">
          </div>
        </div>
        <div class="signSideTrunk flex fdc bor" data-side="right">
          <a href="user?page=index" class="signTitleTrunk">WILLOW</a>
          <div class="signTwoTileCrate flex pb10 bor">
            <div class="signTitleCrate mr10 flex fdc jcfe bor" data-side="left" onclick="clickSign('in')">Sign In</div>
            |
            <div class="signTitleCrate signTitleCrateActive ml10 bor" data-side="right" onclick="clickSign('up')">Sign Up</div>
          </div>

          <form action="user?page=newUser" class="signFormTrunk flex fdc bor none" method="post">
            <div class="signFormText">Name</div>
            <input type="text" class="signFormInput" placeholder="Enter Your Name" value="Kritesh Thapa" name="name">
            <div class="signFormText">Email</div>
            <input type="text" class="signFormInput" placeholder="Enter Your Email" value="kritesh@gmail.com" name="email">
            <div class="signFormText">Password</div>
            <input type="text" class="signFormInput" placeholder="Enter Your Password" value="pass1234" name="password">
            <div class="signFormBtnCrate pt25 bor">
              <input type="submit" class="signFormSubmitBtn ff1"  value="Sign Up">
            </div>
          </form>

          <form action="user?page=signedin" class="signFormTrunk flex fdc bor" method="post">
            <div class="signFormText">Email</div>
            <input type="text" class="signFormInput" placeholder="Enter Your Email" value="swastika@gmail.com" name="email">
            <div class="signFormText">Password</div>
            <input type="text" class="signFormInput" placeholder="Enter Your Password" value="pass1234" name="password">
            <div class="signFormBtnCrate pt25 bor">
              <input type="submit" class="signFormSubmitBtn ff1" value="Sign In">
            </div>
          </form>


        </div>
      </div>
    </div>
    <script src="../js1/script1.js"></script>
    <script>
      //var mainbody = document.querySelector(".mainbody");
      // var signTitleCrate = document.querySelectorAll(".signTitleCrate");
      var signFormTrunk = document.querySelectorAll(".signFormTrunk");
      var signTitleCrate = document.querySelectorAll(".signTitleCrate");
      function clickSign(value){
        if(value=="in"){
          console.log("iinnnn");
          signFormTrunk[0].style.display="none";
          signFormTrunk[1].style.display="flex";
          signTitleCrate[0].classList.add("signTitleCrateActive");
          signTitleCrate[1].classList.remove("signTitleCrateActive");
        }
        else  if(value=="up"){
          signFormTrunk[0].style.display="flex";
          signFormTrunk[1].style.display="none";
          signTitleCrate[0].classList.remove("signTitleCrateActive");
          signTitleCrate[1].classList.add("signTitleCrateActive");
        }
        console.log("value",value);
      }
    </script>
  </body>
</html>
