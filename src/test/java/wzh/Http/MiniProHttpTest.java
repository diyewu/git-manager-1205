package wzh.Http;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

public class MiniProHttpTest {

	public static void main(String[] args) throws UnsupportedEncodingException {
//		login();
//		getMapInfoByuserRole();
//		getNextMapInfoByKey();
		getCoordinateInfo();
	}
	
	public static void login() throws UnsupportedEncodingException{
		String url = "http://localhost:8095/gismgr/mini/login";
//		String url = "https://zhonglestudio.cn/gismgr/mini/login";
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userName", "admin");
		params.put("userPwd", "admin");
		params.put("randomkey", "011KYMn91e3U4Q1Vq4o91bxCn91KYMnC");
		String resp = HttpUtil.httpPostRequest(url, params);
		System.out.println(resp);
	}
	public static void getMapInfoByuserRole() throws UnsupportedEncodingException{
		String url = "http://localhost:8095/gismgr/mini/getMapInfoByuserRole";
//		String url = "https://zhonglestudio.cn/gismgr/mini/getMapInfoByuserRole";
		
		Map<String, Object> params = new HashMap<String, Object>();
//		params.put("userName", "admin");
//		params.put("userPwd", "admin");
		params.put("randomkey", "011KYMn91e3U4Q1Vq4o91bxCn91KYMnC");
		params.put("token", "d462c8cedb7742869a9c27529ad3adfa");
		String resp = HttpUtil.httpPostRequest(url, params);
		System.out.println(resp);
	}
	public static void getNextMapInfoByKey() throws UnsupportedEncodingException{
		String url = "http://localhost:8095/gismgr/mini/getNextMapInfoByKey";
//		String url = "https://zhonglestudio.cn/gismgr/mini/getNextMapInfoByKey";
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("randomkey", "011KYMn91e3U4Q1Vq4o91bxCn91KYMnC");
		params.put("token", "b91c8afceaf84354b1a923df3f12c6df");
		params.put("cacheKey", "32c82b58e76e405bbcefab63b9c3ae7b");
		params.put("key", "31");
		params.put("currentLevel", "1");
		
		String resp = HttpUtil.httpPostRequest(url, params);
		System.out.println(resp);
	}
	public static void getCoordinateInfo() throws UnsupportedEncodingException{
		String url = "http://localhost:8095/gismgr/mini/getCoordinateInfo";
//		String url = "https://zhonglestudio.cn/gismgr/mini/getNextMapInfoByKey";
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("randomkey", "011KYMn91e3U4Q1Vq4o91bxCn91KYMnC");
		params.put("token", "d462c8cedb7742869a9c27529ad3adfa");
		params.put("cacheKey", "dace06e0fbee4fadaa5b883b7d209d07");
		params.put("ids", "001521712028608052425cc5d4d2e6f0");
		
		String resp = HttpUtil.httpPostRequest(url, params);
		System.out.println(resp);
	}
}
