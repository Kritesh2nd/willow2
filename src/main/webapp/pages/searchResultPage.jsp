<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="Service.Support"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Search Result | List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/stylex.css">
    <style>
      body::-webkit-scrollbar {width: 10px;}
      body::-webkit-scrollbar-track{box-shadow: inset 0 0 5px grey;border-radius: 10px;}
      body::-webkit-scrollbar-thumb{background:rgba(170,170,170,.5);border-radius:10px;transition: 0.3s;}
      body::-webkit-scrollbar-thumb:hover {background: rgba(170,170,170,.5);cursor:pointer;}
      .searchListBody{height:auto;background:var(--col6);}
      .serListNavDesktop{height: 80px;}

      /* container 1 */
      .serListContainer{padding:1em 2.2em 1em 2.2em;}
      .serListContOneImageCrate{height:200px;width:200px;margin-right: 50px;}
      .serListContOneTextTrunk{padding-left: 160px;}
      .serListContOneTitleTrunk{font-family:var(--ff5);font-size:30px;letter-spacing:.1em;}
      .serListContOneText{font-family:var(--ff5);font-size:16px;letter-spacing:.1em;}

      .serListContThreeSide[data-side="left"]{width:18%;}
      .serListContThreeSide[data-side="right"]{width:82%;}
      .serListC3TitleTrunk{font-family:var(--ff5);font-size:20px;letter-spacing:.1em;font-weight:600;}
      .serListC3TitleCrate{font-family:var(--ff5);font-size:16px;letter-spacing:.05em;color:#000;margin-bottom: 15px;}
      .serListC3TitleSloth{font-family:var(--ff5);font-size:16px;letter-spacing:.05em;color:#666;margin-bottom: 15px;
        margin-left:40px;text-decoration: none;}
      
      .serListSearchResultText{font-family:var(--ff5);font-size:16px;letter-spacing:.05em;padding:10px 20px;color:#666;}
      .serListProductContainer{flex-wrap: wrap;padding:0;}
      .serListProductTrunk{width:25%;}

      .serListProdSloth{width:25%;padding:15px;padding-bottom:10px;}
      .serListProdIamgeSloth{height:260px;overflow:hidden;margin-bottom: 10px;}

      .serListProdFF5{font-family:var(--ff5);font-weight:300;padding:2px 0;}
      .serListProdRevStarIcon{height:16px;width:16px;}
      .serListProdNewItemSloth{color:#00f;}
      .serListProdNameSloth{color: #000;text-decoration: none;}
      .serListProdDisPriceSloth{color:var(--col1);}
      .serListProdPriceSloth{text-decoration: line-through;}
      .serListProdReviewCrate{padding:0;color: #000;text-decoration: none;}
    </style>
  </head>
  <body>
    <div class="searchListBody bor">
      <!-- serList --> 
      <div class="serListNavBody bor">
        <div class="serListNavDesktop bor">
          <!--  SPACE FOR NAVBAR  -->
<%@include file="../include/navbar.jsp" %>
        </div>
        <div class="serListNavPhone bor">
          <!--  SPACE FOR RESPONSIVE NAVBAR  -->
        </div>
      </div>
      <!-- CONTAINER ONE -->
      <div class="serListContainer bor" data-cont="1">
        <div class="serListContainerInr flex jcsb bor">
          <div class="serListContOneTextTrunk flex fdc jcc bor">
            <div class="serListContOneTitleTrunk bor">
              Product Catalog
            </div>
            <div class="serListContOneText mt15 bor">
              Shop / All products
            </div>
          </div>
          <div class="serListContOneImageTrunk bor">
            <div class="serListContOneImageCrate bor">
              <img src="image/logo1.png" alt="" class="serListContOneImageSloth w100">
            </div>
          </div>
        </div>
      </div>
      <!-- CONTAINER TWO -->
      <div class="serListContainer flex bor none" data-cont="2">
        <form action="" class="serListSearchForm bor">
          
        </form>
      </div>
      <!-- CONTAINER Three -->
      <div class="serListContainer flex bor" data-cont="3">
        <div class="serListContThreeSide flex fdc bor" data-side="left">
          
          
          <div class="serListC3TitleTrunk mb20 ">Category</div>
          <div class="serListC3TitleSloth">Men</div>
          <div class="serListC3TitleSloth">Women</div>
          <div class="serListC3TitleSloth">Accessories</div>
          <div class="serListC3TitleSloth">Sales</div>

          <div class="serListC3TitleTrunk mtb20 ">Filter By</div>
          <div class="serListC3TitleCrate">Price</div>
            <a href="#" class="serListC3TitleSloth">NRS 1000 - 2000</a>
            <a href="#" class="serListC3TitleSloth">NRS 2000 - 5000</a>
            <a href="#" class="serListC3TitleSloth">NRS 5000 - 10000</a>

          <div class="serListC3TitleCrate">Brand</div>
            <a href="#" class="serListC3TitleSloth">Belle Chic</a>
            <a href="#" class="serListC3TitleSloth">Aesthetics</a>
            <a href="#" class="serListC3TitleSloth">Suit Up</a>
            <a href="#" class="serListC3TitleSloth">Fashionholic</a>
            <a href="#" class="serListC3TitleSloth">Cloud 9</a>
          <div class="serListC3TitleCrate">Tag</div>
            <a href="#" class="serListC3TitleSloth totext">T-shirt</a>
            <a href="#" class="serListC3TitleSloth totext">Sweater</a>
            <a href="#" class="serListC3TitleSloth totext">Jacket</a>
            <a href="#" class="serListC3TitleSloth totext">Coat</a>
            <a href="#" class="serListC3TitleSloth totext">Jeans</a>
            <a href="#" class="serListC3TitleSloth totext">Socks</a>
            <a href="#" class="serListC3TitleSloth totext">Shorts</a>
            <a href="#" class="serListC3TitleSloth totext">Tracksuit</a>
        </div>
        <div class="serListContThreeSide bor" data-side="right">
          <div class="serListSearchResultText bor">
            Search result for '${searchval}'
          </div>
          <div class="serListProductContainer flex bor">

            <!-- FOR EACH SLOTH -->
            <c:forEach items="${searchResultList}" var="srData">
            <div class="serListProdSloth bor br3">
              <div class="inr_serListProdSloth bor flex fdc">
                <a href="user?page=productDetailsPage&id=${srData.id}" class="serListProdIamgeSloth borx2 br3">
                  <img src="${srData.image}" alt="" class="prod_img_img w100">
                </a>
                <%
                    Product prd =(Product) pageContext.getAttribute("srData");
                    String date = "";
                    date = new Support().newPrd(prd.getReleasedate());
                    String discountStr = "";
                    String priceStr = "serListProdPriceSloth";
                    if(prd.getDiscount()==0){
                        discountStr = "none";
                        priceStr="";
                    }
                    
                %>
                <div class="serListProdNewItemSloth serListProdFF5 bor <%=date%>">New!</div>
                <a href="#" class="serListProdNameSloth serListProdFF5 bor">
                    ${srData.name}
                </a>
                <div class="serListProdDisPriceSloth serListProdFF5 bor <%=discountStr%>">RS ${srData.price} (${srData.discount}% off)</div>
                <div class="<%=priceStr%> serListProdFF5 bor">RS ${srData.price}</div>
                <a href="#" class="serListProdReviewCrate serListProdFF5 bor flex">
                  <div class="prod_review_start_crate flex aic pr10 bor">
                    <!-- FOR EACH SLOTH -->
                    <img src="icons/start.png" alt="" class="serListProdRevStarIcon w100">
                    <img src="icons/start.png" alt="" class="serListProdRevStarIcon w100">
                    <img src="icons/start.png" alt="" class="serListProdRevStarIcon w100">
                    <img src="icons/start.png" alt="" class="serListProdRevStarIcon w100">
                    <!-- FOR EACH END SLOTH -->
                    <!-- FOR EACH SLOTH -->
                    <img src="icons/start-stroke.png" alt="" class="serListProdRevStarIcon w100">
                    <!-- FOR EACH END SLOTH -->
                  </div>
                  <div class="prod review_count_sloth serListProdFF5">(34)</div>
                </a>
              </div>
            </div>
            </c:forEach>
            <!-- FOR EACH END SLOTH -->
            

          </div>
        </div>
      </div>

      <div class="serListExtraProdListTrunk bor">
        <div class="serListExtraTrunk" data-list="feature">
          <!-- FEATURE PRODUCT -->
        </div>
        <div class="serListExtraTrunk" data-list="feature">
          <!-- POPULAR PRODUCT -->
        </div>
      </div>
      <div class="serListFooterTrunk">
        <!-- FOOTER  -->
<%@include file="../include/footer.jsp" %>
      </div>
    </div>
  </body>
</html>