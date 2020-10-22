package mlt.boot.enums;

import lombok.Getter;
import lombok.Setter;

public enum PlatformCodeEnum {

	SUCCESS("10000", "成功响应"),
	
	SAVE_ERROR("10001", "保存失败"),

	DELETE_ERROR("10002", "删除失败"),

	PARAM_IS_NULL("10003", "参数为空"),
	
	RESULT_IS_NULL("10086", "空结果集"),

	SYSTEM_ERROR("90000", "系统错误"),

	TOKEN_ERROR("99999","TOKEN失效");


	@Setter
	@Getter
	private String code;
	@Setter
	@Getter
	private String value;

	PlatformCodeEnum(String code, String value) {
		this.code = code;
		this.value = value;
	}

}
