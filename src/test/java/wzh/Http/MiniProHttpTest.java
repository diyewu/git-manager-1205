package wzh.Http;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

public class MiniProHttpTest {

	public static void main(String[] args) throws UnsupportedEncodingException {
		getwxUserInfo();
	}
	
	public static void getwxUserInfo() throws UnsupportedEncodingException{
		String url = "http://localhost:8095/gismgr/mini/login";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userName", "admin");
		params.put("userPwd", "admin");
//		params.put("code", "011KYMn91e3U4Q1Vq4o91bxCn91KYMnC");
		String resp = HttpUtil.httpPostRequest(url, params);
		System.out.println(resp);
	}
}
