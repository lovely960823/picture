package mlt.boot.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.filechooser.FileSystemView;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import mlt.boot.entity.Menu;
import mlt.boot.mapper.MenuMapper;
import mlt.boot.result.Result;
import mlt.boot.utils.FileUploadUtils;
import sun.misc.BASE64Decoder;

/**
 * 使用tk.mapper 记得一定要给id加上注解
 * @author ljw
 *
 */
@Controller
public class CommonController {

	@Autowired
	private MenuMapper menuMapper;
	
	@Autowired
	private Environment env;//图片存储位置
	
	@RequestMapping("/common/data")
	public String dataPage(HttpServletRequest request,String id){
		request.setAttribute("id", id);
		return "common/list";
	}
	
	/**
	 * 新建相册页面
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("/common/tonewfolder")
	public String tonewfolder(HttpServletRequest request,String id){
		request.setAttribute("id", id);
		return "common/avatar";
	}
	/**
	 * 第二级页面新建相册页面
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("/common/toSecNewfolder")
	public String toSecNewfolder(HttpServletRequest request,String id){
		request.setAttribute("id", id);
		return "common/secAvatar";
	}
	
	/**
	 * 创建文件夹
	 * @param request
	 * @param map
	 * @return
	 * @throws IOException
	 */
/*	@RequestMapping("/common/newfolder")
	@ResponseBody
	public Result newfolder(HttpServletRequest request,String name,String id,String img) throws IOException{
		System.err.println("id="+id);
		if(StringUtils.isEmpty(id)){
			 return Result.error("请刷新重试!");
		}
		Menu menu = new Menu();
		//img这玩意是个base64的东西 由于我这边前端的和后端的不一致，用replace处理一下
		if(!StringUtils.isEmpty(img)){
			//img =img.replace(" ", "+");
			BASE64Decoder decoder = new BASE64Decoder();
			String imgName= UUID.randomUUID().toString()+".png";
			FileOutputStream write = new FileOutputStream(new File(env.getProperty("virPath")+imgName));
			byte[] decoderBytes = decoder.decodeBuffer(img.split(",")[1]);
			write.write(decoderBytes);
			write.close();
			menu.setImg("/"+imgName);
		}else{
			menu.setImg("/static/images/notfound.jpg");
		}
		menu.setFolder("1");
		menu.setName(name);
		menu.setPId(id);
		menu.setIsParent("true");
		int insertSelective = menuMapper.insertSelective(menu);
		if(insertSelective>0){
			return Result.ok();
		}
		return Result.error("发生错误");
	}*/
	@RequestMapping("/common/newfolder")
	@ResponseBody
	public Result updateAvatar(@RequestParam("avatarfile") MultipartFile file,String xcName,String id,String menuId){
			Menu menu = new Menu();
	        try{
	        	if(!menuId.isEmpty()){
	        		Menu menus = menuMapper.findPidById(menuId);
	        		String oldFile = menus.getImg();
	        		String avatar="";
	        		if (file.getSize()>0){
	    		            avatar = FileUploadUtils.upload(env.getProperty("virPath"), file);
	    		        }
	        		int i = menuMapper.updatePicFolder(xcName,"/"+avatar,menuId);
	        		//只有在修改图片后才会删除旧图片
	        		File f1= new File(env.getProperty("virPath")+oldFile);
	        		f1.delete();
	        		return Result.ok();
	        	}else{
	        		
	        		if (file.getSize()>0){
		                String avatar = FileUploadUtils.upload(env.getProperty("virPath"), file);
		                menu.setImg("/"+avatar);
		            }else{
		            	menu.setImg("/static/images/ic_moren.png");
		            }
		            menu.setFolder("1");
		    		menu.setName(xcName);
		    		menu.setPId(id);
		    		menu.setIsParent("true");
		    		int insertSelective = menuMapper.insertSelective(menu);
		    		if(insertSelective>0){
		    			return Result.ok();
		    		}
		    		
	        	}
	        	return Result.error("发生错误");
	        }
	        catch (Exception e)
	        {
	            return Result.error(e.getMessage());
	        }
	    }
	@RequestMapping("/common/touploadFile")
	public String touploadFile(HttpServletRequest request,String id){
		request.setAttribute("id", id);
		return "common/touploadFile";
	}
	/**
	 * 上传图片
	 * @param file
	 * @param id
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/common/uploadFile")
	@ResponseBody
	public int upfile(MultipartFile file,String id) throws IllegalStateException, IOException{
	
		String fileName = file.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf('.') + 1 );
		String newFileName = UUID.randomUUID().toString() + "." + ext;
		file.transferTo(new File(env.getProperty("virPath")+newFileName));
		
		//名称不要后缀格式
		String name = fileName.substring(0, fileName.lastIndexOf('.'));
		Menu menu1 = new Menu();
		menu1.setFolder("0");
		menu1.setPId(id);
		menu1.setName(name);
		menu1.setImg("/"+newFileName);
		int i = menuMapper.insertSelective(menu1);
		return 1;
	}
	
	/**
	 * 图片查看
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("/common/viewPic")
	public String viewPic(HttpServletRequest request,String id){
		Menu menu = menuMapper.findPidById(id);
		request.setAttribute("menu", menu);
		return "common/viewPic";
	}
	
	/***
	 * 换皮肤
	 * @return
	 */
	@RequestMapping("/common/tochangeSkin")
	public String tochangeSkin(){
		return "common/changeskin";
	}
	
	/**
	 * 设置选中的皮肤
	 * @param id
	 * @return
	 */
	@RequestMapping("/common/setskin")
	@ResponseBody
	public Result setskin(String id){
		Menu menu = menuMapper.findPidById("1");
		String str="/static/images/skin"+id+".png";
		menuMapper.update(str);
		return Result.ok("切换成功");
	}
	
	/**
	 * 文件删除
	 * @param id
	 * @return
	 */
	@RequestMapping("/common/delfile")
	@ResponseBody
	public Result delfile(String id){
		Menu menu = menuMapper.findPidById(id);
		if(StringUtils.isEmpty(id)){
			return Result.error("请刷新后重试");
		}
		if(menu==null){
			return Result.error("请刷新后重试");
		}
		String notDel="5,6,7,8,9,10,11,12,13,14,15";//固定不能删除的
		String str[]=notDel.split(",");
		for (int i = 0; i < str.length; i++) {
			if(id.equals(str[i])){
				return Result.error("该文件不能删除");
			}
		}
		if(menu.getFolder().equals("1")){//相册删除
			ArrayList<Integer> idList = new ArrayList<Integer>();
			idList.add(Integer.parseInt(id));
			HashMap<Integer, Menu> hashMap1 = new HashMap<Integer,Menu>();
			hashMap1.put(1, menu);
			delfolders(hashMap1,idList);
			//idList
			for(int i=0;i<idList.size();i++){
				//如果是相册 直接真删除  2020年10月10日17:34:55 ljw
				Menu findPidById = menuMapper.findPidById(idList.get(i).toString());
				if(findPidById.getFolder().equals("1")){
					menuMapper.realdel(idList.get(i).toString());
					File f = new File(env.getProperty("virPath")+findPidById.getImg());
					f.delete();
				}else{
					menuMapper.delById(idList.get(i).toString());
				}
			}
			return Result.ok(menu);//返回数据用于刷洗判断
		}else{ //图片删除
			int i = menuMapper.delById(id);
			if(i>0){
				return Result.ok(menu);
			}else{
				return Result.error("ɾ请刷新后重试");
			}
		}
	}
	
	/**
	 * 递归拿到所有子节点
	 * @param hashMap1
	 * @param idList
	 */
	private void delfolders(HashMap<Integer,Menu> hashMap1,ArrayList<Integer> idList) {
		HashMap<Integer,Menu> hashMap = new HashMap<Integer,Menu>();
		for(Integer x :hashMap1.keySet()){
			Menu menu = hashMap1.get(x);
			List<Menu> list = menuMapper.findAllByParentId(menu.getId());
			if(!list.isEmpty()){
				for(int i=0;i<list.size();i++){
					Menu menu2 = list.get(i);
					idList.add(menu2.getId());
					if("1".equals(menu2.getFolder())){
						hashMap.put(menu2.getId(), menu2);
					}
				}
			}
			
		}
		if(!hashMap.isEmpty()){
			delfolders(hashMap,idList);
		}
	}
	
	//todo
	@RequestMapping("/common/download")
	public ResponseEntity<byte[]> download(String id,HttpServletRequest req, HttpServletResponse response) throws Exception{
		//获取当前桌面路径
		FileSystemView fsv = FileSystemView.getFileSystemView();
		File com=fsv.getHomeDirectory();   
		System.out.println(com.getPath());
		Menu menu = menuMapper.findPidById(id);
		//找到文件
		File file = new File(env.getProperty("virPath") + menu.getImg());
		////设置http协议头部    拿到文件后缀
		HttpHeaders headers = new HttpHeaders();
		String ext = menu.getImg().substring(menu.getImg().lastIndexOf('.') + 1 );
		//文件新名称
		String fileName = new String((menu.getName()+"."+ext).getBytes("UTF-8"),"iso-8859-1");
		headers.setContentDispositionFormData("attachment", fileName);   
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
		//获取文件路径
		String targetDirectory = file.toString();
		File f=new File(targetDirectory);  
		//返回文件字节数组
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(f),headers, HttpStatus.CREATED);
	}
	
	/**
	 * 移动到页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/common/moveto")
	public String moveto(String id,String huanyuan,HttpServletRequest request){
		request.setAttribute("id", id);
		request.setAttribute("huanyuan", huanyuan);
		return "common/moveto";
	}
	
	/**
	 * 移动操作
	 * @param id
	 * @return
	 */
	@RequestMapping("/common/domove")
	@ResponseBody()
	public Result domove(String id,String moveid,String huanyuan){
		if(StringUtils.isEmpty(id)||StringUtils.isEmpty(moveid)){
			return Result.error("发生错误，请刷新后重试");
		}
		if(id.equals(moveid)){
			return Result.error("不能移动到自己");
		}
		
		if(!StringUtils.isEmpty(huanyuan)){//垃圾桶操作
			menuMapper.huanyuan(id);
		}
		int i= menuMapper.move(id,moveid);
		return Result.ok();
	}
	
	/**
	 * 拿到该文件夹下面的第一层图片
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/common/bofang")
	public String bofang(String id,HttpServletRequest request,String type){
		List<Menu> list = menuMapper.findViewPic(id);
		request.setAttribute("list", list);
		if(type.equals("1")){
			return "common/bofang";
		}else{
			return "common/bofang2";
		}
	}
	
	/**
	 * 修改相册页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/common/toupdatefolder")
	public String toupdatefolder(String id,HttpServletRequest request){
		Menu menu = menuMapper.findPidById(id);
		request.setAttribute("menu", menu);
		request.setAttribute("id", menu.getPId());
		return "common/avatar";
	}
	/**
	 * 第二级页面修改相册页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/common/toSecUpdatefolder")
	public String toSecUpdatefolder(String id,HttpServletRequest request){
		Menu menu = menuMapper.findPidById(id);
		request.setAttribute("menu", menu);
		return "common/secAvatar";
	}
	
	/**
	 * 修改相册
	 * @param name
	 * @param id
	 * @param img
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/common/updatefolder")
	@ResponseBody
	public Result updatefolder(String name,String id,String img) throws IOException{

		if(StringUtils.isEmpty(id)){
			return Result.error("发生意外，请刷新重试");
		}
		Menu menu = menuMapper.findPidById(id);
		String oldFile = menu.getImg();
		String newname="";
		if(!StringUtils.isEmpty(img)){
			if(img.contains("data:image/png;base64")){//是否是base64格式
				String imgName= UUID.randomUUID().toString()+".png";
				//img =img.replace(" ", "+");
				BASE64Decoder decoder = new BASE64Decoder();
				FileOutputStream write = new FileOutputStream(new File(env.getProperty("virPath")+imgName));
				byte[] decoderBytes = decoder.decodeBuffer(img.split(",")[1]);
				write.write(decoderBytes);
				write.close();
				newname="/"+imgName;
				menu.setImg(newname);
				int i = menuMapper.updatePicFolder(name,newname,id);
				//只有在修改图片后才会删除旧图片
				File f1= new File(env.getProperty("virPath")+oldFile);
				f1.delete();
				return Result.ok();
			}else{
				newname=img;
				menu.setImg(newname);
				int i = menuMapper.updatePicFolder(name,menu.getImg(),id);
				return Result.ok();
			}
		}else{
			newname=menu.getImg();
			menu.setImg(newname);
			int i = menuMapper.updatePicFolder(name,menu.getImg(),id);
			return Result.ok();
		}
		/*int i = menuMapper.updatePicFolder(name,newname,id);
		if(i>0){
			if(!StringUtils.isEmpty(oldFile)){
				File f = new File(env.getProperty("virPath")+oldFile);
				//f.delete();
			}
		}
		
		return Result.ok();*/
	}
	
	/**
	 * 编辑图片页面
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/common/toedit1")
	public String toedit1(String id,HttpServletRequest request){
		Menu menu = menuMapper.findPidById(id);
		request.setAttribute("menu", menu);
		return "common/updatepic";
	}
	/**
	 * 编辑图片
	 * @param id
	 * @param name
	 * @return
	 */
	@RequestMapping("/common/updatepic")
	@ResponseBody
	public Result updatepic(String id,String name){
		int i = menuMapper.updatepic(id,name);
		return Result.ok();
	}
	
	/**
	 * 显示备注页面
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/common/toBeizhu")
	public String toBeizhu(String id,HttpServletRequest request){
		Menu menu = menuMapper.findPidById(id);
		request.setAttribute("menu", menu);
		return  "common/beizhu";
	}
	@RequestMapping("/common/player")
	public String player(String id,HttpServletRequest request){
		String path = menuMapper.findPathById(id);
		request.setAttribute("path", path);
		return  "common/uploadVideoResult";
	}
	
	/**
	 * 当前相册或者图片修改备注
	 * @param menu
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/common/updateBz")
	public Result updateBz(Menu menu){
		System.err.println(menu.toString());
		int i = menuMapper.updateBz(menu);
		return Result.ok();
	}
	
	/**
	 * 复制备注
	 * @param id
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/common/copy")
	public Result copy(String id,HttpServletRequest request){
		Menu menu = menuMapper.findPidById(id);
		request.getSession().setAttribute("menu", menu);
		Menu m = (Menu)request.getSession().getAttribute("menu");
		return Result.ok();
	}
	/**
	 * 验证复制备注的session是否还有效
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/common/sessionisvaild")
	public Result sessionisvaild(HttpServletRequest request){
		Menu m = (Menu)request.getSession().getAttribute("menu");
		if(m==null){
			return Result.ok(null);
		}
		return Result.ok(m);
	}
	
	/**
	 * 粘贴备注操作,复制后清除session 方便下次复制操作
	 * @param id
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/common/paste")
	public Result paste(String id,HttpServletRequest request){
		Menu menu = menuMapper.findPidById(id);
		Menu m = (Menu)request.getSession().getAttribute("menu");
		if(menu.getFolder().equals("1")){//�ļ���ɾ��
			ArrayList<Integer> idList = new ArrayList<Integer>();
			idList.add(Integer.parseInt(id));
			HashMap<Integer, Menu> hashMap1 = new HashMap<Integer,Menu>();
			hashMap1.put(1, menu);
			delfolders(hashMap1,idList);
			//idList
			for(int i=0;i<idList.size();i++){
				int count = menuMapper.paste(idList.get(i),m);
			}
			request.getSession().invalidate();
			return Result.ok();
		}else{ 
			int count = menuMapper.paste(Integer.parseInt(id),m);
			request.getSession().invalidate();
			return Result.ok();
		}
	}
	
	/**
	 * 根据id获取备注信息
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/common/tips")
	public Result tips(String id){
		if(StringUtils.isEmpty(id)){
			return Result.error("发生错误，请刷新后重试");
		}
		Menu menu = menuMapper.findPidById(id);
		return Result.ok(menu);
	}
	
	/**
	 * 数据的真实删除
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/common/realdel")
	public Result realdel(String id){
		if(StringUtils.isEmpty(id)){
			return Result.error("发生错误，请刷新后重试");
		}
		String[] arrId = id.split(",");
	for(int j=0;j<arrId.length;j++){
		Menu menu = menuMapper.findPidById(arrId[j]);
		int i = menuMapper.realdel(arrId[j]);
		if(menu.getFolder().equals("0")){
			if(i>0){
				String path = env.getProperty("virPath");
				File f = new File(path+menu.getImg());
				f.delete();
			}else{
				return Result.error("“"+menu.getName()+"” 删除失败，请刷新重试！！！");
			}
		}else if(menu.getFolder().equals("3")){//视频删除
			if(i>0){
				String path = env.getProperty("virPath");
				File f = new File(path+menu.getUrl());
				f.delete();
				File f1 = new File(path+menu.getImg());
				f1.delete();
			}else{
				return Result.error("“"+menu.getName()+"” 删除失败，请刷新重试！！！");
			}
		}
	}
		return Result.ok("删除成功！");
	}
	
 }
