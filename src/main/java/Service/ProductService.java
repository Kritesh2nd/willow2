package Service;

import DBConnection.DBConnection;
import Model.Product;
import Model.SizeCount;
import Support.index;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    public List<Product> getThreeTypeProduct(String typequery){
        typequery = "feature";
        List<Product> productlist = new ArrayList<>();
        String query = "select*from productinfo";
        String queryForFeature = "select*from productinfo where focused1 = true";
        String queryForPopular = "select*from productinfo where focused2 = true";
        String queryForNewproduct = "select*from productinfo where focused3 = true";
        
        if(typequery.equals("feature")){query = queryForFeature;}
        else if(typequery.equals("popular")){query = queryForPopular;}
        else if(typequery.equals("newproduct")){query = queryForNewproduct;}
        PreparedStatement ps = new DBConnection().getStatement(query);
        
        try{
            int count = 1;
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
                
                if(count < 6){productlist.add(pr);count++;}
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return productlist;
    }
    public void insertProduct(Product pr){
        String query = "insert into productinfo(name,description,image,brand,category,price,discount,tags,totalcount,releasedate,visibility) values (?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ps.setString(1,pr.getName());
            ps.setString(2,pr.getDescription());
            ps.setString(3,pr.getImage());
            ps.setString(4,pr.getBrand());
            ps.setString(5,pr.getCategory());
            ps.setInt(6,pr.getPrice());
            ps.setInt(7,pr.getDiscount());
            ps.setString(8,pr.getTags());
            ps.setInt(9,pr.getTotalcount());
            ps.setString(10,new index().getDate());
            ps.setBoolean(11,pr.isVisibility());
            ps.execute();
        }
        catch(SQLException e){
            e.printStackTrace();
            System.out.println("Insert User Error : "+e);
        }
    }
    public void insertSizeCountForPorduct(SizeCount scc){
        String query = "insert into sizecount(pid,size,count) values(?,?,?)";
        PreparedStatement ps = new DBConnection().getStatement(query);
         try{
            ps.setInt(1,getProductinfoLastid());
            ps.setString(2,scc.getSize());
            ps.setInt(3,scc.getCount());
            ps.execute();
        }
        catch(SQLException e){
            e.printStackTrace();
            System.out.println("Insert User Error : "+e);
        }
    }
    public int getProductinfoLastid(){
        int lastId=1;
        String query = "select*from productinfo";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                lastId = rs.getInt("id");
            }
        }
         catch(SQLException e){
            e.printStackTrace();
        }
        return lastId;
    }
    
    public int getPagination(){
        int lastId=1;
        String query = "select*from productinfo";
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
    public List<Product> getProductList(){
        List<Product> productlist = new ArrayList<>();
        String query = "select * from productinfo";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product pr = new Product();
                pr.setId(rs.getInt("id"));
                pr.setName(rs.getString("name"));
                pr.setBrand(rs.getString("brand"));
                pr.setPrice(rs.getInt("price"));
                pr.setDiscount(rs.getInt("discount"));
//                pr.setAvilablesize(getAvailableSizeForPorduct(pr.getId()));
//                pr.setTotalcount(getProductMaxCount(pr.getId()));
                pr.setVisibility(rs.getBoolean("visibility"));
                pr.setFocused1(rs.getBoolean("focused1"));
                pr.setFocused2(rs.getBoolean("focused2"));
                pr.setFocused3(rs.getBoolean("focused3"));
                productlist.add(pr);
            }
        }
         catch(SQLException e){
            e.printStackTrace();
             System.out.println("Error: "+e);
        }
        return productlist;
    }
    public List<Product> getProductListByName(String name){
        List<Product> productlist = new ArrayList<>();
        System.out.println("name "+name);
        String query = "select * from productinfo";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product pr = new Product();
                pr.setId(rs.getInt("id"));
                pr.setName(rs.getString("name"));
                pr.setBrand(rs.getString("brand"));
                pr.setPrice(rs.getInt("price"));
                pr.setDiscount(rs.getInt("discount"));
                pr.setImage(rs.getString("image"));
                pr.setTags(rs.getString("tags"));
                pr.setReleasedate(rs.getString("releasedate"));
                
                String tagsStr = pr.getTags().replaceAll(" ", "");
                String[] tagsArr = null;
                tagsArr = tagsStr.split(",");
                for(int a=0;a<tagsArr.length;a++){
                    System.out.print(tagsArr[a]+" ");
                    if(name.equals(tagsArr[a])){
                        productlist.add(pr);
                        break;
                    }
                }
                System.out.println("");
//                System.out.println("tags "+pr.getTags());
            }
        }
         catch(SQLException e){
            e.printStackTrace();
             System.out.println("Error: "+e);
        }
        return productlist;
    }
    public List<Product> getProductListByLength(int len){
        List<Product> productlist = new ArrayList<>();
        int start = ((len-1)*10)+1;
        int stop = len*10;
        String query = "select * from productinfo";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ResultSet rs = ps.executeQuery();
            int count=1;
            while(rs.next()){
                Product pr = new Product();
                pr.setId(rs.getInt("id"));
                pr.setId(count);
                pr.setName(rs.getString("name"));
                pr.setBrand(rs.getString("brand"));
                pr.setPrice(rs.getInt("price"));
                pr.setDiscount(rs.getInt("discount"));
//                pr.setAvilablesize(getAvailableSizeForPorduct(pr.getId()));
//                pr.setTotalcount(getProductMaxCount(pr.getId()));
                pr.setVisibility(rs.getBoolean("visibility"));
                pr.setFocused1(rs.getBoolean("focused1"));
                pr.setFocused2(rs.getBoolean("focused2"));
                pr.setFocused3(rs.getBoolean("focused3"));
                System.out.println("count "+count);
                if(count>=start && count<=stop){
                    System.out.println("count ----"+count);
                    productlist.add(pr);
                }
                
                count++;
            }
        }
         catch(SQLException e){
            e.printStackTrace();
             System.out.println("Error: "+e);
        }
        return productlist;
    }
    public String getAvailableSizeForPorduct(int pid){
        String availableSize = "";
        String query = "select * from sizecount where pid=?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try {
            ps.setInt(1,pid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                SizeCount sc = new SizeCount();
                sc.setSize(rs.getString("size"));
                sc.setCount(rs.getInt("count"));
                if(sc.getCount()>0){
                    availableSize += (sc.getSize()+", ");
                }
            }
            if(availableSize.length()>2){
                availableSize = availableSize.substring(0, availableSize.length()-1);
            }
            if(availableSize.length()>1){
                availableSize = availableSize.substring(0, availableSize.length()-1);
            }
            System.out.println(pid+" availableSize="+availableSize+" "+availableSize.length());
        } 
        catch(SQLException e){
            e.printStackTrace();
        }
        return availableSize;
    }
    public int getProductMaxCount(int pid){
        int maxcount=0;
        List<SizeCount> scList = new ArrayList<>();
        String query = "select * from sizecount where pid=?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try {
            ps.setInt(1,pid);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                SizeCount sc = new SizeCount();
                sc.setCount(rs.getInt("count"));
                maxcount += sc.getCount();
                
                System.out.print(sc.getCount()+" ");
                System.out.println("maxcount="+maxcount);
            }            
        } 
        catch(SQLException e){
            e.printStackTrace();
        }
        return maxcount;
    }
    public Product getProductDetail(int id){
        Product pr = null;
        String query = "select * from productinfo where id=?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try {
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
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
                pr.setTotalcount(getProductMaxCount(pr.getId()));
                pr.setReleasedate(rs.getString("releasedate"));
                pr.setVisibility(rs.getBoolean("visibility"));
                pr.setFocused1(rs.getBoolean("focused1"));
                pr.setFocused2(rs.getBoolean("focused2"));
                pr.setFocused3(rs.getBoolean("focused3"));
                pr.setFocused("focused");
            }
            System.out.println("");
            System.out.println(pr.getId());
            System.out.println(pr.getName());
            System.out.println(pr.getBrand());
            
        } 
        catch(SQLException e){
            e.printStackTrace();
        }
        return pr;
    }
    
    public List<SizeCount> getSizeCountForPorduct(int pid){
        List<SizeCount> scList = new ArrayList<>();
        String query = "select * from sizecount where pid=?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try {
            ps.setInt(1,pid);
            ResultSet rs = ps.executeQuery();
            int id=1;
            while(rs.next()){
                SizeCount sc = new SizeCount();
                sc.setId(id);
                sc.setIdd(rs.getInt("id"));
                sc.setPid(rs.getInt("pid"));
                sc.setSize(rs.getString("size"));
                sc.setCount(rs.getInt("count"));
                scList.add(sc);
                id++;
                
                System.out.print(sc.getId()+" ");
                System.out.print(sc.getSize()+" ");
                System.out.println(sc.getCount());
            }            
        } 
        catch(SQLException e){
            e.printStackTrace();
        }
        return scList;
    }
    public void updateProductById(int id,Product prd) throws SQLException{
        String query = "update productinfo set name=?, description=?, image=?, brand=?, category=?, price=?,"
                + "discount=?, tags=?, totalcount=?, releasedate=?, visibility=?, focused1=?, focused2=? where id=?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        ps.setString(1,prd.getName());
        ps.setString(2,prd.getDescription());
        ps.setString(3,prd.getImage());
        ps.setString(4,prd.getBrand());
        ps.setString(5,prd.getCategory());
        ps.setInt(6,prd.getPrice());
        ps.setInt(7,prd.getDiscount());
        ps.setString(8,prd.getTags());
        ps.setInt(9,prd.getTotalcount());
        ps.setString(10,prd.getReleasedate());
        ps.setBoolean(11,prd.isVisibility());
        ps.setBoolean(12,prd.isFocused1());
        ps.setBoolean(13,prd.isFocused2());
        ps.setInt(14,id);
        ps.execute();
    }
    public void updateProductSizeCountById(SizeCount sc) throws SQLException{
        String query = "update sizecount set size=?, count=? where Id=?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        ps.setString(1,sc.getSize());
        ps.setInt(2,sc.getCount());
        ps.setInt(3,sc.getIdd());
        ps.execute();
    }
    public void deleteProduct(int id){
        String query = "delete from productinfo where id = ?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try{
            ps.setInt(1,id);
            ps.execute();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        ProductService ps = new ProductService();
        
        System.out.println(ps.getProductListByLength(1).size());
        
    }
}



/*

select * from displayproduct as A inner join productinfo as B on A.clothcode = B.id where A.displayto = 'feature'
select * from cart as A inner join productinfo as B on A.pid = B.id where A.uid = 4;



*/