package vo;

/*
 * class Orders
 * 
 */
public class Orders {
	//ĸ��ȭ
	private int ordersId; // �ֹ���ȣ
	private String ordersDate; // �ֹ��ѽð�
	private int productId; //  ��ǰ��ȣ
	private int ordersAmount; // �ֹ�����
	private int ordersPrice; // �ֹ�����
	private String memberEmail; // ȸ�����̵�
	private String ordersAddr; // �ֹ����ּ�
	private String ordersState; // �ֹ�����
	
	//ĸ��ȭ
	public int getOrdersId() {
		return ordersId;
	}
	public void setOrdersId(int ordersId) {
		this.ordersId = ordersId;
	}
	public String getOrdersDate() {
		return ordersDate;
	}
	public void setOrdersDate(String ordersDate) {
		this.ordersDate = ordersDate;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getOrdersAmount() {
		return ordersAmount;
	}
	public void setOrdersAmount(int ordersAmount) {
		this.ordersAmount = ordersAmount;
	}
	public int getOrdersPrice() {
		return ordersPrice;
	}
	public void setOrdersPrice(int ordersPrice) {
		this.ordersPrice = ordersPrice;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getOrdersAddr() {
		return ordersAddr;
	}
	public void setOrdersAddr(String ordersAddr) {
		this.ordersAddr = ordersAddr;
	}
	public String getOrdersState() {
		return ordersState;
	}
	public void setOrdersState(String ordersState) {
		this.ordersState = ordersState;
	}
	
	
}
