<%@page import="java.util.List"%>
<%@page import="Model.SizeCount"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Product | Edit</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/stylex.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/stylex.css">
    <style>

      .dashBody{height:100vh;}
      .dashLinkTrunk{width: 20%;}
      .dashContentTrunk{width: 80%;background: var(--col6);}

      /* dashcode start */
      .dashInrBody{background:#018790;color:var(--col6);padding:1em 0 1em 2.2em;}
      .dashLinkTitleTrunk{font-size:26px;letter-spacing:.05em;}
      .dashLinkTitleCrate{font-size:20px;letter-spacing:.05em;}
      .dashLinkTitleSloth{font-family:var(--ff1);}
      .dashLinkLine{height:2px;width:90%;background: var(--col6);margin:10px 0;}

      .dashLinkTitleSloth{text-decoration: none;font-size:16px;padding:10px;letter-spacing:.1em;
        border-radius:4px 0 0 4px;color:var(--col6);margin:5px 0;}
      .dashActive{background: var(--col6);color:#018790;}
      /* dashcode end */

      .dashContentTrunk{padding:1em 2.2em 1em 2.2em;background:var(--col6);}
      .inrDashContentTrunK{overflow:auto;}
      .inrDashContentTrunK::-webkit-scrollbar {width: 10px;}
      .inrDashContentTrunK::-webkit-scrollbar-track{box-shadow: inset 0 0 5px grey;border-radius: 10px;}
      .inrDashContentTrunK::-webkit-scrollbar-thumb{background:rgba(170,170,170,.5);border-radius:10px;transition: 0.3s;}
      .inrDashContentTrunK::-webkit-scrollbar-thumb:hover {background: rgba(170,170,170,.5);cursor:pointer;}
      .prodEditTitleTrunk{font-size:26px;letter-spacing:.05em;color:#018790;}
      .prodEditTitleCrate{font-size:20px;letter-spacing:.05em;color:#018790;padding:10px 0;}

      .prodEditColTrunk[data-col="1"]{order:1;}
      .prodEditColTrunk[data-col="2"]{order:2;}
      .prodEditColTrunk[data-col="3"]{order:3;}

      /* prodEditCol[data-col="1"] */
      .prodEditTextTable{border-radius:5px;padding:10px;background:#ddd;}
      .prodEditTextTable tr td{font-family:var(--ff1);font-size:16px;padding:5px 0;color:#000;}
      .prodEditTextTable tr:first-child td{padding-top: 0;}
      .prodEditTableInput{font-family:var(--ff1);font-size:16px;width:100%;padding:2px 5px;border-radius:3px;border:none;
        background:#ddd;border:1px solid #999;}
      .prodEditTableInput:focus{outline:none;}
      .prodEditTableInput[data-type="textarea"]{height:100px;resize:none;}
      .prodEditFromImageUploadBtn::file-selector-button{padding:5px 10px;cursor: pointer;border:none;background: #018790;
        border-radius:3px;transition:.3s;color:#fff;}
      

      /* prodEditCol[data-col="2"] */
      .prodEditColTrunk[data-col="2"]{padding:0 1.6em;}
      .prodEditImageTrunk{height:200px;width:180px;}
      .prodEditImageCrate{height:200px;width: 180px;overflow:hidden;box-shadow:0 0 5px #666;}

      
       /* prodEditCol[data-col="3"] */
      .prodEditSizeCountTable{width:220px;border-spacing: 0px;}
      .prodEditSizeCountTable tr td{width:100px;text-align: center;font-family:var(--ff1);font-size:15px;border:none;
        padding:3px 0;}
      .prodEditSizeCountTable tr:nth-child(odd) td{background: #CCC}
      .prodEditSizeCountTable tr:nth-child(even) td{background:var(--col6)}
      .prodEditSizeCountTable tr:first-child td{border-top: 1px solid #018790;background:#018790;color:#fff;}
      .prodEditSizeCountTable tr td:nth-child(1){width:40px;}
      .prodEditSizeCountTable tr td input{text-align: center;font-family:var(--ff1);font-size:15px;width:100%;border:none;padding:2px;
        background:inherit;}
      .prodEditSizeCountTable tr td input:focus{outline:none;}
      
      .prodEditFormBtn{font-size:16px;padding:5px 20px;margin-right:10px;border-radius:3px;background: #018790;
        cursor: pointer;color:#fff;transition:.3s;border:none;}
      .prodEditFormBtn[data-btn="reset"]{background:#DC4C64;}
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
          <div class="prodEditTitleTrunk pb15 ff1 bor">
            Product > Add
          </div>
          <form action="admin?page=editProduct&id=${productdetail.id}" class="prodEditForm bor fg1 flex fdc h100 bor" enctype="multipart/form-data" method="post">
            <div class="prodEditFormInputTrunk fg1 flex jcsb bor"> 
              <div class="prodEditColTrunk bor" data-col="3">
                <div class="prodEditTitleCrate ff1 bor" data-title="1">
                  Size & Count
                </div>
                <table class="prodEditSizeCountTable">
                  <tr>
                    <td>SN</td>
                    <td>Count</td>
                    <td>Size</td>
                  </tr>

                  <!-- for each start -->
                  <c:forEach items="${productsizecount}" var="prsc">
                    <tr>
                      <td>
                          <input type="text" name="hiddenid${prsc.id}" value="${prsc.idd}" hidden>
                          ${prsc.id}
                      </td>
                      <td>
                        <input type='text' class='prodEditSize' placeholder='  size..' value="${prsc.size}" name='size${prsc.id}' required>
                      </td>
                      <td>
                        <input type='text' class='prodEditCount' placeholder='  count..' value="${prsc.count}" name='count${prsc.id}' required>
                      </td>
                    </tr>
                  </c:forEach>
                  <!-- for each end -->
                  <%
                    List<SizeCount> scc =(List<SizeCount>) request.getAttribute("productsizecount");
                    for(int scid=scc.size()+1;scid<=10;scid++){
                  %>
                    <tr>
                        <td><%=scid%></td>
                        <td>
                            <input type='text' class='prodEditSize' placeholder='  size..' value="" name='size<%=scid%>'>
                        </td>
                        <td>
                            <input type='text' class='prodEditCount' placeholder='  count..' value="" name='count<%=scid%>'>
                        </td>
                    </tr>
                  <%}%>
                  
                </table>
              </div>

              <div class="prodEditColTrunk bor" data-col="2">
                <div class="prodEditTitleCrate ff1 bor" data-title="1">
                  Image
                </div>
                <div class="prodEditImageTrunk flexmid bor">
                  <div class="prodEditImageCrate borw br3">
                    <input type="text" name="hiddenimage" value="${productdetail.image}" hidden>
                    <img src="${productdetail.image}" class="prodEditImageSloth w100" alt="">
                  </div>
                </div>
              </div>

              <div class="prodEditColTrunk fg1 bor" data-col="1">
                <div class="prodEditTitleCrate ff1 bor" data-title="1">
                  Product
                </div>
                
                <!-- =============================================================================================== -->

                <table class="prodEditTextTable w100 bor">
                  <tr>
                    <td>
                      Name
                    </td>
                    <td>
                      <input type="text" class="prodEditTableInput" data-type="text" oninput="prodEditFormOnchange(event)" value="${productdetail.name}" placeholder="product name..." name="name" required>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Description
                    </td>
                    <td>
                      <textarea class="prodEditTableInput" data-type="textarea" oninput="prodEditFormOnchange(event)"  placeholder="product description..." name="description" required>${productdetail.description}</textarea>
                    </td>
                  </tr>
                  <tr>
                   <td>
                     Brand
                   </td>
                   <td>
                     <input type="text" class="prodEditTableInput" data-type="text" oninput="prodEditFormOnchange(event)" value="${productdetail.brand}" placeholder="product brand..." name="brand" required>
                   </td>
                  </tr>
                  <tr>
                    <td>
                      Category
                    </td>
                    <td>
                      <select class="prodEditTableInput" data-type="select" oninput="prodEditFormOnchange(event)"  name="category">
                        <option value="both">Both</option>
                        <option value="male">male</option>
                        <option value="female">female</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Price
                    </td>
                    <td>
                      <input type="text" class="prodEditTableInput " data-type="text" oninput="prodEditFormOnchange(event)" value="${productdetail.price}" placeholder="product price..." name="price" required>
                    </td>
                  </tr>
                  <tr>
                   <td>
                     Discount
                   </td>
                   <td>
                     <input type="text" class="prodEditTableInput" data-type="text" oninput="prodEditFormOnchange(event)" value="${productdetail.discount}" placeholder="product discount..." name="discount" required>
                   </td>
                  </tr>
                  <tr>
                    <td>
                      Tags
                    </td>
                    <td>
                      <input type="text" class="prodEditTableInput" data-type="text" oninput="prodEditFormOnchange(event)" value="${productdetail.tags}" placeholder="product tags..." name="tags" required>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Date
                    </td>
                    <td>
                      <input type="date" class="prodEditTableInput prodEditTableDate" data-type="text" oninput="prodEditFormOnchange(event)" data-date="${productdetail.releasedate}" value="${productdetail.releasedate}" placeholder="release date..." name="releasedate" required>
                    </td>
                  </tr>
                  <tr>
                   <td>
                     Visibility
                   </td>
                   <td>
                     <select class="prodEditTableInput" data-type="select" oninput="prodEditFormOnchange(event)" name="visibility">
                       <option value="true">True</option>
                       <option value="false">False</option>
                     </select>
                   </td>
                  </tr>
                  <tr>
                    <td>
                      Image
                    </td>
                    <td>
                      <input type="file" class = "prodEditFromImageUploadBtn prodEditInpImg" oninput="prodEditFormOnchange(event)" accept="image/jpeg, image/png, image/jpg" name="file">
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2" class="dPordAddFormWrongMsg ff5 none">
                      You need to fill up all the input of form.
                    </td>
                  </tr>
               </table>
                <!-- ================================================================================================= -->

              </div>

            </div>
            <div class="prodEditButtonTrunk bor">
              <input type="submit" class="prodEditFormBtn" data-btn="sumbit" value="Update">
              <input type="reset" class="prodEditFormBtn" data-btn="reset" value="Reset">
            </div>
          </form>
        </div>
      </div>
    </div>
    <script src="../js1/script1.js"></script>
    <script>
      //var prodEditTableDate = document.querySelector(".prodEditTableDate");
      //var inrgmblock = document.querySelectorAll(".inrgmblock");

      var prodEditInpImg = document.querySelector(".prodEditInpImg");
      var prodEditImageSloth = document.querySelector(".prodEditImageSloth");

      prodEditInpImg.addEventListener('change',()=>{
        prodEditImageSloth.src = URL.createObjectURL(prodEditInpImg.files[0]);
      });
      
      var prodEditTableDate = document.querySelector(".prodEditTableDate");
      manageDate();
      function manageDate(){
          var olddate = prodEditTableDate.getAttribute("data-date");
          var date1 = olddate[0]+olddate[1];
          var date2 = olddate[3]+olddate[4];
          var date3 = olddate[6]+olddate[7]+olddate[8]+olddate[9];
          var newdate = date3+"-"+date2+"-"+date1;
          console.log(olddate,newdate);
          if(olddate[2] == "-"){prodEditTableDate.value = newdate;}
          else{prodEditTableDate.value = olddate;}
      }
    </script>
  </body>
</html>
