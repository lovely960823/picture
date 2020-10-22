package mlt.boot.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class Myconfig implements WebMvcConfigurer{

	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		/**
		 * 虚拟路径
		 */
		registry.addResourceHandler("/**").addResourceLocations("file:D:/picpath/");
		
	}
}
