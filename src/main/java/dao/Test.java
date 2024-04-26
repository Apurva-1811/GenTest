package dao;

public class Test {
	
    private int test_id;
    private String test_tag;
    private int questions;
    private int candidates;
    private int pass_marks;
    
    // pojo: default and parameterised constructor
    public Test() {
		super();
	}

	public Test(int test_id, String test_tag, int questions, int candidates, int pass_marks) {
		super();
		this.test_id = test_id;
		this.test_tag = test_tag;
		this.questions = questions;
		this.candidates = candidates;
		this.pass_marks = pass_marks;
	}

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