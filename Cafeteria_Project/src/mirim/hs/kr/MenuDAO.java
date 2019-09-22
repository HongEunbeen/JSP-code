package mirim.hs.kr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MenuDAO {
	Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	
	public ArrayList<Menu> getMenu(String date1, String date2) {
		System.out.println(date1 + date2);
		ArrayList<Menu> list = new ArrayList<Menu>();
		String SQL = "select code, date, menu from menu";
		try{
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("basicjsp");//connection하는 곳
			conn = ds.getConnection();	
		
			if(date1 != null && !date1.equals("") && date2 != null && !date2.equals("")){
				SQL += "where date = " + date1+ "and date = " + date2 + "order by date";
			}else if(date1 != null && !date1.equals("")) {
				SQL += "where date = " + date1 + "order by date";
			}else if(date2 != null && !date2.equals("")) {
				SQL += "where date = " + date2 + "order by date";
			}else {
				SQL += "order by date";
			}
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Menu menu = new Menu();
				menu.setCode(rs.getInt(1));
				menu.setDate(rs.getString(2));
				menu.setMenu(rs.getString(3));
				
				list.add(menu);
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(conn!=null){ try{ conn.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(rs!=null){ try{ rs.close(); } catch(Exception e){ e.printStackTrace(); } }
		}
		return list;
	}
	public ArrayList<Menu> getInfo(String date1, String date2) {
		System.out.println(date1 + date2);
		ArrayList<Menu> list = new ArrayList<Menu>();
		String SQL = "select date, code, info ,kcal from menu";
		try{
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("basicjsp");//connection하는 곳
			conn = ds.getConnection();	
		
			if(date1 != null && !date1.equals("") && date2 != null && !date2.equals("")){
				SQL += "where date = " + date1+ "and date = " + date2 + "order by date";
			}else if(date1 != null && !date1.equals("")) {
				SQL += "where date = " + date1 + "order by date";
			}else if(date2 != null && !date2.equals("")) {
				SQL += "where date = " + date2 + "order by date";
			}else {
				SQL += "order by date";
			}
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Menu menu = new Menu();
				menu.setDate(rs.getString(1));
				menu.setCode(rs.getInt(2));
				menu.setInfo(rs.getString(3));
				menu.setKcal(rs.getString(4));
				
				list.add(menu);
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(conn!=null){ try{ conn.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(rs!=null){ try{ rs.close(); } catch(Exception e){ e.printStackTrace(); } }
		}
		return list;
	}
}
