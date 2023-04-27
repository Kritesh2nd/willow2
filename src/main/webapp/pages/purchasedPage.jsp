<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Purchased Page | 01</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/stylex.css">
    <style>
      body::-webkit-scrollbar {width: 10px;}
      body::-webkit-scrollbar-track{box-shadow: inset 0 0 5px grey;border-radius: 10px;}
      body::-webkit-scrollbar-thumb{background:rgba(170,170,170,.5);border-radius:10px;transition: 0.3s;}
      body::-webkit-scrollbar-thumb:hover {background: rgba(170,170,170,.5);cursor:pointer;}
      .purchasedBody{height: auto;background:var(--col7);}
      .purchasedNavDesktop{height: 80px;}

      /* purchasedContainer */
      .purchasedContainer{padding:1em 2.2em 1em 2.2em;}
      .checkoutTitleTrunk{font-family:var(--ff5);font-size:30px;letter-spacing:.1em;font-weight: 600;}
      .checkoutSubTitleSloth{font-family:var(--ff5);font-size:20px;letter-spacing:.1em;cursor: pointer;}
      .checkoutSubTitleSloth span{height:0px;width: 100%;background: #000;left:0;bottom:-7px;transition:.2s;}
      .checkoutSubTitleSloth:hover span{height:2px;bottom:-5px;}
      .checkoutSubTitleSloth span[data-active="true"]{height:2px;bottom:-5px;}

      /* .purchasedTable */
      .purchasedTableTrunk{min-height:400px;}
      .purchasedTable{width:100%;border-spacing:0;box-shadow:2px 2px 2px #888;}
      .purchasedTable tr td:first-child{padding-left:15px;text-align: left;}
      .purchasedTable tr td:nth-child(2){text-align: left;padding-left:20px;}

      .purchasedTable tr:first-child td{font-weight: bold;background:var(--col7);color:#000;}
      .purchasedTable tr:nth-child(odd){background:#ccc;}
      .purchasedTable tr td{padding:12px 0;text-align: center;}
      
      /* second purchased table */
      .perOrderDetailCol[data-col="product"]{width:60%;}
      .perOrderDetailCol[data-col="customer"]{width:40%;}
      .perOrderedDetailTitleCrate{font-family:var(--ff5);font-size:20px;letter-spacing:.1em;padding-bottom: 10px;}

      .checkoutTable{border-spacing:0;box-shadow:2px 2px 2px #888;}
      .checkoutTable tr:first-child td{font-weight: bold;background:var(--col7);color:#fff;}
      .checkoutTable tr:nth-child(even){background:#ccc;}
      .checkoutTable tr td{padding:6px 0;text-align: center;font-size:15px;}
      .checkoutTable tr td:first-child{text-align-last: left;padding-left: 15px;}
      .checkoutRemoveLink{height:18px;width: 18px;}
      
      .perOrderDetailCustomerText{font-family:var(--ff5);letter-spacing:.05em;color:#333;padding:3px 0;}
      .perOrderDetailCustomerText a{background: #000;color: #fff;font-size:15px;width:300px;text-align: center;margin:12px 0 0 0;
        transition:.2s;}
      .perOrderDetailCustomerText a:hover{margin:10px 0 2px 0;}

      .perOrderDetailLink{height:1px;width:100%;background: #999;margin:20px 0;}
    </style>
  </head>
  <body>
    <div class="purchasedBody flex fdc bor">
      <!-- purchased --> 
      <div class="purchasedNavBody box3">
        <div class="purchasedNavDesktop bor">
          <!--  SPACE FOR NAVBAR  -->
<%@include file="../include/navbar.jsp" %>          
        </div>
        <div class="purchasedNavPhone bor">
          <!--  SPACE FOR RESPONSIVE NAVBAR  -->
        </div>
      </div>

      <!-- PURCHASED MAIN CONTAINER -->
      <div class="purchasedContainer bor">
        <div class="checkoutTitleTrunk pb10 bor">
          Purchased product list
        </div>
        <div class="checkoutSubTitleTrunk pb20 flex bor">
          <div class="checkoutSubTitleSloth rel mr20">
            Purchased
            <span class="abs" data-active="true"></span>
          </div>
          <div class="checkoutSubTitleSloth rel none">
            Ordered
            <span class="abs" data-active=""></span>
          </div>
        </div>
        <!-- product list table -->
        <div class="purchasedTableTrunk flex fdc pb20 bor">
          <table class="purchasedTable bor" data-table="purchased">
            <tr>
              
              <td>Name</td>
              <td>Brand</td>
              <td>Price</td>
              <td>Size</td>
              
              <td>Purchased Date</td>
              <td>Details</td>
            </tr>
            <!-- for each loop start -->
            <c:forEach items="${purchasedList}" var="purData">
            <tr>
              
              <td>
                  ${purData.name}
              </td>
              <td>Willow</td>
              <td>
                  NRS ${purData.price}
              </td>
              <td>
                  ${purData.size}
              </td>
              <td>
                  ${purData.date}
              </td>
              <td>
                <a href="#" class="purchasedDetailLink txtx">Details</a>
              </td>
            </tr>
            </c:forEach>
<!--            <tr><td>2</td><td>Blue cotton shirt</td><td>Willow</td><td>NRS 4000</td><td>xl</td><td>4.5</td><td>23-04-2023</td><td><a href="#" class="purchasedDetailLink txtx">Details</a></td></tr>
            <tr><td>3</td><td>Blue cotton shirt</td><td>Willow</td><td>NRS 4000</td><td>xl</td><td>4.5</td><td>23-04-2023</td><td><a href="#" class="purchasedDetailLink txtx">Details</a></td></tr>
            <tr><td>4</td><td>Blue cotton shirt</td><td>Willow</td><td>NRS 4000</td><td>xl</td><td>4.5</td><td>23-04-2023</td><td><a href="#" class="purchasedDetailLink txtx">Details</a></td></tr>
            <tr><td>5</td><td>Blue cotton shirt</td><td>Willow</td><td>NRS 4000</td><td>xl</td><td>4.5</td><td>23-04-2023</td><td><a href="#" class="purchasedDetailLink txtx">Details</a></td></tr>
            <tr><td>6</td><td>Blue cotton shirt</td><td>Willow</td><td>NRS 4000</td><td>xl</td><td>4.5</td><td>23-04-2023</td><td><a href="#" class="purchasedDetailLink txtx">Details</a></td></tr>
            <tr><td>7</td><td>Blue cotton shirt</td><td>Willow</td><td>NRS 4000</td><td>xl</td><td>4.5</td><td>23-04-2023</td><td><a href="#" class="purchasedDetailLink txtx">Details</a></td></tr>
            <tr><td>8</td><td>Blue cotton shirt</td><td>Willow</td><td>NRS 4000</td><td>xl</td><td>4.5</td><td>23-04-2023</td><td><a href="#" class="purchasedDetailLink txtx">Details</a></td></tr>
            <tr><td>9</td><td>Blue cotton shirt</td><td>Willow</td><td>NRS 4000</td><td>xl</td><td>4.5</td><td>23-04-2023</td><td><a href="#" class="purchasedDetailLink txtx">Details</a></td></tr>
            <tr><td>10</td><td>Blue cotton shirt</td><td>Willow</td><td>NRS 4000</td><td>xl</td><td>4.5</td><td>23-04-2023</td><td><a href="#" class="purchasedDetailLink txtx">Details</a></td></tr>
             for each loop end -->
          </table>
        </div>

        <!-- second table trunk -->
        <div class="purchasedTableTrunk flex fdc pb20 none">
          <!-- for each order start -->
          
          <div class="purOrderedDetailTrunk flex fdc w100">
            <div class="perOrderedDetailTitleCrate">
              Order 1
            </div>
            <div class="perOrderedDetailTrunkInr flex jcsb ">
              <div class="perOrderDetailCol fg1 bor" data-col="product">
                <table class="checkoutTable box w100">
                  <tr>
                    <td>Product</td>
                    <td>Size</td>
                    <td>Quantity</td>
                    <td>Price</td>
                  </tr>
                  <!-- for each list start  -->
                  <tr><td>Crocodile T-Shirt</td><td>32</td><td>1</td><td>NRS 4530</td></tr>
                  <tr><td>Crocodile T-Shirt</td><td>32</td><td>1</td><td>NRS 4530</td></tr>
                  <tr><td>Crocodile T-Shirt</td><td>32</td><td>1</td><td>NRS 4530</td></tr>
                  <tr><td>Crocodile T-Shirt</td><td>32</td><td>1</td><td>NRS 4530</td></tr>
                  <!-- for each list end  -->
                </table>
              </div>
              <div class="perOrderDetailCol plr30 bor" data-col="customer">
                <div class="perOrderDetailCustomerText">Kritesh Thapa</div>
                <div class="perOrderDetailCustomerText">herethapamagar@gmail.com</div>
                <div class="perOrderDetailCustomerText">Kusunti, Lalipur</div>
                <div class="perOrderDetailCustomerText">Covonent School</div>
                <div class="perOrderDetailCustomerText">9876543210</div>
                <div class="perOrderDetailCustomerText">
                  Your order is expected to be arrived after 3 bussiness days in 27-04-2023
                </div>
                <div class="perOrderDetailCustomerText flex bor">
                  <a href="#" class="totext p10">
                    Cancel order
                  </a>
                </div>
              </div>
            </div>
            <span class="perOrderDetailLink bor"></span>
          </div>

          <!-- for each order end -->
        </div>
      </div>

      <div class="purchasedExtraProdListTrunk bor">
        <div class="purchasedExtraTrunk" data-list="feature">
          <!-- FEATURE PRODUCT -->
        </div>
        <div class="purchasedExtraTrunk" data-list="feature">
          <!-- POPULAR PRODUCT -->
        </div>
      </div>
      <div class="purchasedFooterTrunk">
        <!-- FOOTER  -->
<%@include file="../include/footer.jsp" %>        
      </div>
    </div>
  </body>
</html>

