package com.xz.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
import java.util.Map.Entry;

public class HttpUtil {
	/** 
     * @Description:使用HttpURLConnection发送post请求 
     */  
    public static String sendPost(String urlParam, Map<String, Object> params, String charset) {  
        StringBuffer resultBuffer = null;  
        // 构建请求参数  
        StringBuffer sbParams = new StringBuffer();  
        if (params != null && params.size() > 0) {  
            for (Entry<String, Object> e : params.entrySet()) {  
                sbParams.append(e.getKey());  
                sbParams.append("=");  
                sbParams.append(e.getValue());  
                sbParams.append("&");  
            }  
        }  
        HttpURLConnection con = null;  
        OutputStreamWriter osw = null;  
        BufferedReader br = null;  
        // 发送请求  
        try {  
            URL url = new URL(urlParam);  
            con = (HttpURLConnection) url.openConnection();  
            con.setRequestMethod("POST");  
            con.setDoOutput(true);  
            con.setDoInput(true);  
            con.setUseCaches(false);  
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");  
            if (sbParams != null && sbParams.length() > 0) {  
                osw = new OutputStreamWriter(con.getOutputStream(), charset);  
                osw.write(sbParams.substring(0, sbParams.length() - 1));  
                osw.flush();  
            }  
            // 读取返回内容  
            resultBuffer = new StringBuffer();  
            int contentLength = Integer.parseInt(con.getHeaderField("Content-Length"));  
            if (contentLength > 0) {  
                br = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));  
                String temp;  
                while ((temp = br.readLine()) != null) {  
                    resultBuffer.append(temp);  
                }  
            }  
        } catch (Exception e) {  
            throw new RuntimeException(e);  
        } finally {  
            if (osw != null) {  
                try {  
                    osw.close();  
                } catch (IOException e) {  
                    osw = null;  
                    throw new RuntimeException(e);  
                } finally {  
                    if (con != null) {  
                        con.disconnect();  
                        con = null;  
                    }  
                }  
            }  
            if (br != null) {  
                try {  
                    br.close();  
                } catch (IOException e) {  
                    br = null;  
                    throw new RuntimeException(e);  
                } finally {  
                    if (con != null) {  
                        con.disconnect();  
                        con = null;  
                    }  
                }  
            }  
        }  
        return resultBuffer.toString();  
    }  
}
