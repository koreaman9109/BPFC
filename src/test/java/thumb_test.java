import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

public class thumb_test {
	public static String rootPath = "C:\\Users\\interlink\\Desktop\\썸네일추가작업중\\photo";
	public static String convertPath = "C:\\Users\\interlink\\Desktop\\썸네일추가작업중\\photo\\thumb";
	
    public static void main(String args[]){
        try {
        	
        	File f = new File(rootPath);
			File[] list = f.listFiles();
			File newPath = new File(convertPath);
			if(!newPath.exists())
				newPath.mkdirs();
			
			for(File file : list) {
				
				String fileName = file.getName();
				if(fileName.toLowerCase().endsWith(".jpg") || fileName.toLowerCase().endsWith(".tif") ) { //뒤에 확장자 명이 .jpg | .tif 인것을 찾는다
					System.out.println("fileName ======================================> " + fileName);
					
				//썸네일 가로사이즈
	            int thumbnail_width = 400;
	            //썸네일 세로사이즈
	            int thumbnail_height = 300;
	            
	            

	          //원본이미지파일의 경로+파일명
	            File origin_file_name = new File(fileName);
	            System.out.println("origin_file_name =====>" + origin_file_name);
	            //생성할 썸네일파일의 경로+썸네일파일명
	            File thumb_file_name = new File("thumb_"+fileName);
	            System.out.println("thumb_file_name  =====>" + thumb_file_name);
	            
	            BufferedImage buffer_original_image = ImageIO.read(file);
	            System.out.println("ImageIO.read(file  =====>" + buffer_original_image);

	            BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, BufferedImage.TYPE_3BYTE_BGR);
	            Graphics2D graphic = buffer_thumbnail_image.createGraphics();
	            System.out.println("graphic  =====>" + graphic);
	            
	            graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);
	            ImageIO.write(buffer_thumbnail_image, "jpg", new File(convertPath + File.separator +thumb_file_name));
	            
			}
			}
			System.out.println("썸네일 생성완료");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
