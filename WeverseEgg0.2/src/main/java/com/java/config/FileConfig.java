package com.java.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
<<<<<<< HEAD
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
		
=======
public class FileConfig implements WebMvcConfigurer{
	
	// images 링크가 들어오면, 찾는 위치를 c:upload 폴더에서 찾아라
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// web 구축시 사용되는 images 위치를 지정
//		registry.addResourceHandler("/images/**").addResourceLocations("file:///c:/eggUpload/");
		
		// 파일 업로드에서 파일위치를 지정
		registry.addResourceHandler("/images/items/**")
		.addResourceLocations("file:///C:/Users/KOSMO/git/weeg/WeverseEgg0.2/src/main/resources/static/images/items/");
>>>>>>> refs/remotes/origin/master
	}

}
