package mlt.boot.config;

import java.nio.charset.Charset;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestTemplate;

@Configuration
public class HttpCofig {

	/**
	 * Http请求格式处理
	 * @return
	 */
	@Bean    
	public RestTemplate getRestTemplate(){        
		RestTemplate restTemplate = new RestTemplate();        //将默认的编码格式指定成utf-8        
		StringHttpMessageConverter converter = new StringHttpMessageConverter();        
		converter.setDefaultCharset(Charset.forName("utf-8"));//处理乱码        
		restTemplate.getMessageConverters().set(1,converter);        
		return restTemplate;    
	}
}
