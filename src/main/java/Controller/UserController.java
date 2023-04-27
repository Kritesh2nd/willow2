package Controller;

import Hashing.HashPassword;
import Model.Product;
import Model.Purchased;
import Model.Review;
import Model.SizeCount;
import Model.User;
import Service.ProductService;
import Service.Support;
import Service.UserService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class UserController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String page = request.getParameter("page");
        out.print("Page "+page+"</br>");
        
        if(page.equalsIgnoreCase("index")){
             out.print("hello");
             try{
            List<Product> featureList = new ProductService().getThreeTypeProduct("feature");
            List<Product> popularList = new ProductService().getThreeTypeProduct("popular");
            
            out.print("featurepl size = "+featureList.size()+"<br/>");
            request.setAttribute("featurePList", featureList);
            request.setAttribute("popularPList", popularList);

            HttpSession sess = request.getSession();
            sess.setAttribute("plcheck","plcheck");
            out.print("plcheck");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request,response);
             }
             catch(Exception e){
                 out.print("ERX:"+e);
             }
        }
        else if(page.equalsIgnoreCase("signinup")){
            RequestDispatcher rd = request.getRequestDispatcher("pages/signinup.jsp");
            rd.forward(request,response);
        }
        else if(page.equalsIgnoreCase("newUser")){
            User user = new User();
            user.setName(request.getParameter("name"));
            user.setEmail(request.getParameter("email"));
            user.setPassword(HashPassword.hashThisPass(request.getParameter("password")));
            user.setPhnumber(request.getParameter("number"));
            new UserService().insertUser(user);
            out.print("Data inserted");
            RequestDispatcher rd = request.getRequestDispatcher("user?page=signedin");
            rd.forward(request,response);
        }
        else if(page.equalsIgnoreCase("signedin")){
            String email = request.getParameter("email");
            String password = HashPassword.hashThisPass(request.getParameter("password"));
            out.print("name "+email+"<br/>");
            out.print("password "+password+"<br/>");
            User user = new UserService().getSingleUserBy(email, password);
            if(user != null){
                int cartCount = new UserService().cartCount(user.getId());
                out.print("user.getId() "+user.getId());
                HttpSession sess = request.getSession();
                sess.setAttribute("username",user.getName());
                
                String idStr = String.valueOf(user.getId());
                HttpSession sess1 = request.getSession();
                sess1.setAttribute("userid",idStr);
                
                HttpSession sess2 = request.getSession();
                sess2.setAttribute("userObj",user);
                
//                request.setAttribute("cartCount",cartCount);
//                HttpSession sess2 = request.getSession();
//                sess2.setAttribute("cartCount",cartCount);
                
                if(user.getEmail().equals("kritesh@willow.com")){
                    RequestDispatcher rd = request.getRequestDispatcher("admin?page=productAddPage");
                    rd.forward(request,response);
                }
                else{
                    RequestDispatcher rd = request.getRequestDispatcher("user?page=index");
                    rd.forward(request,response);
                }                
            }
            else{
                out.println("incorrect");
                RequestDispatcher rd = request.getRequestDispatcher("user?page=index");
                rd.forward(request,response);
            }
        }
        else if(page.equalsIgnoreCase("signout")){
            HttpSession sess = request.getSession(false);
            sess.invalidate();
            
            RequestDispatcher rd = request.getRequestDispatcher("user?page=index");
            rd.forward(request,response);
        }
        
        
        
        else if(page.equalsIgnoreCase("search")){
            String searchval = request.getParameter("search");
            out.print("ssearch value = "+searchval+"<br/>");
            request.setAttribute("searchval", searchval);
            
            List<Product> prList = new ProductService().getProductListByName(searchval);
            out.println("size = "+prList.size()+"<br/>");
            
            request.setAttribute("searchResultList", prList);
            
            HttpSession sess1 = request.getSession();
            sess1.setAttribute("searchResultList",prList);
            
            try{
                RequestDispatcher rd = request.getRequestDispatcher("pages/searchResultPage.jsp");
                rd.forward(request,response);
            }
            catch(Exception e){
                out.print("ERROX: "+e);
            }
        }
        else if(page.equalsIgnoreCase("productDetailsPage")){
            out.print("prd details <br/>");
            
            String idd = request.getParameter("id");
            int id=0;
            if(idd!=null){ id = Integer.parseInt(idd); }
            out.print("prd details id= "+idd+"</br>");
            
            Product pr = new Product();
            pr = new ProductService().getProductDetail(id);
            
            List<SizeCount> scList = new ProductService().getSizeCountForPorduct(id);
            request.setAttribute("productdetail", pr);
            request.setAttribute("productsizecount", scList);
            
            
            
            out.print("size "+scList.size());
            
            RequestDispatcher rd = request.getRequestDispatcher("pages/productDetailsPage.jsp");
            rd.forward(request,response);
        }
        else if(page.equalsIgnoreCase("addToCart")){
            out.print("add to cart <br/>");
            int uid = Integer.parseInt(request.getParameter("userid"));
            int pid = Integer.parseInt(request.getParameter("productid"));
            String size = request.getParameter("size");
            out.print(uid+" "+pid+" "+size+"<br/>");
            if(uid==0){
                RequestDispatcher rd = request.getRequestDispatcher("pages/signinup.jsp");
                rd.forward(request,response);
            }
            else{
                new UserService().insertCart(uid,pid,size);
                out.print("Data inserted <br/>");
                
                RequestDispatcher rd = request.getRequestDispatcher("user?page=productDetailsPage&id="+pid);
                rd.forward(request,response);
            }
        }
        else if(page.equalsIgnoreCase("checkoutPage")){
            out.print("check out page<br/>");
            //first get product data from cart using join
            int userId = Integer.parseInt(request.getParameter("id"));
            
            out.print("userid="+userId+"<br/>");
            
            if(userId==0){
                RequestDispatcher rd = request.getRequestDispatcher("pages/signinup.jsp");
                rd.forward(request,response);
            }
            else{
                List<Product> cartProductList = new UserService().getCartDataByUserId(userId);
                request.setAttribute("cartProductList", cartProductList);
                out.print("cartProductList="+cartProductList.size()+"<br/>");

                RequestDispatcher rd = request.getRequestDispatcher("pages/checkoutPage.jsp");
                rd.forward(request,response);
            }
        }
        else if(page.equalsIgnoreCase("removeCartProduct")){
            out.print("remov cart product page<br/>");
            //first get product data from cart using join
            int prdId = Integer.parseInt(request.getParameter("pid"));
            int userId = Integer.parseInt(request.getParameter("id"));
            out.print("prdId="+prdId+"<br/>");
            new UserService().removeCartItem(prdId);
            RequestDispatcher rd = request.getRequestDispatcher("user?page=checkoutPage&id="+userId);
            rd.forward(request,response);
        }
        else if(page.equalsIgnoreCase("insertReview")){
            out.print("insert review page<br/>");
            Review rev = new Review();
            rev.setPid(Integer.parseInt(request.getParameter("productid")));
            rev.setUid(Integer.parseInt(request.getParameter("userid")));
            rev.setStar(Integer.parseInt(request.getParameter("starvalue")));
            rev.setReview(request.getParameter("review"));
            rev.setDate(new Support().getDate());
            
            out.print(rev.getPid()+"<br/>");
            out.print(rev.getUid()+"<br/>");
            out.print(rev.getStar()+"<br/>");
            out.print(rev.getReview()+"<br/>");
            out.print(rev.getDate()+"<br/>");
            
            new UserService().insertReview(rev);
            
            out.print("Review inserted");
            response.sendRedirect("user?page=productDetailsPage&id="+rev.getPid());
        }
        else if(page.equalsIgnoreCase("checkout")){
            out.print("checkout page <br/> ");
            
            String userIdStr = request.getParameter("userid");
            int userid=0;
            if(userIdStr!=null){
                userid = Integer.parseInt(userIdStr);
            }

            List<User> cartlist = new UserService().getCartListByUserId(userid);
            int cartSize = cartlist.size();
//            List<Purchased> prlist = new ArrayList<>();
            try{
            for(int a=1;a<=cartSize;a++){
                out.print(a+"<br/>");
                Purchased pr = new Purchased();
                pr.setName(request.getParameter("name"+a));
                pr.setSize(request.getParameter("size"+a));
                pr.setUid(userid);
                pr.setDate(new Support().getDate());
//                pr.setPrice(Integer.parseInt(request.getParameter("price"+a)));
                
                out.print(pr.getName()+"<br/>");
                out.print(pr.getSize()+"<br/>");
                out.print(pr.getPrice()+"<br/>");
                out.print(pr.getUid()+"<br/>");
                new UserService().insertCartOrder(pr);
                out.print("Data inserted "+pr.getName());
            }
            }
            catch(Exception e){
                out.print("ERX: "+e);
            }
            response.sendRedirect("user?page=purchasedPage&id="+userid);
//            RequestDispatcher rd = request.getRequestDispatcher("user?page=purchasedPage");
//            rd.forward(request,response);
        }
        else if(page.equalsIgnoreCase("purchasedPage")){
            out.print("purchasedPage pp <br/>");
            
            String userIdStr = request.getParameter("id");
            int userid=0;
            if(userIdStr!=null){
                userid = Integer.parseInt(userIdStr);
            }
            out.print(userid);
            try{
            List<Purchased> prList = new UserService().cartOrderList(userid);
            
            request.setAttribute("purchasedList", prList);
            
            out.print("size "+prList.size());
            }
            catch(Exception e){
                out.print(e);
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("pages/purchasedPage.jsp");
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
