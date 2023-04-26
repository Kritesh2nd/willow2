<%@page import="Model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Check out | 01</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/stylex.css">
    <style>
      body::-webkit-scrollbar {width: 10px;}
      body::-webkit-scrollbar-track{box-shadow: inset 0 0 5px grey;border-radius: 10px;}
      body::-webkit-scrollbar-thumb{background:rgba(170,170,170,.5);border-radius:10px;transition: 0.3s;}
      body::-webkit-scrollbar-thumb:hover {background: rgba(170,170,170,.5);cursor:pointer;}
      .checkoutBody{height: auto;background:var(--col7);}
      .checkoutNavDesktop{height: 80px;}

      /* .checkoutContainer */
      .checkoutContainer{padding:1em 2.2em 1em 2.2em;}
      .checkoutMainTrunk{width: 72%;}
      .checkoutCheckoutTrunk{width: 28%;padding-left: 30px;}

      /* checkoutMainTrunk */
      .checkoutTitleTrunk{font-family:var(--ff5);font-size:30px;letter-spacing:.1em;font-weight: 600;}
      .checkoutTable{border-spacing:0;box-shadow:2px 2px 2px #888;}
      .checkoutTable tr:first-child td{font-weight: bold;background:var(--col7);color:#000;}
      .checkoutTable tr:nth-child(even){background:#ccc;}
      .checkoutTable tr td{padding:12px 0;text-align: center;}
      .checkoutTable tr td:first-child{text-align-last: left;padding-left: 15px;}
      .checkoutRemoveLink{height:18px;width: 18px;}
      

      /* form */
      .checkoutForm{background:#ddd;padding:25px 30px;border-radius:4px;box-shadow:0 0 5px #000;}
      .checkoutFormTextSloth{font-family:var(--ff5);font-size:16px;padding-bottom:10px;}
      .checkoutFormInputCrate{padding-bottom: 15px;width:100%;}
      .checkoutFormInputSloth{font-family:var(--ff5);font-size:16px;background:var(--col7);border:1px solid #000;padding:3px 5px;
        width: 100%;background:#ddd;border:none;border-bottom:1px solid #000;}
      .checkoutFormInputSloth::placeholder{font-size:16px;}
      .checkoutFormInputSloth:focus{outline:none;}

      .checkoutFromTotalTrunk{padding:30px 0 10px 0;}
      .checkoutFormTotalCrate{width:100%;color:#666;padding-bottom:10px;}
      .checkoutFormTotalText{letter-spacing:.05em;}
      .checkoutFormTotalText[data-side="right"]{color:#000;font-size:15px;}
      .checkoutFormLine{height:1px;width:100%;background:#888;margin:10px 0 15px 0;}

      .checkoutConfirmBtn{font-family:var(--ff5);background: #000;color:#fff;padding:10px;width:100%;border:none;
        letter-spacing:.1em;cursor: pointer;margin:2px 0 0 0;transition:.2s;}
      .checkoutConfirmBtn:hover{margin: 0 0 2px 0;}
    </style>
  </head>
  <body>
    <div class="checkoutBody bor">
      <!-- checkout --> 
      <div class="checkoutNavBody box3">
        <div class="checkoutNavDesktop bor">
          <!--  SPACE FOR NAVBAR  -->
<%@include file="../include/navbar.jsp" %>          
        </div>
        <div class="checkoutNavPhone bor">
          <!--  SPACE FOR RESPONSIVE NAVBAR  -->
        </div>
      </div>

      <div class="checkoutContainer bor">
        <div class="checkoutContainerInr flex jcsb bor">
          <!-- checkoutMainTrunk -->
          <div class="checkoutMainTrunk bor">
            <div class="checkoutTitleTrunk pb10 bor">
              Shopping Cart.
            </div>
            <table class="checkoutTable bor w100">
              <tr>
                <td>Product</td>
                <td>Size</td>
                <td>Quantity</td>
                <td>Total Price</td>
                <td>Remove</td>
              </tr>
              <!-- for each list start  -->
              <%
                  int subPrice=0,finalPrice=0;
              %>
<c:forEach items="${cartProductList}" var="cartdata">
    <%
    Product p =(Product) pageContext.getAttribute("cartdata");
    subPrice += p.getPrice();
    %>
                <tr>
                    <td>
                        ${cartdata.name}
                    </td>
                    <td>
                        ${cartdata.size}
                    </td>
                    <td>
                        1
                    </td>
                    <td>
                        NRS ${cartdata.price}
                    </td>
                    
                    <td class="flexmid">
                        <a href="user?page=removeCartProduct&pid=${cartdata.id}&id=<%=userid%>" class="checkoutRemoveLink flex bor">
                            <img src="icons/times.png" alt="" class="w100 bor" >
                        </a>
                    </td>
                </tr>
</c:forEach>
            <%
            finalPrice = subPrice+200;
            %>
              <!-- for each list end  -->
            </table>
            <div class="checkoutSingleTrunk box">
            </div>
          </div>
          <!-- checkoutCheckoutTrunk -->
          <div class="checkoutCheckoutTrunk bor">
            <div class="checkoutTitleTrunk pb10 bor">
              Payment details
            </div>
            <form action="" class="checkoutForm flex fdc bor" method="post">
              <div class="checkoutFormTextSloth" form-text="email">Name</div>
              <div class="checkoutFormInputCrate bor">
                <input type="text" class="checkoutFormInputSloth" placeholder="your name..." value="<%=username%>" name="name" required>
              </div>
              <div class="checkoutFormTextSloth" form-text="email">Email</div>
              <div class="checkoutFormInputCrate bor">
                <input type="text" class="checkoutFormInputSloth" placeholder="your email..." value="<%=user.getEmail()%>" name="email" required>
              </div>
              <div class="checkoutFormTextSloth" form-text="email">Address</div>
              <div class="checkoutFormInputCrate bor">
                <input type="text" class="checkoutFormInputSloth" placeholder="your address..." value="<%=user.getAddress()%>" name="address" required>
              </div>
              <div class="checkoutFormTextSloth" form-text="email">Nearby landmark</div>
              <div class="checkoutFormInputCrate bor">
                <input type="text" class="checkoutFormInputSloth" placeholder="nearby landmark..." name="landmark" required>
              </div>
              <div class="checkoutFormTextSloth" form-text="email">Phone number</div>
              <div class="checkoutFormInputCrate bor">
                <input type="text" class="checkoutFormInputSloth" placeholder="your phone number..." value="<%=user.getPhnumber()%>" name="number" required>
              </div>
              
              <div class="checkoutFromTotalTrunk flex fdc">
                <input type="text" class="checkoutFormInputSloth" placeholder="subtotal" name="subtotal" required hidden>
                <div class="checkoutFormTotalCrate flex jcsb" data-total-crate="subtotal">
                  <div class="checkoutFormTotalText" data-side="left">Subtotal</div>
                  <div class="checkoutFormTotalText" data-side="right">NRS <%=subPrice%></div>
                </div>
                <input type="text" class="checkoutFormInputSloth" placeholder="shipping" name="shipping" required hidden>
                <div class="checkoutFormTotalCrate flex jcsb" data-total-crate="shipping">
                  <div class="checkoutFormTotalText" data-side="left">Shipping</div>
                  <div class="checkoutFormTotalText" data-side="right">NRS 200</div>
                </div>
                <input type="text" class="checkoutFormInputSloth" placeholder="total" name="subtotal" required hidden>
                <div class="checkoutFormLine"></div>
                <div class="checkoutFormTotalCrate flex jcsb" data-total-crate="total">
                  <div class="checkoutFormTotalText" data-side="left">Total</div>
                  <div class="checkoutFormTotalText" data-side="right">NRS <%=finalPrice%></div>
                </div>
              </div>

              <div class="checkoutFormBtnCrate bor">
                <input type="submit" class="checkoutConfirmBtn" value="Confirm Order">
              </div>
            </form>
          </div>
        </div>
      </div>

      <div class="checkoutExtraProdListTrunk bor">
        <div class="checkoutExtraTrunk" data-list="feature">
          <!-- FEATURE PRODUCT -->
        </div>
        <div class="checkoutExtraTrunk" data-list="feature">
          <!-- POPULAR PRODUCT -->
        </div>
      </div>
      <div class="checkoutFooterTrunk">
        <!-- FOOTER  -->
<%@include file="../include/footer.jsp" %>        
      </div>
    </div>
  </body>
</html>
