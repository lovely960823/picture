package mlt.boot.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import mlt.boot.entity.Menu;
import mlt.boot.mapper.MenuMapper;
import mlt.boot.result.Result;
import net.coobird.thumbnailator.Thumbnails;

@Controller
public class TeacherController {

	@Autowired
	MenuMapper menuMapper;
	
	@Autowired
	private Environment env;//图片存储位置
	
	
	/**
	 * 递归拿到所有节点
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
	
	
	/**
	 * 根据id获取加载数据
	 * @param request
	 * @param id
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/teacher/list")
	@ResponseBody
	public Result<PageInfo<Menu>> liu(HttpServletRequest request,String id,String searchName,Integer page) throws IOException{
		/**
		 * 使用分页修改为流式加载 每次加载20条 2020年10月10日16:02:30 ljw  
		 */
		Result<PageInfo<Menu>>  result = new Result<PageInfo<Menu>> ();
		PageHelper.startPage(page,20);
		if(!StringUtils.isEmpty(searchName)){
			List<Menu> list = menuMapper.findByName(searchName);
			//统计每个文件夹下面的照片数量
			for(int i=0;i<list.size();i++){
				if(list.get(i).getFolder().equals("1")){
					Integer counts=0;
					Menu menu = menuMapper.findPidById(list.get(i).getId().toString());
					ArrayList<Integer> idList = new ArrayList<Integer>();
					HashMap<Integer, Menu> hashMap1 = new HashMap<Integer,Menu>();
					hashMap1.put(1, menu);
					delfolders(hashMap1,idList);//已经获取到该节点下面所有的节点了
					for(int n=0;n<idList.size();n++){
						Menu m = menuMapper.findPidById(idList.get(n).toString());
						if(!m.getFolder().equals("1")){
							counts+=1;
						}
					}
					list.get(i).setCounts(counts);
				}else if(list.get(i).getFolder().equals("0")){//所有图片
					if(StringUtils.isEmpty(list.get(i).getMinipath())){//缩略图是否为空
						File file1 = new File(env.getProperty("virPath")+list.get(i).getImg());//这个等同于D:/picpath/"+list.get(i).getImg()
						if(file1.exists()){
							Thumbnails.of(env.getProperty("virPath")+list.get(i).getImg()).size(400,500).toFile(env.getProperty("minipath")+list.get(i).getImg());
							Menu m1= list.get(i);
							m1.setMinipath("/minipic"+m1.getImg());
							menuMapper.updateByPrimaryKeySelective(m1);
						}
					}
					list.get(i).setImg("/minipic"+list.get(i).getImg());
				}
			}
			PageInfo<Menu> pageInfo = new PageInfo<Menu>(list);
			result.setData(pageInfo);
		}else{
			List<Menu> list = menuMapper.findByParentId(id);
			//统计每个文件夹下面的照片数量
			for(int i=0;i<list.size();i++){
				if(list.get(i).getFolder().equals("1")){//文件夹时需要统计子节点数量
					Integer counts=0;
					Menu menu = menuMapper.findPidById(list.get(i).getId().toString());
					ArrayList<Integer> idList = new ArrayList<Integer>();
					HashMap<Integer, Menu> hashMap1 = new HashMap<Integer,Menu>();
					hashMap1.put(1, menu);
					delfolders(hashMap1,idList);//已经获取到该节点下面所有的节点了
					for(int n=0;n<idList.size();n++){
						Menu m = menuMapper.findPidById(idList.get(n).toString());
						if(!m.getFolder().equals("1")){
							counts+=1;
						}
					}
					list.get(i).setCounts(counts);
				}else if(list.get(i).getFolder().equals("0")){//所有图片
					if(StringUtils.isEmpty(list.get(i).getMinipath())){//缩略图是否为空
						File file1 = new File(env.getProperty("virPath")+list.get(i).getImg());//这个等同于D:/picpath/"+list.get(i).getImg()
						if(file1.exists()){
							Thumbnails.of(env.getProperty("virPath")+list.get(i).getImg()).size(400,500).toFile(env.getProperty("minipath")+list.get(i).getImg());
							Menu m1= list.get(i);
							m1.setMinipath("/minipic"+m1.getImg());
							menuMapper.updateByPrimaryKeySelective(m1);
						}
					}
					list.get(i).setImg("/minipic"+list.get(i).getImg());
				}
			}
			PageInfo<Menu> pageInfo = new PageInfo<Menu>(list);
			result.setData(pageInfo);
		}
		return result;
	}
	
	
	/**
	 * 回收站数据
	 * @param request
	 * @param id
	 * @param searchName
	 * @return
	 */
	@RequestMapping("/teacher/trash")
	@ResponseBody
	public Result<List<Menu>> trash(HttpServletRequest request,String id,String searchName){
		Result<List<Menu>>  result = new Result<List<Menu>> ();
			
			List<Menu> list = menuMapper.trash();
			list.forEach(menu->{
				menu.setImg("/minipic"+menu.getImg());
			});
			result.setData(list);
		return result;
	}
	
	
	
	//*************************************************
	
	/**
	 * 双击相册跳转到刘老师的树页面
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/main/{id}")
	public String teacherliu(@PathVariable("id")String id,HttpServletRequest request){
		request.setAttribute("id", id);
		Menu m = menuMapper.findPidById("1");
		request.setAttribute("m",m);//皮肤
		return "/teacher/liu_tree";
	}
	
	
	//树目录点击，双击相册
	@RequestMapping("/teacher/liu/fileList")
	public String fileList(String id,HttpServletRequest request){
		request.setAttribute("id", id);
		//垃圾桶
		if(id.equals("5")){
			return "teacher/trash";
		}
		//查询生成面包屑
		Menu menu = menuMapper.findPidById(id);
		ArrayList<Integer> idList = new ArrayList<Integer>();
		idList.add(Integer.parseInt(id));
		getParentId(menu,idList);
		StringBuffer sb = new StringBuffer();
		if(idList.size()>0){
			if(idList.size()==1){
				Menu m1 = menuMapper.findPidById(idList.get(0).toString());
				sb.append(" <a href='javascript:void(0);' onclick='viewAndChecknode("+m1.getId()+")' style='color: #804A33;font-weight: 900'>"+m1.getName()+"</a> ");
			}else{
				for(int i=idList.size()-1;i>0;i--){
					Menu m1 = menuMapper.findPidById(idList.get(i).toString());
					if(i==(idList.size()-1)){
						sb.append(" <a href='javascript:void(0)' onclick='viewAndChecknode("+m1.getId()+")'>"+m1.getName()+"</a> "+">");//第一级不能点击
					}else{
						sb.append(" <a href='javascript:void(0)' onclick='viewAndChecknode("+m1.getId()+")'>"+m1.getName()+"</a> "+">");
					}
				}
				Menu m1 = menuMapper.findPidById(idList.get(0).toString());
				sb.append(" <a href='javascript:void(0)' onclick='viewAndChecknode("+m1.getId()+")' style='color: #804A33;font-weight: 900'>"+m1.getName()+"</a>");
			}
		}
		//查询生成要点击查看的图片
		List<Menu> findViewPic = menuMapper.findViewPic(id);
		request.setAttribute("findViewPic", findViewPic);
		request.setAttribute("getHeader", sb.toString());
		return "teacher/teacher_liu";
	}
	
	/**
	 * 递归拿到所有父节点
	 * @param menu
	 * @param idList
	 */
	private void getParentId(Menu menu, ArrayList<Integer> idList) {
		Menu m1 = menuMapper.findPidById(menu.pId);
		if(m1!=null){
			idList.add(m1.getId());
			Menu findPidById = menuMapper.findPidById(m1.getId().toString());
			getParentId(findPidById,idList);
		}
	}
}
