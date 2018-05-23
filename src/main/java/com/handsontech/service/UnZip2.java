package com.handsontech.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class UnZip2 {
	public String[] performUnzip(String zipFilePath, String destDir, int PID, String JSONPath) {
		File dir = new File(destDir);
		ArrayList<String> ls = new ArrayList<String>();
		// create output directory if it doesn't exist
		if (!dir.exists())
			dir.mkdirs();
		FileInputStream fis;
		// buffer for read and write data to file
		byte[] buffer = new byte[1024];
		try {
			fis = new FileInputStream(zipFilePath);
			ZipInputStream zis = new ZipInputStream(fis);
			ZipEntry ze = zis.getNextEntry();
			int counter = 0;
			while (ze != null) {
				counter++;
				String fileName = ze.getName();
				String extension = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
				String Path = destDir + File.separator + "IG" + PID +"C"+ counter + "." + extension;
				ls.add(JSONPath + "IG" + PID +"C"+ counter + "." + extension);
				File newFile = new File(Path);
				System.out.println("Unzipping to " + newFile.getAbsolutePath());
				System.out.println("Length : " + ls.size());
				// create directories for sub directories in zip
				new File(newFile.getParent()).mkdirs();
				FileOutputStream fos = new FileOutputStream(newFile);
				int len;
				while ((len = zis.read(buffer)) > 0) {
					fos.write(buffer, 0, len);
				}
				fos.close();
				zis.closeEntry();
				ze = zis.getNextEntry();
			}
			// close last ZipEntry
			
			System.out.println("Length : " + ls.size());
			String array[] = new String[ls.size()];
			int ctr = 0;
			for(String val:ls) {
				array[ctr] = val;
				ctr+=1;
			}
			return array;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
