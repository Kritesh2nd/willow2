<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Product | Detail</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/stylex.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/stylex.css">
    <style>
      .dashBody{height:100vh;}
      .dashLinkTrunk{width: 20%;}
      .dashContentTrunk{width: 80%;background: var(--col6);;}

      /* dashcode start */
      .dashInrBody{background:var(--col7);;color:var(--col6);padding:1em 0 1em 2.2em;}
      .dashLinkTitleTrunk{font-size:26px;letter-spacing:.05em;}
      .dashLinkTitleCrate{font-size:20px;letter-spacing:.05em;}
      .dashLinkTitleSloth{font-family:var(--ff1);}
      .dashLinkLine{height:2px;width:90%;background: var(--col6);margin:10px 0;}

      .dashLinkTitleSloth{text-decoration: none;font-size:16px;padding:10px;letter-spacing:.1em;
        border-radius:4px 0 0 4px;color:var(--col6);margin:5px 0;}
      .dashActive{background: var(--col6);color:var(--col7);}
      /* dashcode end */

      .dashContentTrunk{padding:1em 2.2em 1em 2.2em;background:var(--col6);}
      .inrDashContentTrunK{overflow:auto;}
      .inrDashContentTrunK::-webkit-scrollbar {width: 10px;}
      .inrDashContentTrunK::-webkit-scrollbar-track{box-shadow: inset 0 0 5px grey;border-radius: 10px;}
      .inrDashContentTrunK::-webkit-scrollbar-thumb{background:rgba(170,170,170,.5);border-radius:10px;transition: 0.3s;}
      .inrDashContentTrunK::-webkit-scrollbar-thumb:hover {background: rgba(170,170,170,.5);cursor:pointer;}
      .prodDetTitleTrunk{font-size:26px;letter-spacing:.05em;color:#018790;}
      .prodDetTitleCrate{font-size:20px;letter-spacing:.05em;color:#018790;padding:10px 0;}
      .prodDetTitleCrate[data-title-crate="1"]{width: 40%;}
      .prodDetTitleCrate[data-title-crate="2"]{width: 60%;}

      .prodDetTwoTrunks{height:calc(100% - 100px);}
      .prodDetSideTrunk{width:40%;}
      .prodDetSideTrunk[data-side="review"]{width:60%;}
      .prodDetSideTrunk{overflow:auto;}
      .prodDetSideTrunk::-webkit-scrollbar {width: 10px;}
      .prodDetSideTrunk::-webkit-scrollbar-track{box-shadow: inset 0 0 5px grey;border-radius: 10px;}
      .prodDetSideTrunk::-webkit-scrollbar-thumb{background:rgba(170,170,170,.5);border-radius:10px;transition: 0.3s;}
      .prodDetSideTrunk::-webkit-scrollbar-thumb:hover {background: rgba(170,170,170,.5);cursor:pointer;}
      
      .prodDetImageTrunk{height:200px;width:180px;}
      .prodDetImageCrate{height:200px;width: 180px;overflow:hidden;box-shadow:0 0 5px #666;}

      .prodDetInfoTable{border-spacing: 0px;}
      .prodDetInfoTable tr td{font-family:var(--ff1);font-size:16px;border:none;padding:6px 0;}
      .prodDetInfoTable tr td:first-child{padding:0 8px;}
      .prodDetInfoTable tr td:last-child{padding-right: 8px;}
      .prodDetInfoTable tr:nth-child(odd) td{background: #CCC}
      .prodDetInfoTable tr:nth-child(even) td{background:var(--col6)}
      /* .prodDetInfoTable tr:first-child td{border-top: 1px solid #018790;background:#018790;color:#fff;} */

      .prodDetInfoSizeCountTable{border-spacing: 0px;width: 240px;}
      .prodDetInfoSizeCountTable tr td{text-align: center;font-family:var(--ff1);font-size:16px;border:none;padding:6px 0;}
      .prodDetInfoSizeCountTable tr td:first-child{padding:0 8px;}
      .prodDetInfoSizeCountTable tr td:last-child{padding-right: 8px;}
      .prodDetInfoSizeCountTable tr:nth-child(odd) td{background: #CCC}
      .prodDetInfoSizeCountTable tr:nth-child(even) td{background:var(--col6)}
      .prodDetInfoSizeCountTable tr:first-child td{border-top: 1px solid #018790;background:#018790;color:#fff;}

      .prodDetFormBtn{font-size:16px;padding:5px 20px;margin-right:10px;border-radius:3px;background: #018790;
        cursor: pointer;color:#fff;transition:.3s;border:none;text-decoration: none;}
      .prodDetFormBtn[data-btn="delete"]{background:#DC4C64;}


      /* REVIEW */
      .prodDetReviewCrate{background:#ccc;padding:8px 10px;border-radius:4px;}
      .prodDetRevProfileCrate{height:40px;width:40px;}
      .prodDetRevProfileSloth{height:40px;width:40px;overflow:hidden;border-radius:50%;}
      .prodDetRevText{font-family:var(--ff1);font-style: 14px;}
      .prodDetRevText[data-rev="name"]{font-weight: 600;}
      .prodDetRevTextIcon{height:18px;width:18px;}
      
      .prodDetRevEllipsisCrate{cursor: pointer;}
      .prodDetRevEllipsisCrate:hover .prodDetRevBtnOptCrate{display: flex;}
      .prodDetRevBtnOptCrate{right:10px;top:0;padding:5px 0;background:#ccc;display: none;}
      .prodDetRevBtnOptCrate a{font-family:var(--ff1);font-size:14px;text-decoration: none;padding:3px 12px;color:#000;}
      .prodDetRevBtnOptCrate a:hover{background:var(--col7);color:#fff;}
    </style>
  </head>
  <body>
    <div class="dashBody flex bor">
      <div class="dashLinkTrunk  bor">

        <!-- dashcode start -->
<%@include file="dashMini.jsp" %>
        <!-- dashcode End -->

      </div>
      <div class="dashContentTrunk bor">
        <div class="inrDashContentTrunK flex fdc hw100 bor">
          <div class="prodDetTitleTrunk ff1 pb15 ff1 bor">
            Product > Details
          </div>
          <div class="prodDetTwoTitleCrate flex">
            <div class="prodDetTitleCrate ff1" data-title-crate="1">Information</div>
            <div class="prodDetTitleCrate ff1" data-title-crate="2">Reviews</div>
          </div>
          <div class="prodDetTwoTrunks flex bor">
            <div class="prodDetSideTrunk flex fdc bor out" data-side="info">
              
              <div class="prodDetImageTrunk mb15 flexmid bor">
                <div class="prodDetImageCrate borw br3">
                  <img src="${productdetail.image}" class="prodDetImageSloth w100" alt="">
                </div>
              </div>
              <table class="prodDetInfoTable pb15 bor">
                <tr>
                  <td>Name</td>
                  <td>
                      ${productdetail.name}
                  </td>
                </tr>
                <tr>
                  <td>Description</td>
                  <td>
                      ${productdetail.description}
                  </td>
                </tr>
                <tr>
                  <td>Brand</td>
                  <td>
                      ${productdetail.brand}
                  </td>
                </tr>
                <tr>
                  <td>Category</td>
                  <td>
                      ${productdetail.category}
                  </td>
                </tr>
                <tr>
                  <td>Price</td>
                  <td>
                      NRS ${productdetail.price}
                  </td>
                </tr>
                <tr>
                  <td>Discount</td>
                  <td>
                      ${productdetail.discount}%
                  </td>
                </tr>
                <tr>
                  <td>Final price</td>
                  <td>
                      NRS ${productdetail.price}
                  </td>
                </tr>
                <tr>
                  <td>Tags</td>
                  <td>
                      ${productdetail.tags}
                  </td>
                </tr>
                <tr>
                  <td>Total count</td>
                  <td>
                      100 x-x
                  </td>
                </tr>
                <tr>
                  <td>Release date</td>
                  <td>
                      ${productdetail.releasedate}
                  </td>
                </tr>
                <tr>
                  <td>Visibility</td>
                  <td>
                      ${productdetail.visibility}
                  </td>
                </tr>
                <tr>
                  <td>Focused</td>
                  <td>
                      ${productdetail.focused1}, ${productdetail.focused2}
                  </td>
                </tr>
                
              </table>
              <div class="prodDetTitleCrate ptb10">
                Avilable Size & Count
              </div>
              <table class="prodDetInfoSizeCountTable pb30">
                <tr>
                  <td>SN</td>
                  <td>Size</td>
                  <td>Count</td>
                </tr>
                <c:forEach items="${productsizecount}" var="prsc">
                    <tr>
                        <td>${prsc.id}</td>
                        <td>${prsc.size}</td>
                        <td>${prsc.count}</td>
                    </tr>
                </c:forEach>
              </table>

              <div class="prodDetButtonTrunk pb50 bor">
                <a href="admin?page=productEditPage&id=${productdetail.id}" class="prodDetFormBtn ff1" data-btn="edit">Edit</a>
                <a href="admin?page=productDelete&id=${productdetail.id}" class="prodDetFormBtn ff1" data-btn="delete">Delete</a>
              </div>
            </div>
            <div class="prodDetSideTrunk flex fdc pl25 bor out" data-side="review">
              <!-- review for each start -->

              <div class="prodDetReviewCrate flex mb10 bor">
                <div class="prodDetRevProfileCrate mr8">
                  <div class="prodDetRevProfileSloth borx3">
                    <img src="../image/tshirt2.jpg" alt="" class="w100">
                  </div>
                </div>
                <div class="prodDetRevTextCrate fg1 flex fdc bor">
                  <div class="prodDetRevText flex" data-rev="name">
                    Kritesh Thapa
                    <div class="prodDetRevTextIcon bor ml5">
                      <img src="../icons/start-fill100.png" alt="" class="w100">
                    </div>
                    <div class="prodDetRevTextIcon bor ml5">
                      <img src="../icons/eye-slash.png" alt="" class="w100">
                    </div>
                  </div>
                  <div class="prodDetRevText" data-rev="review">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi, odit qui amet debitis quae eaque sunt sint, voluptates accusamus eveniet, eos commodi modi! Quia itaque doloribus, quas sunt hic voluptate.
                  </div>
                </div>
                <div class="prodDetRevDotCrate flex fdc bor">
                  <div class="prodDetRevEllipsisCrate rel p3 bor cup">
                    |
                    <div class="prodDetRevBtnOptCrate abs flex fdc borx3 br2">
                      <a href="#" class="prodDetRevOpts">Mark</a>
                      <a href="#" class="prodDetRevOpts">Hide</a>
                      <a href="#" class="prodDetRevOpts">Delete</a>
                    </div>
                  </div>
                </div>
              </div>

              <!-- review for each end -->
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="../js1/script1.js"></script>
    <script>
      //var mainbody = document.querySelector(".mainbody");
      //var inrgmblock = document.querySelectorAll(".inrgmblock");
    </script>
  </body>
</html>
