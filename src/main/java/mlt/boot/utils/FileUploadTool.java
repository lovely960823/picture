package mlt.boot.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Base64;
import java.util.Iterator;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.Java2DFrameConverter;
import org.bytedeco.javacv.FrameGrabber.Exception;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.multipart.MultipartFile;

import mlt.boot.config.AppGetBean;
import mlt.boot.entity.FileEntity;


//文件上传工具
public class FileUploadTool {
	@Autowired
	private Environment env;

	// 文件最大500M
	private static long upload_maxsize = 50000 * 1024 * 1024;
	// 文件允许格式
	private static String[] allowFiles = { ".rar", ".doc", ".docx", ".zip", ".pdf", ".txt", ".swf", ".xlsx", ".gif",
			".png", ".jpg", ".jpeg", ".bmp", ".xls", ".mp4", ".flv", ".ppt", ".avi", ".mpg", ".wmv", ".3gp", ".mov",
			".asf", ".asx", ".vob", ".wmv9", ".rm", ".rmvb" };
	// 允许转码的视频格式（ffmpeg）
	private static String[] allowFLV = { ".avi", ".mpg", ".wmv", ".3gp", ".mov", ".asf", ".asx", ".vob" };
	// 允许的视频转码格式(mencoder)
	private static String[] allowAVI = { ".wmv9", ".rm", ".rmvb" };
	
	private Environment getEnvironment(){
		return (Environment) AppGetBean.getBean("environment");
	}

	public FileEntity createFile(String logoPathDir, MultipartFile multipartFile,String path, HttpServletRequest request) throws IOException {
		
		Environment env = getEnvironment();
		FileEntity entity = new FileEntity();
		boolean bflag = false;
		String fileName = multipartFile.getOriginalFilename().toString();
		// 判断文件不为空
		if (multipartFile.getSize() != 0 && !multipartFile.isEmpty()) {
			bflag = true;
			// 判断文件大小
			if (multipartFile.getSize() <= upload_maxsize) {
				bflag = true;
				// 文件类型判断
				if (this.checkFileType(fileName)) {
					bflag = true;
				} else {
					bflag = false;
					System.out.println("文件类型不允许");
				}
			} else {
				bflag = false;
				System.out.println("文件大小超范围");
			}
		} else {
			bflag = false;
			System.out.println("文件为空");
		}
		if (bflag) {
			// String logoPathDir = "/video/";
			//String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);
			String logoRealPathDir = path+logoPathDir;
			// 上传到本地磁盘
			// String logoRealPathDir = "E:/upload";
			File logoSaveFile = new File(logoRealPathDir);
			if (!logoSaveFile.exists()) {
				logoSaveFile.mkdirs();
			}
			String name = fileName.substring(0, fileName.lastIndexOf("."));
			// 新的文件名
			String newFileName = this.getName(name);
			// 文件扩展名
			String fileEnd = this.getFileExt(fileName);
			// 绝对路径
			String fileNamedirs = logoRealPathDir + File.separator + newFileName + fileEnd;
			File filedirs = new File(fileNamedirs);
			// 转入文件
			try {
				multipartFile.transferTo(filedirs);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 相对路径
			entity.setType(fileEnd);
			String fileDir = logoPathDir +"/"+ newFileName + fileEnd;
			// size存储为String
			String size = this.getSize(filedirs);
			// 源文件保存路径
			String aviPath = filedirs.getAbsolutePath();
			if (aviPath != null) {

				entity.setSize(size);
				entity.setPath("/"+fileDir);
				entity.setTitleOrig(name);
				entity.setTitleAlter(newFileName);
				Timestamp timestamp = new Timestamp(System.currentTimeMillis());
				entity.setUploadTime(timestamp);
				//设置封面图片
				String pngPath = "";
		        FFmpegFrameGrabber ff=null;
				try {
					ff = FFmpegFrameGrabber.createDefault(new File(aviPath));
				} catch (Exception e) {
					e.printStackTrace();
				}

			      ff.start();
			      int ffLength = ff.getLengthInFrames();
			      Frame f;
			      int i = 0;
			      String weizhi="";
			      while (i < ffLength) {
			          f = ff.grabFrame();
			          //截取第6帧
			          if ((i > 20) && (f.image != null)) {
			              //生成图片的相对路径 例如：pic/uuid.png
			              pngPath = newFileName+".png";
			              //执行截图并放入指定位置
			              //System.out.println("存储图片 ： " + (dir + pngPath));
			              weizhi = doExecuteFrame(f, env.getProperty("videoPath") + pngPath);
			              break;
			          }
			          i++;
			      }
			      ff.stop();
				entity.setPic("/video/"+pngPath);
				return entity;
			}
		} else {
			return null;
		}
		return entity;

	}

	/**
	 * 文件类型判断
	 *
	 * @param fileName
	 * @return
	 */
	private boolean checkFileType(String fileName) {
		Iterator<String> type = Arrays.asList(allowFiles).iterator();
		while (type.hasNext()) {
			String ext = type.next();
			if (fileName.toLowerCase().endsWith(ext)) {
				return true;
			}
		}

		return false;
	}

	/**
	 * 视频类型判断(flv)
	 *
	 * @param fileName
	 * @return
	 */
	private boolean checkMediaType(String fileEnd) {
		Iterator<String> type = Arrays.asList(allowFLV).iterator();
		while (type.hasNext()) {
			String ext = type.next();
			if (fileEnd.equals(ext)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 视频类型判断(AVI)
	 *
	 * @param fileName
	 * @return
	 */
	private boolean checkAVIType(String fileEnd) {
		Iterator<String> type = Arrays.asList(allowAVI).iterator();
		while (type.hasNext()) {
			String ext = type.next();
			if (fileEnd.equals(ext)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 获取文件扩展名
	 *
	 * @return string
	 */
	private String getFileExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}

	/**
	 * 依据原始文件名生成新文件名 UUID：全局唯一标识符，由一个十六位的数字组成,由三部分组成：当前日期和时间、时钟序列、全局唯一的IEEE机器识别号
	 * 
	 * @return string
	 */
	private String getName(String fileName) {
		Random random = new Random();
		return "" + random.nextInt(10000) + System.currentTimeMillis();
		// return UUID.randomUUID().toString() + "_" + fileName;

	}

	/**
	 * 文件大小，返回kb.mb
	 * 
	 * @return
	 */
	private String getSize(File file) {
		String size = "";
		long fileLength = file.length();
		DecimalFormat df = new DecimalFormat("#.00");
		if (fileLength < 1024) {
			size = df.format((double) fileLength) + "BT";
		} else if (fileLength < 1048576) {
			size = df.format((double) fileLength / 1024) + "KB";
		} else if (fileLength < 1073741824) {
			size = df.format((double) fileLength / 1048576) + "MB";
		} else {
			size = df.format((double) fileLength / 1073741824) + "GB";
		}

		return size;

	}

	
	private static String doExecuteFrame(Frame f, String targerFilePath) {
        String imagemat = "png";
        if (null == f || null == f.image) {
            return null;
        }
        Java2DFrameConverter converter = new Java2DFrameConverter();
        BufferedImage bi = converter.getBufferedImage(f);
        File output = new File(targerFilePath);
        System.err.println("output="+output);
        try {
            ImageIO.write(bi, imagemat, output);
            return output.toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
		return null;
    }
}

