package Controller;

import Model.Product;
import Model.SizeCount;
import Model.User;
import Service.ProductService;
import Service.UserService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "adminControl", urlPatterns = {"/admin"})
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 10,      // 10 MB
  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class adminControl extends HttpServlet {@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String page = request.getParameter("page");
        out.print("Page = "+page+"</br>");
        
        if(page.equalsIgnoreCase("productAddPage")){
            out.print("prd add </br>");
            RequestDispatcher rd = request.getRequestDispatcher("dashboard/productAddPage.jsp");
            rd.forward(request,response);
        }
        else if(page.equalsIgnoreCase("productListPage") || page.equalsIgnoreCase("productFocusedPage")){
            out.print("prd list </br>");
            String idd = request.getParameter("id");
            int id = 1;
            if(idd==null){
                idd="1";
            }
            else{
                id = Integer.parseInt(idd);
            }
            int pagination = new ProductService().getPagination();
            int intId = pagination / 10;
            int doubleId = pagination % 10;
            if(doubleId > 0){intId++;}
            
            List<Product> prList = new ProductService().getProductListByLength(id);
            out.println("size = "+prList.size()+"<br/>");
            
            request.setAttribute("paginationLen",intId);
            
            HttpSession sess = request.getSession();
            sess.setAttribute("paginationLenSess",intId);
            
            HttpSession sess1 = request.getSession();
            sess1.setAttribute("activePageId",idd);
            
            request.setAttribute("productlist", prList);
            
            if(page.equalsIgnoreCase("productListPage")){
                RequestDispatcher rd = request.getRequestDispatcher("dashboard/productListPage.jsp");
                rd.forward(request,response);
            }
            else if(page.equalsIgnoreCase("productFocusedPage")){
                out.print("prd focused </br>");
                RequestDispatcher rd = request.getRequestDispatcher("dashboard/productFocusedPage.jsp");
                rd.forward(request,response);
            }
        }
        else if(page.equalsIgnoreCase("productDetailsPage")){
            String idd = request.getParameter("id");
            int id=0;
            if(idd!=null){ id = Integer.parseInt(idd); }
            out.print("prd details id= "+idd+"</br>");
            
            Product pr = new Product();
            pr = new ProductService().getProductDetail(id);
            
            List<SizeCount> scList = new ProductService().getSizeCountForPorduct(id);
            request.setAttribute("productdetail", pr);
            request.setAttribute("productsizecount", scList);
            
            RequestDispatcher rd = request.getRequestDispatcher("dashboard/productDetailsPage.jsp");
            rd.forward(request,response);
        }
        else if(page.equalsIgnoreCase("productEditPage")){
            String idd = request.getParameter("id");
            int id=0;
            if(idd!=null){ id = Integer.parseInt(idd); }
            out.print("prd edit id= "+idd+"</br>");
            
            Product pr = new Product();
            pr = new ProductService().getProductDetail(id);
            
            List<SizeCount> scList = new ProductService().getSizeCountForPorduct(id);
            request.setAttribute("productdetail", pr);
            request.setAttribute("productsizecount", scList);
            
            RequestDispatcher rd = request.getRequestDispatcher("dashboard/productEditPage.jsp");
            rd.forward(request,response);
        }
        
        else if(page.equalsIgnoreCase("salesListPage")){
            out.print("sales list </br>");
            RequestDispatcher rd = request.getRequestDispatcher("dashboard/salesListPage.jsp");
            rd.forward(request,response);
        }
        
        
        
        
        else if(page.equalsIgnoreCase("addNewProduct")){
            out.print("addNewProduct <br/>");
            
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            String uploadPath = "D:\\AllFile1\\JavaCode\\Willow2\\src\\main\\webapp\\image\\upload\\pics";
            String imgPath = "image\\upload\\pics";
            String filePathName = uploadPath + fileName;
            imgPath = imgPath + fileName;
            for (Part part : request.getParts()) {
              part.write(filePathName);
            }
            out.print("Data inserted 0<br/><br/>");
            try{
                Product pr = new Product();
                pr.setName(request.getParameter("name"));
                pr.setDescription(request.getParameter("description"));
                pr.setImage(imgPath);
                pr.setCategory(request.getParameter("category"));
                pr.setPrice(Integer.parseInt(request.getParameter("price")));
                pr.setTags(request.getParameter("tags"));
                pr.setBrand(request.getParameter("brand"));
                out.print(pr.getName()+"<br/>");
                out.print(pr.getDescription()+"<br/>");
                out.print(pr.getImage()+"<br/>");
                out.print(pr.getCategory()+"<br/>");
                out.print(pr.getPrice()+"<br/>");
                out.print(pr.getTags()+"<br/>");
                out.print(pr.getBrand()+"<br/>");
                new ProductService().insertProduct(pr);
                out.print("Data inserted 1<br/><br/>");
                
                List<SizeCount> sclist = new ArrayList<>();
                for(int a=1;a<=10;a++){
                    SizeCount sc = new SizeCount();
                    String sizeStr = request.getParameter("size"+a);
                    String countStr = request.getParameter("count"+a);
                    if(!sizeStr.equals("") && !countStr.equals("")){
                        sc.setSize(sizeStr);
                        sc.setCount(Integer.parseInt(countStr));
                        sclist.add(sc);
                    }
//                    out.print(a+" "+sizeStr+" "+countStr+" "+"sclist size= "+sclist.size()+"<br/>");
                }
                for(SizeCount sc: sclist){
                    out.print(sc.getSize()+" "+sc.getCount()+"<br/>");
                    new ProductService().insertSizeCountForPorduct(sc);
                }
                out.print("Data inserted 2<br/><br/>");
            }
            catch(Exception e){
                out.print("ERROR: "+e);
            }
            RequestDispatcher rd = request.getRequestDispatcher("admin?page=productListPage");
            rd.forward(request,response); 
        }
        else if(page.equalsIgnoreCase("editProduct")){
            out.print("edittt<br/>");
            int id = Integer.parseInt(request.getParameter("id"));
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            String imgPath = "image\\upload\\pics";
            if(fileName.equals("")){
                imgPath = request.getParameter("hiddenimage");
            }
            else{
                String uploadPath = "D:\\AllFile5\\JavaCode\\Willow1\\src\\main\\webapp\\image\\upload\\pics";
                String filePathName = uploadPath + fileName;
                imgPath = imgPath + fileName;
                for (Part part : request.getParts()) {
                  part.write(filePathName);
                }
            }
            try{
                Product pr = new Product();
                pr.setName(request.getParameter("name"));
                pr.setDescription(request.getParameter("description"));
                pr.setBrand(request.getParameter("brand"));
                pr.setCategory(request.getParameter("category"));
                pr.setPrice(Integer.parseInt(request.getParameter("price")));
                pr.setDiscount(Integer.parseInt(request.getParameter("discount")));
                pr.setTags(request.getParameter("tags"));
                pr.setReleasedate(request.getParameter("releasedate"));
                String visibilityStr = request.getParameter("visibility");
                String focusedStr1 = request.getParameter("focused1");
                String focusedStr2 = request.getParameter("focused2");
                boolean visibilityBool = false;
                boolean focusedBool1 = false;
                boolean focusedBool2 = false;
                if(visibilityStr.equalsIgnoreCase("true")){visibilityBool = true;}
                if(focusedStr1!=null){focusedBool1 = true;}
                if(focusedStr2!=null){focusedBool2 = true;}
                pr.setVisibility(visibilityBool);
                pr.setFocused1(focusedBool1);
                pr.setFocused2(focusedBool2);
                pr.setImage(imgPath);
                
                out.print("Name = "+pr.getName()+"<br/>");
                out.print("Description = "+pr.getDescription()+"<br/>");
                out.print("Brand = "+pr.getBrand()+"<br/>");
                out.print("Category = "+pr.getCategory()+"<br/>");
                out.print("Price = "+pr.getPrice()+"<br/>");
                out.print("Discount = "+pr.getDiscount()+"<br/>");
                out.print("Tags = "+pr.getTags()+"<br/>");
                out.print("Releasedate = "+pr.getReleasedate()+"<br/>");
                out.print("Visibility = "+pr.isVisibility()+"<br/>");
                out.print("Focused1 = "+pr.isFocused1()+"<br/>");
                out.print("Focused2 = "+pr.isFocused2()+"<br/>");
                out.print("Image = "+pr.getImage()+"<br/>");
//                try{
//                   new ProductService().updateProductById(id,pr); 
//                }
//                catch(SQLException e){
//                    out.print("ERRX: "+e);
//                }
                out.print("Data Updated 1<br/><br/>");
                
                List<SizeCount> sclist = new ArrayList<>();
                for(int a=1;a<=10;a++){
                    SizeCount sc = new SizeCount();//hiddenid
                    String hiddenIdStr  = request.getParameter("hiddenid"+a);
                    int hiddenId = 0;
                    if(hiddenIdStr!=null){ hiddenId = Integer.parseInt(hiddenIdStr); }
                    String sizeStr = request.getParameter("size"+a);
                    String countStr = request.getParameter("count"+a);
                    if(!sizeStr.equals("") && !countStr.equals("")){
                        sc.setSize(sizeStr);
                        sc.setIdd(hiddenId);
                        sc.setCount(Integer.parseInt(countStr));
                        sclist.add(sc);
                    }
                    out.print(a+" "+sizeStr+" "+countStr+" "+"sclist size= "+sclist.size()+"<br/>");
                }
                for(SizeCount sc: sclist){
                    out.print(sc.getSize()+" "+sc.getCount());
                    new ProductService().updateProductSizeCountById(sc);
                }
                out.print("Data Updated 2<br/><br/>");
                
                RequestDispatcher rd = request.getRequestDispatcher("admin?page=productListPage&id=1");
                rd.forward(request,response); 
            }
            catch(Exception e){
                out.print("ERROR: "+e);
            }
        }
        else if(page.equalsIgnoreCase("productDelete")){
            int id = Integer.parseInt(request.getParameter("id"));
            new ProductService().deleteProduct(id);
            response.sendRedirect("admin?page=productListPage");
        }
        
        
        
//        CUSTOMER ====================================================================
        else if(page.equalsIgnoreCase("customerListPage")){
            out.print("customer list </br>");
            String idd = request.getParameter("id");
            out.print("hiii");
            int id = 1;
            if(idd == null){
                idd="1";
            }
            else{
                id = Integer.parseInt(idd);
            }
            int pagination = new UserService().getPagination();
            int intId = pagination / 10;
            int doubleId = pagination % 10;
            if(doubleId > 0){intId++;}
            
            List<User> userList = new UserService().getCustomerListByLength(id);
            out.println("size = "+userList.size()+id+"<br/>");
            
            request.setAttribute("paginationLen",intId);
            
            HttpSession sess = request.getSession();
            sess.setAttribute("paginationLenSess",intId);
            
            HttpSession sess1 = request.getSession();
            sess1.setAttribute("activePageId",idd);
            
            request.setAttribute("customerlist", userList);
            
            RequestDispatcher rd = request.getRequestDispatcher("dashboard/customerListPage.jsp");
            rd.forward(request,response);
        }
        
        
        else{
            out.print("This page value dosent exist");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }
}
