package com.homepage.interlink;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class testc {
	public static void main(String[] args) throws Exception {
		
		System.out.println("- Strart Batch -");
		
		String url = "jdbc:sqlserver://103.8.100.144:5398;DatabaseName=bpfc";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		conn = DriverManager.getConnection(url, "bpfc", "bpfc2018");
		stmt = conn.createStatement();
		ArrayList arr = new ArrayList();

		rs = stmt.executeQuery("SELECT * from v_member");
		
		/*select*/
		while (rs.next()) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("bpfc_rank", rs.getString(1));
			map.put("bpfc_department", rs.getString(2));
			map.put("bpfc_name", rs.getString(3));
			map.put("bpfc_phone", rs.getString(4));
			map.put("bpfc_task", rs.getString(5));
			map.put("bpfc_task2", rs.getString(6));
			arr.add(map);
		}

		rs.close();
		stmt.close();
		conn.close();

		Connection connection = null;
		Statement st = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://interlinknc.synology.me/interlink1", "interlink1",
					"test");
			st = connection.createStatement();

			String sql;

			/*delete*/
			sql="delete from member;";
			st.executeUpdate(sql);
			
			/*insert*/
			for (int i = 0; i < arr.size(); i++) {
				Map<String, String> map = (Map<String, String>) arr.get(i);
				String rank = map.get("bpfc_rank");
				String department = map.get("bpfc_department");
				String name = map.get("bpfc_name");
				String phone = map.get("bpfc_phone");
				String task = map.get("bpfc_task");
				String task2 = map.get("bpfc_task2");
				sql = "insert into member values ('"+rank+"', '"+department+"', '"+name+"', '"+phone+"', '"+task+"', '"+task2+"');";
				st.executeUpdate(sql);
			}
			
			/*90일경과 개인정보&이력서DB 삭제*/
			sql="delete from resume where privacy_no in (select privacy_no FROM privacy WHERE agreement_date < DATE_SUB(NOW(), INTERVAL 90 DAY));";
			
			try {
			st.executeUpdate(sql);
			System.out.println("delete ok");
			}catch (Exception e) {
				System.out.println("delete x");
			}
			sql="delete from privacy WHERE agreement_date < DATE_SUB(NOW(), INTERVAL 90 DAY);";
			
			try {
			st.executeUpdate(sql);
			System.out.println("delete ok");
			}catch (Exception e) {
				System.out.println("delete x");
			}
			/*개인정보삭제end*/
			
			/* 이력서 삭제 30일 이후 삭제 */
			/* 개인정보 & 이력서 DB 삭제 */
			
			String sql2;
			
			ArrayList arr0 = new ArrayList();
			ArrayList arr1 = new ArrayList();
			ArrayList arr2 = new ArrayList();
			sql="select privacy_no, resume_path, resume_file2 from resume where del_date < DATE_SUB(NOW(), INTERVAL 0 DAY) and USE_YN='N';";
			rs = st.executeQuery(sql);
			while(rs.next()) {
				arr0.add(rs.getString(1));
				arr1.add(rs.getString(2));
				arr2.add(rs.getString(3));
			}
			
			/* 개인정보 & 이력서 DB 삭제 */
			for (int j = 0; j < arr0.size(); j++) {
				String to1 = (String) arr0.get(j);
				int to = Integer.parseInt(to1);
				sql = "delete from resume where privacy_no="+"'"+to+"';";
				sql2 = "delete from privacy where privacy_no="+"'"+to+"';";
				try {
				st.executeUpdate(sql);
				st.executeUpdate(sql2);
				}catch (Exception e) {
					System.out.println("이력서&개인정보 삭제 실패");
				}
			}
			/* 이력서 파일 삭제 */
			for (int k = 0; k < arr0.size(); k++) {
				String url1 = (String) arr1.get(k);
				String filename = (String) arr2.get(k);
				String file1 = url1+filename;
				 File file = new File(file1);
		         
			        if( file.exists() ){
			            if(file.delete()){
			                System.out.println("파일삭제 성공");
			            }else{
			                System.out.println("파일삭제 실패");
			            }
			        }else{
			            System.out.println("파일이 존재하지 않습니다.");
			        }
			}
			
			/* 이력서 삭제 30일 이후 삭제end */
			
			st.close();
			connection.close();
		} catch (SQLException se1) {
			se1.printStackTrace();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
			} catch (SQLException se2) {
			}
			try {
				if (connection != null)
					connection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		
		System.out.println("- End Batch2 -");
	}
}