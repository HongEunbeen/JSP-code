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
			
			pstmt = conn.prepareStatement("INSERT INTO MEMBERM(EMAIL, PASSWORD, NAME, WEIGHT, HEIGHT, NUMBER) VALUES (?,?,?,?,?,?)");
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getWeight());
			pstmt.setInt(5, member.getHeight());
			pstmt.setString(6, member.getNumber());
			
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
		}finally{
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(conn!=null){ try{ conn.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(rs!=null){ try{ rs.close(); } catch(Exception e){ e.printStackTrace(); } }
		}
		return -2; 
	}
	public MemberM bmi(String email) {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("basicjsp");//connection하는 곳
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement("SELECT  WEIGHT, HEIGHT FROM MEMBERM WHERE EMAIL = ?");
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				MemberM user = new MemberM();
				user.setWeight(rs.getInt(1));
				user.setHeight(rs.getInt(2));
				return user;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(conn!=null){ try{ conn.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(rs!=null){ try{ rs.close(); } catch(Exception e){ e.printStackTrace(); } }
		}
		return null; 
	}
	public int update_user(MemberM member) {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("basicjsp");//connection하는 곳
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement("update memberm set weight = ?, height = ?  WHERE EMAIL = ?");
			pstmt.setInt(1, member.getWeight());
			pstmt.setInt(2, member.getHeight());
			pstmt.setString(3, member.getEmail());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(conn!=null){ try{ conn.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(rs!=null){ try{ rs.close(); } catch(Exception e){ e.printStackTrace(); } }
		}
		return -1;
	}
	public String getNumber(String email) {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("basicjsp");//connection하는 곳
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement("select number from memberm where email = ?");
			pstmt.setString(1,email);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(conn!=null){ try{ conn.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(rs!=null){ try{ rs.close(); } catch(Exception e){ e.printStackTrace(); } }
		}
		return null;
	}
}
