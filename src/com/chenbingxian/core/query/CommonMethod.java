package com.chenbingxian.core.query;
import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class CommonMethod {

	/**
	 * 保存图片
	 * @param file 要保存的文件
	 * @param headPath 文件的目录名
	 */
	public static String saveFile(MultipartFile file, String headPath) throws Exception {
		// 获取上传的图片名称
		String fileName = file.getOriginalFilename();
		// 声明新的图片名称
		String newImgName = "";
		// 图片保存的路径
		String img_path = "D:\\Project\\upload\\pic\\";

		File fileDir = new File(img_path + headPath);
		// 如果文件夹不存在则创建
		if (!fileDir.exists() && !fileDir.isDirectory()) {
			//fileDir.mkdir();创建单级级目录
			fileDir.mkdirs();//创建多级目录
		}

		if (file != null && fileName != null && fileName.length() > 0) {
			newImgName = headPath + UUID.randomUUID() + fileName.substring(fileName.lastIndexOf("."));
			// 创建新图片文件
			File imgFile = new File(img_path + newImgName);
			// 将内存中的图片写入硬盘
			file.transferTo(imgFile);
			// 给传进来的员工对象设置头像图片路径
		}
		return newImgName;
	}

	/**
	 * 删除文件
	 */
	public static boolean deleteFile(String path) {
		boolean flag = false;
		File file = new File(path);
		if (file.isFile() && file.exists()) {
			file.delete();
			flag = true;
		}
		return flag;
	}
}
