package Controller;

import Hashing.HashPassword;
import Model.Product;
import Model.SizeCount;
import Model.User;
import Service.ProductService;
import Service.UserService;
import java.io.IOException;
import java.io.PrintWriter;
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
                HttpSession sess1 = request.getSession();
                sess1.setAttribute("userid",user.getId());
                
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
            out.print(size+"<br/>");
            new UserService().insertCart(uid,pid,size);
            out.print("Data inserted");
            RequestDispatcher rd = request.getRequestDispatcher("pages/checoutPage.jsp");
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
