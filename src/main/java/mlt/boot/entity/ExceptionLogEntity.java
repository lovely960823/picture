package mlt.boot.entity;

import javax.persistence.Table;

import lombok.Data;

@Table(name="ExceptionLog")
@Data
public class ExceptionLogEntity {

	private Integer Id;
	private String excRequParam;
	private String excName;
	private String excMessage;
	private String operUserId;
	private String operUserName;
	private String operMethod;
	private String operIp;
	private String operCreateTime;
}
