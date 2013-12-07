package vn.com.luanvan.utils;

import java.io.IOException;
import java.util.Properties;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

@Component
public class Utils {
	
	public static String getConfigParam(String key) {
		Resource resource = new ClassPathResource("/config.properties");
		try {
			Properties props = PropertiesLoaderUtils.loadProperties(resource);
			String value = props.getProperty(key);
			if (value != null) {
				return value;
			}
			return null;
		} catch (IOException e) {
			return null;
		}
	}
	
	public String getLoggedInMember(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		return username;
	}
}
