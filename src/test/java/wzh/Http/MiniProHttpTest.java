package wzh.Http;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

public class MiniProHttpTest {

	public static void main(String[] args) throws UnsupportedEncodingException {
//		login();
		getMapInfoByuserRole();
	}
	
	public static void login() throws UnsupportedEncodingException{
//		String url = "https://zhonglestudio.cn/gismgr/mini/login";
		String url = "http://localhost:8095/gismgr/mini/login";
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userName", "admin");
		params.put("userPwd", "admin");
		params.put("randomkey", "011KYMn91e3U4Q1Vq4o91bxCn91KYMnC");
		String resp = HttpUtil.httpPostRequest(url, params);
		System.out.println(resp);
	}
	public static void getMapInfoByuserRole() throws UnsupportedEncodingException{
//		String url = "https://zhonglestudio.cn/gismgr/mini/login";
		String url = "http://localhost:8095/gismgr/mini/getMapInfoByuserRole";
		
		Map<String, Object> params = new HashMap<String, Object>();
//		params.put("userName", "admin");
//		params.put("userPwd", "admin");
		params.put("randomkey", "011KYMn91e3U4Q1Vq4o91bxCn91KYMnC");
		params.put("token", "61afc720a9264094a1d2c5a309070aa7");
		String resp = HttpUtil.httpPostRequest(url, params);
		System.out.println(resp);
	}
}
