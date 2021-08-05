package model2.mvcboard;

public class CommentDTO {
	private String idx;
    private String board_idx;
    private String name;
    private String pass;
    private String comments;
    private String commentsEdit;
    private String postdate;
    
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(String board_idx) {
		this.board_idx = board_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getCommentsEdit() {
		return commentsEdit;
	}
	public void setCommentsEdit(String commentsEdit) {
		this.commentsEdit = commentsEdit;
	}
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	}

