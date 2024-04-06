package dao;

import java.sql.SQLException;

import database.DbConnection;

public class UserDao {
	
	public int getUserId(String mobile, String password) {
		
		String query = "SELECT user_id FROM user WHERE mobile = ? AND password = ?";
		try(DbConnection db = new DbConnection();){
			db.pstm = db.con.prepareStatement(query);
			db.pstm.setString(1, mobile);
			db.pstm.setString(2, password);
			db.rs = db.pstm.executeQuery();
			if(db.rs.next()) return db.rs.getInt(1);
			else return -1;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public String getUserName(String mobile, String password) {
		
		String query = "SELECT name FROM user WHERE mobile = ? AND password = ?";
		try(DbConnection db = new DbConnection();){
			db.pstm = db.con.prepareStatement(query);
			db.pstm.setString(1, mobile);
			db.pstm.setString(2, password);
			db.rs = db.pstm.executeQuery();
			return db.rs.getString("name");
		} 
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean existsMobile(String mobile) {
		
		String query = "SELECT name FROM user WHERE mobile = ? ";
		try(DbConnection db = new DbConnection();){
			db.pstm = db.con.prepareStatement(query);
			db.pstm.setString(1, mobile);
			db.rs = db.pstm.executeQuery();
			return db.rs.next();
		} 
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean addUser(String name, String mobile, String password) {
		String query = "INSERT INTO user (name, mobile, password) VALUES(?,?,?)";
//		System.out.println(name + "  " + mobile + "  " + password);
		try(DbConnection db = new DbConnection()){
			db.pstm = db.con.prepareStatement(query);
			db.pstm.setString(1, name);
			db.pstm.setString(2, mobile);
			db.pstm.setString(3, password);
			int count = db.pstm.executeUpdate();
	        return count > 0;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
		
}



