package vo;

/*
 * class Product
 * 
 */
public class Product {
	//private ĸ��ȭ
	private int productId; // ��ǰ��ȣ
	private int categoryId; // ī�װ���ȣ
	private String productName; // ��ǰ�̸�
	private int productPrice; //  ��ǰ����
	private String productContent; // ��ǰ����
	private String productSoldout; // ��ǰ�Ǹ���Ȳ
	private String productPic; //��ǰ����
	
	//ĸ��ȭ
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
