package Service;

import DBConnection.DBConnection;
import Model.Product;
import Model.Purchased;
import Model.Review;
import Model.User;
import Support.index;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    public void insertUser(User usr){
        String query = "insert into userinfo(name,email,address,dob,wishlist,cart,mostvisited,password,number,maxspent,primecount) values(?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ps.setString(1,usr.getName());
            ps.setString(2,usr.getEmail());
            ps.setString(3,usr.getAddress());
            ps.setString(4,usr.getDob());
            ps.setString(5,usr.getWishlist());
            ps.setString(6,usr.getCart());
            ps.setString(7,usr.getMostvisited());
            ps.setString(8,usr.getPassword());
            ps.setString(9,usr.getPhnumber());
            ps.setInt(10,usr.getMaxspent());
            ps.setInt(11,usr.getPrimecount());
            
            ps.execute();
        }
        catch(SQLException e){
            e.printStackTrace();
            System.out.println("Insert User Error : "+e);
        }
    }
    public User getSingleUserBy(String email, String password){
        User us = null;
        String query = "select * from userinfo where email=? and password=?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ps.setString(1,email);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                us = new User();
                us.setId(rs.getInt("id"));
                us.setName(rs.getString("name"));
                us.setEmail(rs.getString("email"));
                us.setAddress(rs.getString("address"));
                us.setPassword(rs.getString("password"));
                us.setPhnumber(rs.getString("number"));
            }
        }
         catch(SQLException e){
            e.printStackTrace();
        }
        return us;
    }
    public List<User> getCustomerList(){
        List<User> userlist = new ArrayList<>();
        String query = "select * from userinfo";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                User pr = new User();
                pr.setId(rs.getInt("id"));
                pr.setName(rs.getString("name"));
                pr.setEmail(rs.getString("email"));
                pr.setAddress(rs.getString("address"));
                pr.setPhnumber(rs.getString("number"));
                userlist.add(pr);
            }
        }
         catch(SQLException e){
            e.printStackTrace();
             System.out.println("Error: "+e);
        }
        return userlist;
    }
    public List<User> getCustomerListByLength(int len){
        List<User> userlist = new ArrayList<>();
        int start = ((len-1)*10)+1;
        int stop = len*10;
        String query = "select * from userinfo";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ResultSet rs = ps.executeQuery();
            int count=1;
            while(rs.next()){
                User pr = new User();
                pr.setId(rs.getInt("id"));
                pr.setName(rs.getString("name"));
                pr.setEmail(rs.getString("email"));
                pr.setAddress(rs.getString("address"));
                pr.setPhnumber(rs.getString("number"));
                if(count>=start && count<=stop){
                    userlist.add(pr);
                }
                count++;
            }
        }
         catch(SQLException e){
            e.printStackTrace();
             System.out.println("Error: "+e);
        }
        return userlist;
    }
    public List<Purchased> getSalesListByLength(int len){
        List<Purchased> purList = new ArrayList<>();
        int start = ((len-1)*10)+1;
        int stop = len*10;
        String query = "select * from purchased";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ResultSet rs = ps.executeQuery();
            int count=1,i=1;
            while(rs.next()){
                Purchased pr = new Purchased();
                pr.setId(i);
                pr.setUid(rs.getInt("uid"));
                pr.setPrice(rs.getInt("price"));
                pr.setStage(rs.getInt("stage"));
                pr.setName(rs.getString("name"));                
                pr.setBrand(rs.getString("brand"));                
                pr.setSize(rs.getString("size"));
                pr.setDate(rs.getString("date"));
                pr.setReview(rs.getString("review"));
                
                if(count>=start && count<=stop){
                    purList.add(pr);
                    i++;
                }
                count++;
            }
        }
         catch(SQLException e){
            e.printStackTrace();
             System.out.println("Error: "+e);
        }
        return purList;
    }
    public int getPagination(){
        int lastId=1;
        String query = "select*from userinfo";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                lastId++;
            }
        }
         catch(SQLException e){
            e.printStackTrace();
        }
        return lastId;
    }
    public void insertCart(int uid,int pid,String size){
        String query = "insert into cart(uid,pid,size) values(?,?,?)";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ps.setInt(1,uid);
            ps.setInt(2,pid);
            ps.setString(3,size);
            ps.execute();
        }
        catch(SQLException e){
            e.printStackTrace();
            System.out.println("Insert User Error : "+e);
        }
    }
    public int cartCount(int id){
        int cartCount = 0;
        String query = "select*from cart where id=?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                cartCount++;
            }
        }
         catch(SQLException e){
            e.printStackTrace();
        }
        return cartCount;
    }

    public List<User> getCartListByUserId(int id){
        List<User> userlist = new ArrayList<>();
        String query = "select * from cart where uid=?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                User us = new User();
                us = new User();
                us.setUid(rs.getInt("uid"));
                us.setPid(rs.getInt("pid"));
                us.setSize(rs.getString("size"));
                userlist.add(us);
            }
        }
         catch(SQLException e){
            e.printStackTrace();
             System.out.println("Error: "+e);
        }
        return userlist;
    }
    
    public List<Product> getCartDataByUserId(int id){
        List<Product> prdList = new ArrayList<>();
        String query = "select * from cart as A inner join productinfo as B on A.pid = B.id where A.uid=?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product pr = new Product();
                pr = new Product();
                pr.setId(rs.getInt("id"));
                pr.setName(rs.getString("name"));
                pr.setDescription(rs.getString("description"));
                pr.setImage(rs.getString("image"));
                pr.setBrand(rs.getString("brand"));
                pr.setCategory(rs.getString("category"));
                pr.setPrice(rs.getInt("price"));
                pr.setDiscount(rs.getInt("discount"));
                pr.setDiscountedprice((int) new index().getPercentOf(pr.getDiscount(),pr.getPrice()));
                pr.setTags(rs.getString("tags"));
                pr.setReleasedate(rs.getString("releasedate"));
                pr.setSize(rs.getString("size"));
                prdList.add(pr);
            }
        }
         catch(SQLException e){
            e.printStackTrace();
             System.out.println("Error: "+e);
        }
        return prdList;
    }
    
    public void removeCartItem(int id){
        String query = "delete from cart where id = ?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ps.setInt(1,id);
            ps.execute();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    public void insertReview(Review rev){
        String query = "insert into review(uid,pid,star,review,date) values(?,?,?,?,?)";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ps.setInt(1,rev.getUid());
            ps.setInt(2,rev.getPid());
            ps.setInt(3,rev.getStar());
            ps.setString(4,rev.getReview());
            ps.setString(5,rev.getDate());
            ps.execute();
        }
        catch(SQLException e){
            e.printStackTrace();
            System.out.println("Insert User Error : "+e);
        }
    }
    public List<Review> getReviewListById(int prdId){
        List<Review> reviewList = new ArrayList<>();
        String query = "select * from review where pid=?";
        query = "select * from cart as A inner join productinfo as B on A.pid = B.id where A.uid=?";
        query = "select * from review as A inner join userinfo as B on A.uid = B.id where pid=?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ps.setInt(1,prdId);
            ResultSet rs = ps.executeQuery();
            int count=1;
            while(rs.next()){
                Review r = new Review();
                r.setId(rs.getInt("id"));
                r.setUid(rs.getInt("uid"));
                r.setPid(rs.getInt("pid"));
                r.setStar(rs.getInt("star"));
                r.setReview(rs.getString("review"));
                r.setDate(rs.getString("date"));
                r.setName(rs.getString("name"));
                reviewList.add(r);
            }
        }
         catch(SQLException e){
            e.printStackTrace();
             System.out.println("Error: "+e);
        }
        return reviewList;
    }
     public void insertCartOrder(Purchased prd){
        String query = "insert into purchased(uid,price,stage,name,brand,size,date,review) values(?,?,?,?,?,?,?,?)";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ps.setInt(1,prd.getUid());
            ps.setInt(2,prd.getPrice());
            ps.setInt(3,prd.getStage());
            ps.setString(4,prd.getName());
            ps.setString(5,prd.getBrand());
            ps.setString(6,prd.getSize());
            ps.setString(7,prd.getDate());
            ps.setString(8,prd.getReview());
            ps.execute();
        }
        catch(SQLException e){
            e.printStackTrace();
            System.out.println("Insert User Error : "+e);
        }
    }
    public List<Purchased> cartOrderList(int id){
        List<Purchased> prList = new ArrayList<>();
        String query = "select * from purchased where uid=?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Purchased pr = new Purchased();
                pr.setId(rs.getInt("id"));
                pr.setUid(rs.getInt("uid"));
                pr.setPrice(rs.getInt("price"));
                pr.setStage(rs.getInt("stage"));
                pr.setName(rs.getString("name"));                
                pr.setBrand(rs.getString("brand"));                
                pr.setSize(rs.getString("size"));
                pr.setDate(rs.getString("date"));
                pr.setReview(rs.getString("review"));
                
                prList.add(pr);
            }
        }
         catch(SQLException e){
            e.printStackTrace();
             System.out.println("Error: "+e);
        }
        return prList;
    }
    public static void main(String[] args) {
        UserService us = new UserService();
        List<Product> userlist = us.getCartDataByUserId(4);
        System.out.println("userlist "+userlist+" |||| "+userlist.size());
    }
}
