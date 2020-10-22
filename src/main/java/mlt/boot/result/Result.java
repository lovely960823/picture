package mlt.boot.result;

import java.io.Serializable;


import com.github.pagehelper.PageInfo;

import lombok.Data;
import mlt.boot.enums.PlatformCodeEnum;



@Data
public class Result<T> implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 状态信息，正确返回OK，否则返回 ERROR，如果返回ERROR则需要填写Message信息
	 */
	private Status status = Status.OK;

	public enum Status {
		OK, ERROR
	}

	/**
	 *返回码
	 */
	private String code = PlatformCodeEnum.SUCCESS.getCode();

	/**
	 * 提示信息
	 */
	private String message = PlatformCodeEnum.SUCCESS.getValue();

	/**
	 * 数据对象
	 */
	private  T data;

	/**
	 * 时间戳
	 */
	private Long date = System.currentTimeMillis();


	public static <T> Result<T> ok() {
		return new Result<T>();
	}

	public static <T> Result<T> ok(String message) {
		Result<T> result = new Result<T>();
		result.setMessage(message);
		return result;
	}

	public static <T> Result<T> ok(PlatformCodeEnum code, T data) {
		Result<T> result = new Result<T>();
		result.setCode(code.getCode());
		result.setMessage(code.getValue());
		result.setData(data);
		return result;
	}

	public static <T> Result<T> ok(T data) {
		Result<T> result = new Result<T>();
		result.setMessage(PlatformCodeEnum.SUCCESS.getValue());
		result.setCode(PlatformCodeEnum.SUCCESS.getCode());
		result.setData(data);
		return result;
	}

	public static <T> Result<T> ok(String message,T data) {
		Result<T> result = new Result<T>();
		result.setMessage(message);
		result.setData(data);
		return result;
	}

	public static <T> Result<T> error(String message) {
		Result<T> result = new Result<T>();
		result.setStatus(Status.ERROR);
		result.setCode(PlatformCodeEnum.SYSTEM_ERROR.getCode());
		result.setMessage(message);
		return result;
	}

	public static <T> Result<T> error(String code,String message) {
		Result<T> result = new Result<T>();
		result.setStatus(Status.ERROR);
		result.setCode(code);
		result.setMessage(message);
		return result;
	}

	public static <T> Result<T> error(PlatformCodeEnum code) {
		Result<T> result = new Result<T>();
		result.setStatus(Status.ERROR);
		result.setCode(code.getCode());
		result.setMessage(code.getValue());
		return result;
	}

	public static boolean isNullOrAmpty(Result result){
		if (result == null || result.getData() == null  ){
			return  true;
		}
		if (result.getData() instanceof  PageInfo) {
			PageInfo pageInfo = (PageInfo)result.getData();
			if (pageInfo.getList() == null || pageInfo.getList().isEmpty()) {
				return  true;
			}
		}
		return false;
	}

}
