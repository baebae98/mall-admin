package vo;

/*
 * class Category
 * 
 */
public class Category {
	//캡슐화 private
	private int categoryId;  //카테고리번호
	private String categoryName;  //카테고리이름
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
}
