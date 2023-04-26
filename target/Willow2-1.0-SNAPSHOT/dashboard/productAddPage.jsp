<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Product | Add</title>
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
      .prodAddTitleTrunk{font-size:26px;letter-spacing:.05em;color:#018790;}
      .prodAddTitleCrate{font-size:20px;letter-spacing:.05em;color:#018790;padding:10px 0;}

      .prodAddColTrunk[data-col="1"]{order:1;}
      .prodAddColTrunk[data-col="2"]{order:2;}
      .prodAddColTrunk[data-col="3"]{order:3;}

      /* prodAddCol[data-col="1"] */
      .prodAddTextTable{border-radius:5px;padding:10px;background:#ddd;}
      .prodAddTextTable tr td{font-family:var(--ff1);font-size:16px;padding:5px 0;color:#000;}
      .prodAddTextTable tr:first-child td{padding-top: 0;}
      .prodAddTableInput{font-family:var(--ff1);font-size:16px;width:100%;padding:2px 5px;border-radius:3px;border:none;
        background:#ddd;border:1px solid #999;}
      .prodAddTableInput:focus{outline:none;}
      .prodAddTableInput[data-type="textarea"]{height:100px;resize:none;}
      .prodAddFromImageUploadBtn::file-selector-button{padding:5px 10px;cursor: pointer;border:none;background: #018790;
        border-radius:3px;transition:.3s;color:#fff;}
      

      /* prodAddCol[data-col="2"] */
      .prodAddColTrunk[data-col="2"]{padding:0 1.6em;}
      .prodAddImageTrunk{height:200px;width:180px;}
      .prodAddImageCrate{height:200px;width: 180px;overflow:hidden;box-shadow:0 0 5px #666;}

      
       /* prodAddCol[data-col="3"] */
      .prodAddSizeCountTable{width:220px;border-spacing: 0px;}
      .prodAddSizeCountTable tr td{width:100px;text-align: center;font-family:var(--ff1);font-size:15px;border:none;
        padding:3px 0;}
      .prodAddSizeCountTable tr:nth-child(odd) td{background: #CCC}
      .prodAddSizeCountTable tr:nth-child(even) td{background:var(--col6)}
      .prodAddSizeCountTable tr:first-child td{border-top: 1px solid #018790;background:#018790;color:#fff;}
      .prodAddSizeCountTable tr td:nth-child(1){width:40px;}
      .prodAddSizeCountTable tr td input{text-align: center;font-family:var(--ff1);font-size:15px;width:100%;border:none;padding:2px;
        background:inherit;}
      .prodAddSizeCountTable tr td input:focus{outline:none;}
      
      .prodAddFormBtn{font-size:16px;padding:5px 20px;margin-right:10px;border-radius:3px;background: #018790;
        cursor: pointer;color:#fff;transition:.3s;border:none;}
      .prodAddFormBtn[data-btn="reset"]{background:#DC4C64;}
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
          <div class="prodAddTitleTrunk pb15 ff1 bor">
            Product > Add
          </div>
          <form action="admin?page=addNewProduct" class="prodAddForm bor fg1 flex fdc h100 bor" enctype="multipart/form-data" method="post">
            <div class="prodAddFormInputTrunk fg1 flex jcsb bor"> 
              <div class="prodAddColTrunk bor" data-col="3">
                <div class="prodAddTitleCrate ff1 bor" data-title="1">
                  Size & Count
                </div>
                <table class="prodAddSizeCountTable">
                  <tr>
                    <td>SN</td>
                    <td>Count</td>
                    <td>Size</td>
                  </tr>

                  <!-- for each start -->

                  <tr>
                    <td>1</td>
                    <td>
                      <input type='text' class='prodAddSize' value="xl" placeholder='  size..' name='size1' required>
                    </td>
                    <td>
                      <input type='text' class='prodAddCount' placeholder='  count..' value="5" name='count1' required>
                    </td>
                  </tr>

                  <!-- for each end -->
                  <tr>
                    <td>2</td>
                    <td>
                      <input type='text' class='prodAddSize' value="2xl" placeholder='  size..' name='size2'>
                    </td>
                    <td>
                      <input type='text' class='prodAddCount' placeholder='  count..' value="7" name='count2'>
                    </td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>
                      <input type='text' class='prodAddSize' value="3xl" placeholder='  size..' name='size3'>
                    </td>
                    <td>
                      <input type='text' class='prodAddCount' placeholder='  count..' value="9" name='count3'>
                    </td>
                  </tr>
                  <tr>
                    <td>4</td>
                    <td>
                      <input type='text' class='prodAddSize' value="" placeholder='  size..' name='size4'>
                    </td>
                    <td>
                      <input type='text' class='prodAddCount' placeholder='  count..' value="" name='count4'>
                    </td>
                  </tr>
                  <tr>
                    <td>5</td>
                    <td>
                      <input type='text' class='prodAddSize' value="" placeholder='  size..' name='size5'>
                    </td>
                    <td>
                      <input type='text' class='prodAddCount' placeholder='  count..' value="" name='count5'>
                    </td>
                  </tr>
                  <tr>
                    <td>6</td>
                    <td>
                      <input type='text' class='prodAddSize' value="" placeholder='  size..' name='size6'>
                    </td>
                    <td>
                      <input type='text' class='prodAddCount' placeholder='  count..' value="" name='count6'>
                    </td>
                  </tr>
                  <tr>
                    <td>7</td>
                    <td>
                      <input type='text' class='prodAddSize' value="" placeholder='  size..' name='size7'>
                    </td>
                    <td>
                      <input type='text' class='prodAddCount' placeholder='  count..' value="" name='count7'>
                    </td>
                  </tr>
                  <tr>
                    <td>8</td>
                    <td>
                      <input type='text' class='prodAddSize' value="" placeholder='  size..' name='size8'>
                    </td>
                    <td>
                      <input type='text' class='prodAddCount' placeholder='  count..' value="" name='count8'>
                    </td>
                  </tr>
                  <tr>
                    <td>9</td>
                    <td>
                      <input type='text' class='prodAddSize' value="" placeholder='  size..' name='size9'>
                    </td>
                    <td>
                      <input type='text' class='prodAddCount' placeholder='  count..' value="" name='count9'>
                    </td>
                  </tr>
                  <tr>
                    <td>10</td>
                    <td>
                      <input type='text' class='prodAddSize' value="" placeholder='  size..' name='size10'>
                    </td>
                    <td>
                      <input type='text' class='prodAddCount' placeholder='  count..' value="" name='count10'>
                    </td>
                  </tr>
                </table>
              </div>

              <div class="prodAddColTrunk bor" data-col="2">
                <div class="prodAddTitleCrate ff1 bor" data-title="1">
                  Image
                </div>
                <div class="prodAddImageTrunk flexmid bor">
                  <div class="prodAddImageCrate borw br3">
                    <img src="image/tshirt2.jpg" class="prodAddImageSloth w100" alt="">
                  </div>
                </div>
              </div>

              <div class="prodAddColTrunk fg1 bor" data-col="1">
                <div class="prodAddTitleCrate ff1 bor" data-title="1">
                  Product
                </div>
                
                <!-- =============================================================================================== -->

                <table class="prodAddTextTable w100 bor">
                  <tr>
                    <td>
                      Name
                    </td>
                    <td>
                      <input type="text" class="prodAddTableInput" data-type="text" oninput="prodAddFormOnchange(event)" value="Orange sweater" placeholder="product name..." name="name" required>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Description
                    </td>
                    <td>
                      <textarea class="prodAddTableInput" data-type="textarea" oninput="prodAddFormOnchange(event)"  placeholder="product description..." name="description" required>This is a organge sweater.</textarea>
                    </td>
                  </tr>
                  <tr>
                   <td>
                     Brand
                   </td>
                   <td>
                     <input type="text" class="prodAddTableInput" data-type="text" oninput="prodAddFormOnchange(event)" value="Willw" placeholder="product brand..." name="brand" required>
                   </td>
                  </tr>
                  <tr>
                    <td>
                      Category
                    </td>
                    <td>
                      <select class="prodAddTableInput" data-type="select" oninput="prodAddFormOnchange(event)"  name="category">
                        <option value="Both">Both</option>
                        <option value="Male">male</option>
                        <option value="Female">female</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Price
                    </td>
                    <td>
                      <input type="text" class="prodAddTableInput" data-type="text" oninput="prodAddFormOnchange(event)" value="3030" placeholder="product price..." name="price" required>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Tags
                    </td>
                    <td>
                      <input type="text" class="prodAddTableInput" data-type="text" oninput="prodAddFormOnchange(event)" value="ornage, sweater" placeholder="product tags..." name="tags" required>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Image
                    </td>
                    <td>
                        <input type="file" class = "prodAddFromImageUploadBtn prodAddInpImg" oninput="prodAddFormOnchange(event)" accept="image/jpeg, image/png, image/jpg" name="file">
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
            <div class="prodAddButtonTrunk bor">
              <input type="submit" class="prodAddFormBtn" data-btn="sumbit" value="Add Product">
              <input type="reset" class="prodAddFormBtn" data-btn="reset" value="Reset">
            </div>
          </form>
        </div>
      </div>
    </div>
    <script src="../js1/script1.js"></script>
    <script>
      //var mainbody = document.querySelector(".mainbody");
      //var inrgmblock = document.querySelectorAll(".inrgmblock");

      var prodAddInpImg = document.querySelector(".prodAddInpImg");
      var prodAddImageSloth = document.querySelector(".prodAddImageSloth");

      prodAddInpImg.addEventListener('change',()=>{
        prodAddImageSloth.src = URL.createObjectURL(prodAddInpImg.files[0]);
      });
    </script>
  </body>
</html>
