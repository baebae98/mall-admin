package vo;

/*
 * class Product
 * 
 */
public class Product {
	//private 캡슐화
	private int productId; // 상품번호
	private int categoryId; // 카테고리번호
	private String productName; // 상품이름
	private int productPrice; //  상품가격
	private String productContent; // 상품내용
	private String productSoldout; // 상품판매현황
	private String productPic; //상품사진
	
	//캡슐화
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public String getProductSoldout() {
		return productSoldout;
	}
	public void setProductSoldout(String productSoldout) {
		this.productSoldout = productSoldout;
	}
	public String getProductPic() {
		return productPic;
	}
	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}
	
	
	
}
