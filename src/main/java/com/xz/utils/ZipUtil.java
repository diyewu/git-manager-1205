package com.xz.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * @author dean.wu
 * 解压文件+读取文件
 */
public class ZipUtil {
	public static void main(String[] args) {
		try {
			// unZipFiles("G:\\tmp\\112.zip","G:\\tmp\\");
			Map<String,String> map = new HashMap<String, String>();
			readFiles("G:\\tmp\\112",map);
			System.out.println(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void unZipFiles(String zipPath, String descDir) throws IOException {
		unZipFiles(new File(zipPath), descDir);
	}

	public static void unZipFiles(File zipFile, String descDir)
			throws IOException {
		File pathFile = new File(descDir);
		if (!pathFile.exists()) {
			pathFile.mkdirs();
		}
		ZipFile zip = new ZipFile(zipFile);
		for (Enumeration entries = zip.entries(); entries.hasMoreElements();) {
			InputStream in = null;
			OutputStream out = null;
			try {
				ZipEntry entry = (ZipEntry) entries.nextElement();
				String zipEntryName = entry.getName();
				in = zip.getInputStream(entry);
				String outPath = (descDir + zipEntryName).replaceAll("\\*", "/");

				// 获取当前file的父路径,这才是文件夹
				File file = new File(outPath.substring(0,
						outPath.lastIndexOf('/')));

				// 判断路径是否存在,不存在则创建文件路径
				if (!file.exists()) {
					file.mkdirs();
				}
				// 判断文件全路径是否为文件夹,如果是上面已经上传,不需要解压
				if (new File(outPath).isDirectory()) {
					continue;
				}
				// 输出文件路径信息
//				System.out.println(outPath);

				out = new FileOutputStream(outPath);
				byte[] buf1 = new byte[1024];
				int len;
				while ((len = in.read(buf1)) > 0) {
					out.write(buf1, 0, len);
				}
				in.close();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (in != null) {
					in.close();
				}
				if (out != null) {
					out.close();
				}
			}
		}
	}

	public static void readFiles(String path,Map<String,String> map) {
		// String path="G:\\tmp\\112";
		System.out.println("path=" + path);
		File file = new File(path);
		File[] tempList = file.listFiles();
		System.out.println("该目录下对象个数：" + tempList.length);
		for (int i = 0; i < tempList.length; i++) {
			if (tempList[i].isFile()) {
				System.out.println("文     件：" + tempList[i]);
				System.out.println("文     件：" + tempList[i].getName());
				map.put(tempList[i].getName(), tempList[i].toString());
			}
			// 文件夹
			if (tempList[i].isDirectory()) {
				readFiles(tempList[i].toString(),map);
			}
		}
	}
}