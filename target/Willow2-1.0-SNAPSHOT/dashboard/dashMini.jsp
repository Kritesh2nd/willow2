<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String pageVal = request.getParameter("page");
String prdAddCss="",prdListCss="",prdFocusedCss="",custListCss="",salesListCss="";
if(pageVal.equals("productAddPage")){prdAddCss = "dashActive";}
else if(pageVal.equals("productListPage")){prdListCss = "dashActive";}
else if(pageVal.equals("productFocusedPage")){prdFocusedCss = "dashActive";}
else if(pageVal.equals("customerListPage")){custListCss = "dashActive";}
else if(pageVal.equals("salesListPage")){salesListCss = "dashActive";}
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Dashboard | Mini</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/stylex.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/stylex.css">
    <style>
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
    </style>
  </head>
  <body>
    <div class="dashInrBody hw100">
      <div class="dashLinkTitleTrunk ff1 pb5 bor">
        Dashboard
      </div>
      <div class="dashLinkLine "></div>
      <div class="dashLinkTitleCrate ff1 ptb7 bor">
        Product
      </div>
      <a href="admin?page=productAddPage" class="dashLinkTitleSloth flex bor <%=prdAddCss%>">
        Add
      </a>
      <a href="admin?page=productListPage" class="dashLinkTitleSloth flex bor <%=prdListCss%>">
        List
      </a>
      <a href="admin?page=productFocusedPage" class="dashLinkTitleSloth flex bor <%=prdFocusedCss%>">
        Focused
      </a>
      <div class="dashLinkLine "></div>
      <div class="dashLinkTitleCrate ff1 ptb7 pt20 bor">
        Customer
      </div>
      <a href="admin?page=customerListPage" class="dashLinkTitleSloth flex bor <%=custListCss%>">
        Customer List
      </a>

      <div class="dashLinkLine"></div>
      <div class="dashLinkTitleCrate ff1 ptb7 pt20 bor">
        Sales
      </div>
      <a href="admin?page=salesListPage" class="dashLinkTitleSloth flex bor <%=salesListCss%>">
        Sales List
      </a>

      <div class="dashLinkLine "></div>
      <div class="dashLinkTitleCrate ff1 ptb7 pt20 bor">
        Setting
      </div>
      <a href="user?page=signout" class="dashLinkTitleSloth flex bor">
        Log out
      </a>

    </div>
  </body>
</html>
