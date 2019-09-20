package mirim.hs.kr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberMDAO {
	Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	
	public int join(MemberM member) {	
		try{
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("basicjsp");//connection하는 곳
			conn = ds.getConnection();	
			
			pstmt = conn.prepareStatement("INSERT INTO MEMBERM(EMAIL, PASSWORD, NAME, WEIGHT, HEIGHT) VALUES (?,?,?,?,?)");
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getWeight());
			pstmt.setInt(5, member.getHeight());
			
			return pstmt.executeUpdate();
		}
		catch(Exception e){
			System.out.println("급식 로딩 실패");
			e.printStackTrace();
		}
		finally{
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(conn!=null){ try{ conn.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(rs!=null){ try{ rs.close(); } catch(Exception e){ e.printStackTrace(); } }
		}
		return -1;
	}
	public int login(String email, String password) {
		System.out.println(email  + "/" + password);
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("basicjsp");//connection하는 곳
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement("SELECT PASSWORD FROM MEMBERM WHERE EMAIL = ?");
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(password)) {
					System.out.println("로그인 완료");
					return 1;
				} else {
					System.out.println("비밀번호 다름");
					return 0;
				}
					
			}
			return -1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; 
	}
}
