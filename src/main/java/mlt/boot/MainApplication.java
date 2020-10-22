package mlt.boot;

import java.io.File;
import java.util.Date;

import org.apache.ibatis.annotations.CacheNamespace;
//import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import tk.mybatis.spring.annotation.MapperScan;

/**
 * ljw 2020��8��12��17:40:59
 * @author Administrator
 *
 */
@SpringBootApplication
@MapperScan("mlt.boot.mapper")//ʹ由于使用了tk.mapper  这里的扫包就变成了 tk.mapper的
//@CacheNamespace 在这开启没起作用 放到mapper上使用
public class MainApplication extends SpringBootServletInitializer{

	public static void main(String[] args) {
		File f= new File("D:\\picpath\\");
		if(!f.exists()){
			f.mkdir();
		}
		System.err.println("Initializer Success!!!!"+new Date());
		SpringApplication.run(MainApplication.class, args);
	}
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(MainApplication.class);
    }
}
