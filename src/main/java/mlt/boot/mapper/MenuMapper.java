package mlt.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import mlt.boot.entity.FileEntity;
import mlt.boot.entity.Menu;
import tk.mybatis.mapper.common.Mapper;

@CacheNamespace  //必须实现序列化
public interface MenuMapper extends Mapper<Menu> {

	@Select(" select * from menu where pId=2 and delflag='0' ")
	List<Menu> findLiuIndex();

	/**
	 * 加载显示数据
	 * @param id
	 * @return
	 */
	@Select(" select * from menu where pId= #{id} and delflag='0' order by find_in_set(folder,'1,3,0'),id ")
	List<Menu> findByParentId(@Param("id")String id);

	/**
	 * 加载树
	 * @return
	 */
	@Select(" select * from menu where folder ='1' and id!='1' and delflag='0' order by id")
	List<Menu> findAll();


	/**
	 * 根据id查找
	 * select * from menu where id = #{id}
	 * @param id
	 * @return
	 */
	@Select(" select * from menu where id = #{id} ")
	Menu findPidById(@Param("id")String id);

	@Select(" select * from menu where pId = #{id} and delflag='0' ")
	List<Menu> findAllByParentId(@Param("id")int id);

	@Update(" update menu set img=#{str} where id='1' ")
	void update(@Param("str")String str);

	/**
	 * 输入框查询  添加排序
	 * @param name
	 * @return
	 */
	@Select(" select * from menu where name like concat ('%', #{name},'%') and delflag='0' order by find_in_set(folder,'1,3,0'),id ")
	List<Menu> findByName(@Param("name")String name);

	/**
	 * 根据id删除
	 * @param id
	 * @return
	 */
	@Update(" update menu set delflag='1' where id= #{id} ")
	//@Delete(" delete from  menu  where id= #{id} ")
	int delById(@Param("id")String id);

	@Update(" update menu set pId=#{moveid} where id=#{id} ")
	int move(@Param("id")String id, @Param("moveid")String moveid);

	/**
	 * 移动树
	 * @param id
	 * @return
	 */
	@Select(" select * from menu where folder ='1' and id!='1' and id!='96' and id!=#{id} and delflag='0'  order by id")
	List<Menu> findAllmoveTree(@Param("id")String id);

	
	/**
	 * 获取当前节点下第一层的所有图片
	 * @param id
	 * @return
	 */
	@Select(" select * from menu where pId=#{id} and folder='0' and delflag='0' order by id  ")
	List<Menu> findViewPic(@Param("id")String id);

	/**
	 * 更新相册
	 * @param name
	 * @param img
	 * @param id
	 * @return
	 */
	@Update(" update menu set name=#{name} ,img=#{img} where id=#{id} ")
	int updatePicFolder(@Param("name")String name, @Param("img")String img, @Param("id")String id);

	/**
	 * 更新图片名称
	 * @param id
	 * @param name
	 * @return
	 */
	@Update(" update menu set name=#{name} where id=#{id} ")
	int updatepic(@Param("id")String id, @Param("name")String name);

	/**
	 * 备注修改
	 * @param menu
	 * @return
	 */
	@Update(" update menu set name=#{menu.name} ,dh=#{menu.dh},sj=#{menu.sj},rw=#{menu.rw},bj=#{menu.bj} where id=#{menu.id} ")
	int updateBz(@Param("menu")Menu menu);

	/**
	 * 粘贴操作
	 * @param integer
	 * @param m
	 * @return
	 */
	@Update(" update menu set name=#{menu.name} ,dh=#{menu.dh},sj=#{menu.sj},rw=#{menu.rw},bj=#{menu.bj} where id=#{id} ")
	int paste(@Param("id")Integer id, @Param("menu")Menu menu);

	/**
	 * 垃圾桶
	 * @return
	 */
	@Select(" select * from menu where id!='1' and  delflag='1' and (folder='0' or folder='3') order by id  ")
	List<Menu> trash();

	/**
	 * 删除还原
	 * @param id
	 * @return
	 */
	@Update(" update menu set delflag='0' where id = #{id} ")
	int huanyuan(String id);

	/**
	 * 记录的真实删除
	 * @param id
	 * @return
	 */
	@Delete(" delete from menu where id = #{id} ")
	int realdel(String id);
	
	@Select(" select img from menu where id = #{id}")
	String findPathById(String id);
	
	@Insert("INSERT INTO `menu` (name,pId,folder,img,url) VALUES (#{entity.titleOrig},#{entity.pId},'3',#{entity.path},#{entity.pic})")
	void saveFile( @Param("entity")FileEntity entity);


	@Select(" select * from menu limit 10 ")
	List<Menu> findLimitTen();
}
