package dsn.module;

import java.io.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUploadModule {
	
	
	
	public void copyInto(String path,MultipartFile upload) {
		System.out.println("올린파일명:"+upload.getOriginalFilename());
		System.out.println(path);
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
