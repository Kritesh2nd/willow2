package Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Support {
    public String getDate(){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        LocalDateTime now = LocalDateTime.now();
        String d = dtf.format(now);
        return d;
    }
    
    public String isProductNewByDate(String prodDate){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        LocalDateTime now = LocalDateTime.now();
        String d = dtf.format(now);
        int[] nowDateArr = stringDateToInt(d);
        int[] prodDateArr = stringDateToInt(prodDate);
//        System.out.println(nowDayInt+" "+nowMonthInt+" "+nowYearInt+" "+d);
//        
        String returnval = "none";
        System.out.println("product uploded date ");
        System.out.println(prodDateArr[0]+" "+prodDateArr[1]+" "+prodDateArr[2]);
        if(prodDateArr[0] > nowDateArr[0]-7){
            returnval = "";
        }
        return returnval;

    }
    
    public int[] stringDateToInt(String date){
        String d = date;
        String nowDayStr,nowMonthStr,nowYearStr;
        int nowDayInt,nowMonthInt,nowYearInt;
        nowDayStr = String.valueOf(d.charAt(0)).concat(String.valueOf(d.charAt(1)));
        nowMonthStr = String.valueOf(d.charAt(3)).concat(String.valueOf(d.charAt(4)));
        nowYearStr = String.valueOf(d.charAt(6)).concat(String.valueOf(d.charAt(7))).concat(String.valueOf(d.charAt(8))).concat(String.valueOf(d.charAt(9)));
        nowDayInt = Integer.parseInt(nowDayStr);
        nowMonthInt = Integer.parseInt(nowMonthStr);
        nowYearInt = Integer.parseInt(nowYearStr);
        int[] returnval = {nowDayInt,nowMonthInt,nowYearInt};
        return returnval;
    }
    
    public String newPrd(String date){
        return isProductNewByDate(date);
    }
    
    
    public double getPercentOf(int percent, int value){
        double val = (double) percent / 100 * value;
        return val;
    }
    public String toStrikeByDiscount(int discount){
        String returnval = "tdn";
        if(discount>0){returnval = "tdlt";}
        return returnval;
    }
    
    public String toDisplayByDiscount(int discount){
        String returnval = "none";
        if(discount>0){returnval = "";}
        return returnval;
    }
    public static void main(String[] args) {
        //25-04-2023
        Support s = new Support();
        
        System.out.println("cc "+s.isProductNewByDate("15-04-2023"));
    }
}
