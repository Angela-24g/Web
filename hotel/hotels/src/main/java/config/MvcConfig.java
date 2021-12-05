package config;

import org.springframework.context.annotation.ComponentScan;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.delluna.hotels.env.LoginIntecepter;
import com.delluna.hotels.env.LoginAdmIntecepter;

@Import(value={MyBatisConfig.class})
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.delluna")
public class MvcConfig implements WebMvcConfigurer {

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/",".jsp");
	
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// addResourceHandler = 모든 요청명 풀네임, addResourceLocations = 요청명 중 폴더명
		registry.addResourceHandler("/images/**").addResourceLocations("/images/");
		registry.addResourceHandler("/css/**").addResourceLocations("/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("/js/");
	}
	//인터셉터
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//로그인필요 페이지(현재는 관리자페이지만)
		registry.addInterceptor(new LoginAdmIntecepter())
		.addPathPatterns("/adm/**").excludePathPatterns("/adm/member/**").excludePathPatterns("/adm/index");
		
		//일반회원 관리자페이지 접근방지
		registry.addInterceptor(new LoginIntecepter())
		.addPathPatterns("/adm/**");
	}
}
