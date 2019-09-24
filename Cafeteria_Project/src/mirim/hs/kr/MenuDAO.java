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
	
	public ArrayList<Menu> getMenu(String date1, String code) {
		ArrayList<Menu> list = new ArrayList<Menu>();
		String SQL = "select code, date, menu, info, kcal, number from menu";
		try{
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("basicjsp");//connection하는 곳
			conn = ds.getConnection();	
			if(date1 != null && !date1.equals("") && code != null && !code.equals("")){
				SQL += " where date_format(date,'%Y-%m-%d') = '" + date1+ "' and code = '" + code + "' order by date, code";
			}else {
				SQL += " order by date, code";
			}
			System.out.println(SQL);
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Menu menu = new Menu();
				menu.setCode(rs.getInt(1));
				menu.setDate(rs.getString(2));
				menu.setMenu(rs.getString(3));
				menu.setInfo(rs.getString(4));
				menu.setKcal(rs.getString(5));
				menu.setNumber(rs.getString(6));
				
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
	public ArrayList<Menu> getInfo(String date1, String code) {
		System.out.println(date1 + code);
		ArrayList<Menu> list = new ArrayList<Menu>();
		String SQL = "select date, code, info ,kcal, number from menu";
		try{
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("basicjsp");//connection하는 곳
			conn = ds.getConnection();	
			if(date1 != null && !date1.equals("") && code != null && !code.equals("")){
				SQL += " where date_format(date,'%Y-%m-%d') = '" + date1+ "' and code = '" + code + "' order by date, code";
			}else {
				SQL += " order by date, code";
			}
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Menu menu = new Menu();
				menu.setDate(rs.getString(1));
				menu.setCode(rs.getInt(2));
				menu.setInfo(rs.getString(3));
				menu.setKcal(rs.getString(4));
				menu.setNumber(rs.getString(5));
				
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
	public ArrayList<Menu> getToday() {
		ArrayList<Menu> list = new ArrayList<Menu>();
		String SQL = "select code, date, menu, info, kcal,number from menu where date_format(date,'%Y-%m-%d') = CURDATE() order by date, code";
		try{
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("basicjsp");//connection하는 곳
			conn = ds.getConnection();	
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Menu menu = new Menu();
				menu.setCode(rs.getInt(1));
				menu.setDate(rs.getString(2));
				menu.setMenu(rs.getString(3));
				menu.setInfo(rs.getString(4));
				menu.setKcal(rs.getString(5));
				menu.setNumber(rs.getString(6));
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
