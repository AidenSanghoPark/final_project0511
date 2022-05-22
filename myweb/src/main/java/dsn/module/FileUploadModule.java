package dsn.module;

import java.io.*;
import java.util.regex.Pattern;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadModule {
	
	public void copyInto(String path,MultipartFile upload) {
		
		try {
			byte bytes[]=upload.getBytes();
			
			File f=new File(path+upload.getOriginalFilename());
			FileOutputStream fos=new FileOutputStream(f);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}