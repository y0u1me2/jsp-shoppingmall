package com.web.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class CustomFileRename implements FileRenamePolicy {

	@Override
	public File rename(File oldFile) {//원본파일
		
		File newFile = null;
		
		do {
			//파일명을 중복되지 않게 rename할 데이터
			//중복값을 최소화하기 위해 밀리세컨초를 가져오고 거기에 랜덤값까지
			long currentTime=System.currentTimeMillis();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String fileName = oldFile.getName()+"_"+sdf.format(new Date(currentTime))+".png";
			
			if(oldFile.getName().equals("original")) {
				newFile = new File(oldFile.getParent()+"/temp", fileName); //원본파일의 부모(폴더를 의미)
			}else {
				newFile = new File(oldFile.getParent(),fileName); //원본파일의 부모(폴더를 의미)
			}
			
		}while(!createNewFile(newFile));
				
		return newFile;
	}
	
	
		private boolean createNewFile(File f) {
			try {
				//파일이 생성이되면 true를반환
				//파일이 저장되는 경로에 동일한 이름의 파일이 있으면 ? 파일을 생성하지 않고 false를 반환하는 로직
				return f.createNewFile();
				
			}catch(IOException e){	
				//파일이 생성되지 못하면 false반환
				return false;
			}
		}

}
