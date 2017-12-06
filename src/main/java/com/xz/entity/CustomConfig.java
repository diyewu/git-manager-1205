package com.xz.entity;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component  
@ConfigurationProperties(prefix="custom") //接收application.yml中的myProps下面的属性  
public class CustomConfig {  
    private String clientFileUpladPath;

	public String getClientFileUpladPath() {
		return clientFileUpladPath;
	}

	//String类型的一定需要setter来接收属性值；maps, collections, 和 arrays 不需要  
	public void setClientFileUpladPath(String clientFileUpladPath) {
		this.clientFileUpladPath = clientFileUpladPath;
	}  
      
}  