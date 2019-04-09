package com.homepage.interlink;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class test123 {
	public static void main(String[] args) throws Exception {
		Connection connection = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://interlinknc.synology.me/interlink1", "interlink1",
					"test");
			st = connection.createStatement();

			String sql;
			String sql2;
			
			ArrayList arr = new ArrayList();
			ArrayList arr1 = new ArrayList();
			ArrayList arr2 = new ArrayList();
			sql="select privacy_no, resume_path, resume_file2 from resume where del_date < DATE_SUB(NOW(), INTERVAL 0 DAY) and USE_YN='N';";
			rs = st.executeQuery(sql);
			while(rs.next()) {
				arr.add(rs.getString(1));
				arr1.add(rs.getString(2));
				arr2.add(rs.getString(3));
			}
			
			/* 개인정보 & 이력서 DB 삭제 */
			for (int j = 0; j < arr.size(); j++) {
				String to1 = (String) arr.get(j);
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
			for (int k = 0; k < arr.size(); k++) {
				String url = (String) arr1.get(k);
				String filename = (String) arr2.get(k);
				String file1 = url+filename;
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
			
			rs.close();
			st.close();
			connection.close();

		}catch (Exception e) {
			// TODO: handle exception
		}
	}
}
