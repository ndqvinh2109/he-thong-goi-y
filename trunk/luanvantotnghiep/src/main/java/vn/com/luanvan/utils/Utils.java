package vn.com.luanvan.utils;

import java.io.IOException;
import java.util.Properties;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

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
}
