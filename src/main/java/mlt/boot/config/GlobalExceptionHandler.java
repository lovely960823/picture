package mlt.boot.config;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(value=RuntimeException.class)
	public String globalExceptionHandler(){
		return "exception";
	}
}
