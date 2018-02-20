package com.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	//private static String ABS_PATH = "F:\\JAVA_WORKSPACE\\Vuman\\Vuman\\src\\main\\webapp\\assets\\images\\";
	
	public static void uploadFile(MultipartFile file,String abFilePath, String filePath, String fileName){
		try {
			byte[] imageByte = file.getBytes();
			
			// image upload for server 
			BufferedOutputStream fos = new BufferedOutputStream(
					new FileOutputStream(filePath + "\\assets\\images\\" + fileName));
			System.out.println("NEW PATH: "+ filePath + "\\asset\\images\\" + fileName);
			fos.write(imageByte);
			fos.close();
			
			//image upload for real(Absolute) path
			fos = new BufferedOutputStream(new FileOutputStream(abFilePath + fileName));
			System.out.println("ABS PATH"+ abFilePath);
			fos.write(imageByte);
			fos.close();
		} catch (Exception e) {
			System.out.println("Ex in SAVEPROD : "+e);
		}
	}
}
