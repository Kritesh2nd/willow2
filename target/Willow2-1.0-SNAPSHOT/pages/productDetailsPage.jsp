<%@page import="Model.SizeCount"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
int userid = (int) session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Product | Detail</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/stylex.css">
    <style>
      body::-webkit-scrollbar {width: 10px;}
      body::-webkit-scrollbar-track{box-shadow: inset 0 0 5px grey;border-radius: 10px;}
      body::-webkit-scrollbar-thumb{background:rgba(170,170,170,.5);border-radius:10px;transition: 0.3s;}
      body::-webkit-scrollbar-thumb:hover {background: rgba(170,170,170,.5);cursor:pointer;}
      .productDetailBody{height: auto;background:var(--col7);}
      .prdDtlNavDesktop{height: 80px;}

      .prdDtlMainContainer{height: 100vh;padding:1em 2.2em 1em 2.2em;}

      .prdDtlSide[data-side="left"]{width:47%;}
      .prdDtlSide[data-side="right"]{width:53%;padding:2.2em 2.2em 2.2em 2.2em;}
      .prdDtlImageCrate{overflow:hidden;}
      
      .prdDtlRevStartIcon{height:16px;width:16px;}
      
      .prdDtlNameSloth{font-family:var(--ff5);font-size:28px;font-weight:600;letter-spacing:.1em}
      .prdDtlBrandSloth{font-family:var(--ff5);font-size:18px;letter-spacing:.1em;text-transform: uppercase;font-weight: 300;}
      .prdDtlPriceSloth{font-family:var(--ff5);font-size:18px;letter-spacing:.1em;text-transform: uppercase;}
      .prdDtlDisPriceSloth{font-family:var(--ff5);font-size:18px;letter-spacing:.1em;text-transform: uppercase;
        text-decoration: line-through;font-weight: 300;}
      .prdDtlSaleSloth{font-family:var(--ff5);font-size:18px;letter-spacing:.1em;font-weight: 300;}
      .prdDtlDescriptionSloth{font-family:var(--ff5);font-size:16px;letter-spacing:.1em;color:#444;font-weight: 300;}
      .prdDtlSizeTitleSloth{font-family:var(--ff5);font-size:18px;letter-spacing:.1em;}
      .prdDtlSizeSelect{width:300px;}
      .prdDtlSizeSelect{font-family:var(--ff5);font-size:18px;letter-spacing:.1em;padding:10px;border:1px solid #000;}
      .prdDtlSizeSelect:focus{outline:none;}
      
      .prdDtlCartBtnSloth{font-family:var(--ff5);font-size:18px;letter-spacing:.1em;padding:10px;
        width:300px;text-align: center;text-decoration: none;background: #000;color:#fff;transition:.3s;}
      .prdDtlCartBtnSloth:hover{background: #333;cursor:pointer;}
      .prdDtlWishlisttBtnCrate a{font-family:var(--ff5);font-size:18px;letter-spacing:.1em;color:#000;}

        /* prdDtlBigLine */
        .prdDtlBigLine{height:1px;width:calc(100% - 4.4em);background:#888;margin:40px 2.2em;}
        
      /* prdDtlReviewTrunk */
      .prdDtlReviewTrunk{padding:0 2.2em;}
      .prdDtlRevTitleTrunk{font-family:var(--ff5);font-size:24px;letter-spacing:.1em;font-weight:600;padding-bottom: 20px;}
      .prdDtlRevCrate{padding-right: 50%;}

      .prdDtlRevAddTrunk{padding-right: 50%;}
      .prdDtlAddRevStartIcon{height:30px;width: 30px;cursor: pointer;}
      .prdDtlRevAddNameSloth{font-family:var(--ff5);font-weight: 600;letter-spacing:.05em}
      .prdDtlAddRevStartName{font-family:var(--ff5);letter-spacing:.05em;font-size:18px;}
      .prdDtlAddRevTextSloth{font-family:var(--ff5);letter-spacing:.05em;width: 100%;height:100px;resize:none;font-size:16px;padding:5px;
        border:1px solid #000;background:var(--col7);}
      .prdDtlAddRevTextSloth:focus{outline:none;}
      .prdDtlAddRevSubmitBtn{font-family:var(--ff5);letter-spacing:.05em;padding:7px 40px;border:none;background:#000;color: #fff;
        font-size:16px;font-weight: 300;transition:.2s;cursor: pointer;}
      .prdDtlAddRevSubmitBtn:hover{background: #222;}


      .prdDtlRevNameSloth{font-family:var(--ff5);font-weight: 600;letter-spacing:.05em}
      .prdDtlRevDateSloth{font-family:var(--ff5);font-weight:300;letter-spacing:.05em;}
      .prdDtlRevReviewSloth{font-family:var(--ff5);color:#333;letter-spacing:.05em;line-height:20px;}
      .prdDtlRevLine{width: 100%;height:1px;background:#888;margin:15px 0 20px 0;}
    </style>
  </head>
  <body>
    <div class="productDetailBody bor">
      <!-- prdDtl --> 
      <div class="prdDtlNavBody bor">
        <div class="prdDtlNavDesktop bor">
<%@include file="../include/navbar.jsp" %>            
          <!--  SPACE FOR NAVBAR  -->
        </div>
        <div class="prdDtlNavPhone bor">
          <!--  SPACE FOR RESPONSIVE NAVBAR  -->
        </div>
      </div>
      <div class="prdDtlMainContainer bor out">
        <div class="prdDtlMainContainerInr flex h100 bor">
          <div class="prdDtlSide bor" data-side="left">
            <div class="prdDtlImageCrate hw100 bor">
              <img src="${productdetail.image}" alt="" class="prdDtlImageSloth w100">
            </div>
          </div>
          <div class="prdDtlSide flex fdc bor" data-side="right">

            <div class="prdDtlMiniReviewCrate bor">
              <div class="prdDtlMiniRevStartCrate flex">
                <!-- FOR EACH SLOTH -->
                <img src="icons/start.png" alt="" class="prdDtlRevStartIcon w100">
                <img src="icons/start.png" alt="" class="prdDtlRevStartIcon w100">
                <img src="icons/start.png" alt="" class="prdDtlRevStartIcon w100">
                <img src="icons/start.png" alt="" class="prdDtlRevStartIcon w100">
                <!-- FOR EACH END SLOTH -->
                <!-- FOR EACH SLOTH -->
                <img src="icons/start-stroke.png" alt="" class="prdDtlRevStartIcon w100">
                <!-- FOR EACH END SLOTH -->

                <div class="prdDtlRevCount ff5">&nbsp;(432)</div>
              </div>
            </div>

            <div class="prdDtlNameSloth">
              ${productdetail.name}
            </div>
            <div class="prdDtlBrandSloth pb40">
              ${productdetail.brand}
            </div>
            <div class="prdDtlPriceSloth">
              NRS ${productdetail.price}
            </div>
            <div class="prdDtlDisPriceSloth">
              NRS ${productdetail.price}
            </div>
            <div class="prdDtlSaleSloth pb20">
              Limited Time Sale
            </div>
            <div class="prdDtlDescriptionSloth pb20">
              ${productdetail.description}
            </div>
            <form action="user?page=addToCart" class="flex fdc bor" method="post">
              <div class="prdDtlSizeTitleSloth">
                SIZE
              </div>
<!--                <select id="" class="prdDtlSizeSelect" name="size">
                    <option value="xxs">xxs</option>
                </select>-->
              <div class="prdDtlSizeTrunk flex bor ptb10">
                <select class="prdDtlSizeSelect" name="size">
                  <c:forEach items="${productsizecount}" var="prsc">
                      <%SizeCount sc =(SizeCount) pageContext.getAttribute("prsc");%>
                      <option value="<%=sc.getSize()%>"><%=sc.getSize()%></option>
                  </c:forEach>
                </select>
              </div>
                <input type="text" value="<%=userid%>" name="userid" hidden>
                <input type="text" value="${productdetail.id}" name="productid" hidden>
              <div class="prdDtlCartBtnCrate flex pt10 pb10">
                  <input type="submit" class="prdDtlCartBtnSloth" value="Add to Cart" name="addtocart">
              </div>
              <div class="prdDtlWishlisttBtnCrate flex bor">
                <a href="#" class="prdDtlWishlisttBtnSloth p1 bor">
                  Add to Wish List
                </a>
              </div>
            </form>
            
          </div>
        </div>
      </div>
      <div class="prdDtlBigLine bor"></div>

      <div class="prdDtlReviewTrunk flex fdc bor">
        <div class="prdDtlRevTitleTrunk bor">
          Reviews
        </div>
        <div class="prdDtlRevTrunk flex fdc bor">
          
          <div class="prdDtlRevAddTrunk flex pb20 bor">
            <div class="prdDtlRevAddCrate flex fdc w100 bor">
              <div class="prdDtlRevAddNameSloth">Kritesh Thapa</div>
              <form action="" class="prdDtlAddRevForm flex fdc bor" method="post">
                <div class="prdDtlAddRevStartTrunk flex ptb10 aic">
                  <div class="prdDtlAddRevStartName pr10">Review</div>
                  <input type="text" class="prdDtlAddRevStartInputHidden" value="0" name="starvalue" hidden>
                  <img src="icons//start-fill0.png" alt="" data-star="white" class="prdDtlAddRevStartIcon" onclick="prdDtlRevAddStartValue(1)">
                  <img src="icons//start-fill0.png" alt="" data-star="white" class="prdDtlAddRevStartIcon" onclick="prdDtlRevAddStartValue(2)">
                  <img src="icons//start-fill0.png" alt="" data-star="white" class="prdDtlAddRevStartIcon" onclick="prdDtlRevAddStartValue(3)">
                  <img src="icons//start-fill0.png" alt="" data-star="white" class="prdDtlAddRevStartIcon" onclick="prdDtlRevAddStartValue(4)">
                  <img src="icons//start-fill0.png" alt="" data-star="white" class="prdDtlAddRevStartIcon" onclick="prdDtlRevAddStartValue(5)">
                </div>
                <div class="prdDtlAddRevTextCrate flex">
                  <textarea name="" class="prdDtlAddRevTextSloth" placeholder="write a review..." name="reviewdata">Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem ducimus esse facilis error, quasi iste excepturi quam fugit doloribus sunt optio temporibus libero velit? Maxime doloremque consequuntur ex totam aliquid.</textarea>
                </div>
                <div class="prdDtlAddRevButtonCrate pt20">
                  <input type="submit" class="prdDtlAddRevSubmitBtn" value="Submit">
                </div>
              </form>
            </div>
          </div>



          <!-- Review For Each Start -->
          <div class="prdDtlRevTrunkInr flex fdc w100 bor">
            <div class="prdDtlRevCrate flex fdc w100 bor">
              <div class="prdDtlRevNameCrate flex bor">
                <div class="prdDtlRevNameSloth pr15 bor">
                  Kritesh Thapa
                </div>
                <div class="prdDtlRevStartSloth flexmid bor">
                  <img src="icons//start-fill100.png" alt="" data-star="balck" class="prdDtlRevStartIcon">
                  <img src="icons//start-fill100.png" alt="" data-star="balck" class="prdDtlRevStartIcon">
                  <img src="icons//start-fill100.png" alt="" data-star="balck" class="prdDtlRevStartIcon">
                  <img src="icons//start-fill100.png" alt="" data-star="balck" class="prdDtlRevStartIcon">
                  <img src="icons//start-fill0.png" alt="" data-star="white" class="prdDtlRevStartIcon">
                </div>
                <div class="prdDtlRevDateSloth pl15 bor">
                  20/20/200
                </div>
              </div>
              <div class="prdDtlRevReviewSloth pt6 bor">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore soluta sunt eveniet corporis similique, repellendus enim debitis vitae culpa quisquam suscipit? Nemo architecto rem dolorum dolore sint deserunt possimus totam!
              </div>
            </div>
            <div class="prdDtlRevLine bor"></div>
          </div>
          <!-- Review For Each End -->
          <div class="prdDtlRevTrunkInr flex fdc w100 bor">
            <div class="prdDtlRevCrate flex fdc w100 bor">
              <div class="prdDtlRevNameCrate flex bor">
                <div class="prdDtlRevNameSloth pr15 bor">
                  Kritesh Thapa
                </div>
                <div class="prdDtlRevStartSloth flexmid bor">
                  <img src="icons//start-fill100.png" alt="" data-star="balck" class="prdDtlRevStartIcon">
                  <img src="icons//start-fill100.png" alt="" data-star="balck" class="prdDtlRevStartIcon">
                  <img src="icons//start-fill100.png" alt="" data-star="balck" class="prdDtlRevStartIcon">
                  <img src="icons//start-fill100.png" alt="" data-star="balck" class="prdDtlRevStartIcon">
                  <img src="icons//start-fill0.png" alt="" data-star="white" class="prdDtlRevStartIcon">
                </div>
                <div class="prdDtlRevDateSloth pl15 bor">
                  20/20/200
                </div>
              </div>
              <div class="prdDtlRevReviewSloth pt6 bor">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore soluta sunt eveniet corporis similique, repellendus enim debitis vitae culpa quisquam suscipit? Nemo architecto rem dolorum dolore sint deserunt possimus totam!
              </div>
            </div>
            <div class="prdDtlRevLine bor"></div>
          </div>


          
        </div>
      </div>





      <div class="prdDtlExtraProdListTrunk bor">
        <div class="prdDtlExtraTrunk" data-list="feature">
<%@include file="../include/footer.jsp" %>            
          <!-- FEATURE PRODUCT -->
        </div>
        <div class="prdDtlExtraTrunk" data-list="feature">
          <!-- POPULAR PRODUCT -->
        </div>
      </div>
      <div class="prdDtlFooterTrunk">
        <!-- FOOTER  -->
      </div>

    </div>
  </body>
  <script>
    var prdDtlAddRevStartInputHidden = document.querySelector(".prdDtlAddRevStartInputHidden");
    var prdDtlAddRevStartIcon = document.querySelectorAll(".prdDtlAddRevStartIcon");
    function prdDtlRevAddStartValue(value){
      var whiteStar = "icons//start-fill0.png";
      var blackStar = "icons//start-fill100.png";
      // whiteStar = "icons//start-fill0.png";
      // blackStar = "icons//start-fill100.png";
      var a;
      prdDtlAddRevStartInputHidden.value = value;
      for(a=0;a<5;a++){prdDtlAddRevStartIcon[a].src = whiteStar;}
      for(a=0;a<value;a++){prdDtlAddRevStartIcon[a].src = blackStar;}
    }
  </script>
</html>
