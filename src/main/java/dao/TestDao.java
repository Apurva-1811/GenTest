package dao;

import java.sql.SQLException;
import java.util.*;
import database.DbConnection;

public class TestDao {

	public static ArrayList<Test> getAllTests() throws Exception {

		ArrayList<Test> arr = new ArrayList<>();
		String query = "SELECT * FROM test";

		try (DbConnection db = new DbConnection()) {
			db.pstm = db.con.prepareStatement(query);
			db.rs = db.pstm.executeQuery();

			while (db.rs.next()) {
				Test test = new Test();
				test.setTestId(db.rs.getInt("test_id"));
				test.setTestTag(db.rs.getString("test_tag"));
				test.setNoOfQuestions(db.rs.getInt("questions"));
				test.setNoOfCandidates(db.rs.getInt("candidates"));
				test.setPassMarks(db.rs.getInt("pass_marks"));
				arr.add(test);
			}
			return arr;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static ArrayList<Question> getAllQuestions(int test_id) throws Exception {

		ArrayList<Question> arr = new ArrayList<>();
		String query = "SELECT * FROM questions WHERE test_id = " + test_id;

		try (DbConnection db = new DbConnection()) {
			db.pstm = db.con.prepareStatement(query);
			db.rs = db.pstm.executeQuery();

			while (db.rs.next()) {
				Question q = new Question();
				q.setTestId(test_id);
				q.setQuesId(db.rs.getInt("ques_id"));
				q.setQuesText(db.rs.getString("ques_text"));
				q.setOption1(db.rs.getString("option1"));
				q.setOption2(db.rs.getString("option2"));
				q.setOption3(db.rs.getString("option3"));
				q.setOption4(db.rs.getString("option4"));
				q.setCorrectAnswer(db.rs.getInt("correct_answer"));
				arr.add(q);
			}
			return arr;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static boolean addNewTest(String test_tag, String questions, String pass_marks) {
		String query = "INSERT INTO test (test_tag, questions, pass_marks, candidates) VALUES (?,?,?,0)";
		try (DbConnection db = new DbConnection()) {
			db.pstm = db.con.prepareStatement(query);
			db.pstm.setString(1, test_tag);
			db.pstm.setString(2, questions);
			db.pstm.setString(3, pass_marks);
			int count = db.pstm.executeUpdate();
			return count > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static int getTestId() throws Exception {

		String query = "SELECT test_id FROM test";
		try (DbConnection db = new DbConnection()) {
			db.pstm = db.con.prepareStatement(query);
			db.rs = db.pstm.executeQuery();
			int ans = -1;
			while (db.rs.next())
				ans = db.rs.getInt("test_id");
			return ans;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}

	public static void deleteTest(String test_id) {
		String query = "DELETE FROM test WHERE test_id = ?";
		try (DbConnection db = new DbConnection()) {
			db.pstm = db.con.prepareStatement(query);
			db.pstm.setString(1, test_id);
			int count = db.pstm.executeUpdate();
//	        return count > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void addNewQuestion(int test_id, String quesText, String option1, String option2, String option3,
			String option4, int correctAnswer) {

		String query = "INSERT INTO questions (test_id, ques_text, option1, option2, option3, "
				+ "option4, correct_answer) VALUES (?,?,?,?,?,?,?)";
		try (DbConnection db = new DbConnection()) {
			db.pstm = db.con.prepareStatement(query);
			db.pstm.setInt(1, test_id);
			db.pstm.setString(2, quesText);
			db.pstm.setString(3, option1);
			db.pstm.setString(4, option2);
			db.pstm.setString(5, option3);
			db.pstm.setString(6, option4);
			db.pstm.setInt(7, correctAnswer);
			int count = db.pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static int[] getScore(int test_id, String[] answers, boolean nullString) throws Exception {
		
		String query = "SELECT correct_answer FROM questions WHERE test_id = " + test_id;
		int count = 0;
		int total = 0;
		int[] ans = new int[2];
		try (DbConnection db = new DbConnection()) {
			db.pstm = db.con.prepareStatement(query);
			db.rs = db.pstm.executeQuery();
			int i = 0;
			while(db.rs.next()) {
				if(i<answers.length && answers[i].length() != 0) {
					if(nullString == false && db.rs.getInt("correct_answer") == Integer.parseInt(answers[i])) count++;
				}
				i++;
				total++;
			}
			ans[0] = count;
			ans[1]  =total;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ans;
		
	}

	public static void updateCandidates(int test_id) {
		// update the candidate no
		String query = "UPDATE test SET candidates = candidates+1 WHERE test_id = " + test_id;
		try (DbConnection db = new DbConnection()) {
			db.pstm = db.con.prepareStatement(query);
			int count = db.pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	public static String getTestName(int test_id) throws Exception {
		
		String query = "SELECT test_tag FROM test WHERE test_id = " + test_id;
		String ans = "";
		try (DbConnection db = new DbConnection()) {
			db.pstm = db.con.prepareStatement(query);
			db.rs = db.pstm.executeQuery();
			while (db.rs.next())
				ans = db.rs.getString("test_tag");
			return ans;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ans;
	}

	public static int getPassMarks(int test_id) throws Exception {
		String query = "SELECT pass_marks FROM test WHERE test_id = " + test_id;
		int ans = 0;
		try (DbConnection db = new DbConnection()) {
			db.pstm = db.con.prepareStatement(query);
			db.rs = db.pstm.executeQuery();
			while (db.rs.next())
				ans = db.rs.getInt("pass_marks");
			return ans;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ans;
	
	}

	public static void updatePassMarks(int test_id, int passMarks) {
		
		String query = "UPDATE test SET pass_marks = ? WHERE test_id = ?" ;
		try (DbConnection db = new DbConnection()) {
			db.pstm = db.con.prepareStatement(query);
			db.pstm.setInt(1, passMarks);
			db.pstm.setInt(2, test_id);
			int count = db.pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	public static void updateQuestion(int test_id, int ques_id, String ques_text, String option1, String option2,
			String option3, String option4, int correct_answer) {
		
		String query = "UPDATE questions SET ques_text = ?, option1 = ?, option2 = ?, option3 = ?, option4 = ?, correct_answer = ?"
				+ " WHERE ques_id = ? AND test_id = ?" ;
		try (DbConnection db = new DbConnection()) {
			db.pstm = db.con.prepareStatement(query);
			db.pstm.setString(1, ques_text);
			db.pstm.setString(2, option1);
			db.pstm.setString(3, option2);
			db.pstm.setString(4, option3);
			db.pstm.setString(5, option4);
			db.pstm.setInt(6, correct_answer);
			db.pstm.setInt(7, ques_id);
			db.pstm.setInt(8, test_id);

			int count = db.pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}	
	
}