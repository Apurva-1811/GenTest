package dao;

public class Test {
	
    private int test_id;
    private String test_tag;
    private int questions;
    private int candidates;
    private int pass_marks;
    
    // getters and setters
    
    public int getTestId() { return test_id; }
    public void setTestId(int id) {this.test_id = id;}
    
    public String getTestTag() { return test_tag; }
    public void setTestTag(String tag) {this.test_tag = tag;}
    
    public int getNoOfQuestions() { return questions; }
    public void setNoOfQuestions(int num) {this.questions = num;}
    
    public int getNoOfCandidates() { return candidates; }
    public void setNoOfCandidates(int num) {this.candidates = num;}
    
    public int getPassMarks() { return pass_marks; }
    public void setPassMarks(int num) {this.pass_marks = num;}
    
}