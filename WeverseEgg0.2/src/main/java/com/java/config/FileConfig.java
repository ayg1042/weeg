package com.java.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class FileConfig implements WebMvcConfigurer {
	
	@Override 
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//web구축시 사용되는 images 위치를 지정
//		registry.addResourceHandler("/images/**")
//		.addResourceLocations("file:///c:/upload/");
		
		//파일업로드에서 파일위치를 지정
		registry.addResourceHandler("/images/items/**")
		.addResourceLocations("file:///C:/Users/KOSMO/git/weeg/WeverseEgg0.2/src/main/resources/static/images/items/");
		
		registry.addResourceHandler("/images/notice/**")
        .addResourceLocations("file:///C:/Users/KOSMO/git/weeg/WeverseEgg0.2/src/main/resources/static/images/notice/");
		
		registry.addResourceHandler("/images/event/**")
		.addResourceLocations("file:///C:/Users/KOSMO/git/weeg/WeverseEgg0.2/src/main/resources/static/images/event/");
	}
}
