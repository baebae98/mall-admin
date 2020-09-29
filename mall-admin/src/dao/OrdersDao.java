package dao;
import java.util.*;
import vo.*;
import java.sql.*;
import commons.DBUtil;

public class OrdersDao {
	
	// 주문의 상태를 수정하는 쿼리
		public void updateOrdersState(Orders orders) throws Exception{
			//commons.DBUtil
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			//sql
			String sql = "update orders set orders_state = ? where orders_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, orders.getOrdersState());
			stmt.setInt(2, orders.getOrdersId());
			stmt.executeUpdate();
			conn.close();
		}
		
		// 주문상태 목록
		public ArrayList<String> selectOrdersStateList() throws Exception{
			// select distinct orders_state from orders(distinct : 중복제거)
			ArrayList<String> list = new ArrayList<String>();
			String Driver = "org.mariadb.jdbc.Driver";
			String dbaddr = "jdbc:mariadb://localhost:3306/mall";
			String dbid = "root";
			String dbpw = "java1004";
			Class.forName(Driver);
			Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
			String sql = "select distinct orders_state from orders";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				String state = new String();
				state = rs.getString("orders_state");
				list.add(state);
			}
			return list;
		}
		
		// 전체 주문의 리스트를 확인하는 쿼리 메서드
		public ArrayList<OrdersAndProduct> selectOrdersList() throws Exception{
			ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
			String Driver = "org.mariadb.jdbc.Driver";
			String dbaddr = "jdbc:mariadb://localhost:3306/mall";
			String dbid = "root";
			String dbpw = "java1004";
			Class.forName(Driver);
			Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
			/*
			 * select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name
			 * from orders o inner join product p
			 * on o.product_id = p.product_id
			 */
			String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name "
					+ "from orders o inner join product p" + " on o.product_id = p.product_id";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				OrdersAndProduct oap = new OrdersAndProduct();
				/*oap.orders = new Orders();
				oap.product = new Product();
				oap.orders.ordersId = rs.getInt("o.orders_id");
				oap.orders.productId = rs.getInt("o.product_id");
				oap.orders.ordersAmount = rs.getInt("o.orders_amount");
				oap.orders.ordersPrice = rs.getInt("o.orders_price");
				oap.orders.memberEmail = rs.getString("o.member_email");
				oap.orders.ordersAddr = rs.getString("o.orders_addr");
				oap.orders.ordersState = rs.getString("o.orders_state");
				oap.orders.ordersDate = rs.getString("o.orders_date");
				oap.product.productName = rs.getString("p.product_name");*/
				oap.setOrders(new Orders());
				oap.setProduct(new Product());
				oap.getOrders().setOrdersId(rs.getInt("o.orders_id"));
				oap.getOrders().setProductId(rs.getInt("o.product_id"));
				oap.getOrders().setOrdersAmount(rs.getInt("o.orders_amount"));
				oap.getOrders().setOrdersPrice(rs.getInt("o.orders_price"));
				oap.getOrders().setMemberEmail(rs.getString("o.member_email"));
				oap.getOrders().setOrdersAddr(rs.getString("o.orders_addr"));
				oap.getOrders().setOrdersState(rs.getString("o.orders_state"));
				oap.getOrders().setOrdersDate(rs.getString("o.orders_date"));
				oap.getProduct().setProductName(rs.getString("p.product_name"));
				list.add(oap);
			}
			conn.close();
			return list;
		}
		// 조건에 따른 주문의 상태별 리스트를 확인하는 쿼리 메서드
		public ArrayList<OrdersAndProduct> selectOrdersListByState(String ordersState) throws Exception{
			ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
			String Driver = "org.mariadb.jdbc.Driver";
			String dbaddr = "jdbc:mariadb://localhost:3306/mall";
			String dbid = "root";
			String dbpw = "java1004";
			Class.forName(Driver);
			Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
			String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name "
					+ "from orders o inner join product p" + " on o.product_id = p.product_id where orders_state = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, ordersState);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				OrdersAndProduct oap = new OrdersAndProduct();
				/*oap.orders = new Orders();
				oap.product = new Product();
				oap.orders.ordersId = rs.getInt("o.orders_id");
				oap.orders.productId = rs.getInt("o.product_id");
				oap.orders.ordersAmount = rs.getInt("o.orders_amount");
				oap.orders.ordersPrice = rs.getInt("o.orders_price");
				oap.orders.memberEmail = rs.getString("o.member_email");
				oap.orders.ordersAddr = rs.getString("o.orders_addr");
				oap.orders.ordersState = rs.getString("o.orders_state");
				oap.orders.ordersDate = rs.getString("o.orders_date");
				oap.product.productName = rs.getString("p.product_name");
				list.add(oap);*/
				oap.setOrders(new Orders());
				oap.setProduct(new Product());
				oap.getOrders().setOrdersId(rs.getInt("o.orders_id"));
				oap.getOrders().setProductId(rs.getInt("o.product_id"));
				oap.getOrders().setOrdersAmount(rs.getInt("o.orders_amount"));
				oap.getOrders().setOrdersPrice(rs.getInt("o.orders_price"));
				oap.getOrders().setMemberEmail(rs.getString("o.member_email"));
				oap.getOrders().setOrdersAddr(rs.getString("o.orders_addr"));
				oap.getOrders().setOrdersState(rs.getString("o.orders_state"));
				oap.getOrders().setOrdersDate(rs.getString("o.orders_date"));
				oap.getProduct().setProductName(rs.getString("p.product_name"));
				list.add(oap);
			}
			System.out.println(ordersState);
			conn.close();
			return list;
		}
	}