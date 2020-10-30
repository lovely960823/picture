package mlt.boot.entity;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Table(name="menu")
@Data
public class Menu implements Serializable{

	@Id
	private Integer id;
	@Column(name="pId")
	public String pId;//获取json数据的时候区分大小写
	
	@Column(name="isParent")
	public String isParent;//�ӽڵ��ʱ�������Ը��ڵ����ʽ��ʾ
	private String name;
	private String url;
	private String icon;
	private String font;
	private String folder;
	private String img;
	private String description;
	private String delflag;//0������  1����Ѿ�ɾ��
	
	private String minipath;
	private String created;
	private String updated;
	@Transient
	private Integer counts;//����µ���Ƭ����
	
	
	//��ע��Ϣ
	private String mc;//���
	private String dh;//����
	private String sj;//ʱ��
	private String rw;//����
	private String bj;//����
	
}
