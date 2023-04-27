<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Product | Focused</title>
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
      .dashInrBody{background:var(--col7);color:var(--col6);padding:1em 0 1em 2.2em;}
      .dashLinkTitleTrunk{font-size:26px;letter-spacing:.05em;}
      .dashLinkTitleCrate{font-size:20px;letter-spacing:.05em;}
      .dashLinkTitleSloth{font-family:var(--ff1);}
      .dashLinkLine{height:2px;width:90%;background: var(--col6);margin:10px 0;}

      .dashLinkTitleSloth{text-decoration: none;font-size:16px;padding:10px;letter-spacing:.1em;
        border-radius:4px 0 0 4px;color:var(--col6);margin:5px 0;}
      .dashActive{background: var(--col6);color:var(--col7);}
      /* dashcode end */

      .dashContentTrunk{padding:1em 2.2em 1em 2.2em;background:var(--col6);}
      
      .prodFocTitleTrunk{font-size:26px;letter-spacing:.05em;color:#018790;}

      .prodFocInfoTableCrate{height:78%}
      .prodFocInfoTable{border-spacing: 0px;}
      .prodFocInfoTable tr td{text-align:center;font-family:var(--ff1);font-size:16px;border:none;padding:10px 0;}
      .prodFocInfoTable tr td:first-child{padding-left: 6px;}
      .prodFocInfoTable tr td:nth-child(2){text-align:left;}
      .prodFocInfoTable tr:nth-child(odd) td{background: #CCC}
      .prodFocInfoTable tr:nth-child(even) td{background:var(--col6)}
      .prodFocInfoTable tr:first-child td{background:#018790;color:#fff;}
      .prodFocInfoTable tr td a{font-family:var(--ff1);font-size:16px;color:#000;}
      .prodFocTableText{color:var(--col7);}

      /* pagination */
      .prodFocPageSideBtn{font-family:var(--ff1);font-size:16px;padding:10px 20px;cursor: pointer;background:#ccc;
        margin:0 6px;border-radius:4px;text-decoration:none;color:#000;}
      .prodFocPageNumBtn{font-family:var(--ff1);font-style: 16px;width:40px;height:40px;display: flex;cursor: pointer;
        justify-content: center;align-items: center;margin:0 6px;background:#ccc;border-radius:4px;text-decoration:none;color:#000;}
      .prodFocActiveBtn{background: var(--col7);color:var(--col6);}
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
        <div class="inrDashContentTrunK flex fdc jcsb hw100 bor">
          <div class="prodFocTitleTrunk pb15 ff1 bor">
            Product > List
          </div>
          <div class="prodFocInfoTableCrate flex fdc bor">
            <table class="prodFocInfoTable bor">
              <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Brand</td>
                <td>Price</td>
                <td>Total count</td>
                <td>Feature</td>
                <td>Popular</td>
                <td>Update</td>
              </tr>
              <c:forEach items="${productlist}" var="prlist">
              <tr>
                <td>
                  ${prlist.id}
                </td>
                <td>
                  ${prlist.name}
                </td>
                <td>
                  ${prlist.brand}
                </td>
                <td>
                  NRS ${prlist.price}
                </td>
                <td>
                  ${prlist.discount}%
                </td>
                <td class="prodFocTableText">
                  ${prlist.focused1}
                </td>
                <td class="prodFocTableText">
                  ${prlist.focused2}
                </td>
                
                <td>
                  <a href="#">Update</a>
                </td>
              </tr>
            </c:forEach>
            </table>
          </div>
          <div class="prodFocPaginationTrunk flex jcc pb20 bor">
            <%
                int pageinationLen = (int) session.getAttribute("paginationLenSess");
                int paginationPrev=1,paginationNext=pageinationLen;
                
                String activePageIdStr = (String) session.getAttribute("activePageId");
                int activePageId = 1;
                if(activePageIdStr!=null){activePageId = Integer.parseInt(activePageIdStr);}
                
                if(activePageId > 1){
                    paginationPrev = activePageId-1;
                }
                if(activePageId < pageinationLen){
                    paginationNext = activePageId+1;
                }
            %>
            <a href="admin?page=productFocusedPage&id=<%=paginationPrev%>" class="prodFocPageSideBtn bor" data-side="left">Prev</a>

            <div class="prodListPageMidBtnTrunk flex bor">
                <c:forEach var = "pageId" begin = "1" end = "${paginationLen}">
                    <%
                        int pageId = (int) pageContext.getAttribute("pageId");
                        String activePageStr = "";
                        if(activePageId == pageId){activePageStr = "prodFocActiveBtn";}
                    %>
<!--                    prodListActiveBtn-->
                    <a href="admin?page=productFocusedPage&id=${pageId}" class="prodFocPageNumBtn bor <%=activePageStr%>">${pageId} </a>
                </c:forEach>
            </div>

            <a href="admin?page=productFocusedPage&id=<%=paginationNext%>" class="prodFocPageSideBtn bor" data-side="right">Next</a>
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
