package project;
import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.Title;

public class TitleDAO {
	
	
    public List readFirstTitle(){
        List<Title> list =new ArrayList<Title>();
      
        Connection con=null;
        Statement stmt=null;
        ResultSet rs=null;
        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        try {
            con=DriverManager.getConnection("jdbc:sqlite:"+"C://Users//fly//Desktop//plateDB");
            String sql="select * from NUMBER;";
            stmt=con.createStatement();;
            rs=stmt.executeQuery(sql);
            //DateFormat df = new SimpleDateFormat ("yyyy-MM-dd");     
           // Date d1 = df.parse("2001-01-01");
            while(rs.next())
            {
                int id=rs.getInt("ID");
                String Plate_number=rs.getString("PlateNumber");          
                String date=rs.getString("Date");
               // Date date=df.p;
                Title tl=new Title(id, Plate_number, date);
                list.add(tl);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally
        {
            try {
                if(rs!=null)
                {
                    rs.close();
                }
                if(stmt!=null)
                {
                    stmt.close();
                }
                if(con!=null)
                {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return list;
    }
    
}
