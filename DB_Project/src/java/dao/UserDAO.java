package java.dao;

import java.dto.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jsp.util.DBConnection;

public class UserDAO {
	private Connection conn = DBConnection.getConnection();
	private PreparedStatement pstmt;
	private ResultSet rs;
	 
	//ȸ������
	public int join(User user) {
		String SQL = "INSERT INTO REGISTER(NAME, COMPANY, GENDER, EMAIL, PASSWORD, PHONE, COMPHONE, AGE) VALUES (?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getCompany());
			pstmt.setString(3, user.getGender());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPassword());
			pstmt.setString(6, user.getPhone());
			pstmt.setString(7, user.getComphone());
			pstmt.setInt(8, user.getAge());
			
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB ����
	}
	
	//�α���
	public int login(String userID, String userPassword) {
		String SQL = "SELECT PASSWORD FROM REGISTER WHERE EMAIL = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // �α��� ����
				} else {
					return 0; // ��й�ȣ ����ġ
				}
					
			}
			return -1; // ���̵� ����

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ������ �ǹ�
	}
}
