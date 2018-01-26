package com.xz.speech;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.xml.bind.DatatypeConverter;

import org.json.JSONArray;
import org.json.JSONObject;

public class BaiduRecognize {

	private static String TOKEN = "7a49ddf0dc913e6b9";
	private static final String testFileName = "F:\\OnMyWay\\定做网站\\百度语音\\public\\8k.pcm";
	private static final String cuid = "7a49ddf0dc913e6b9b80a6d26ec9619e";
	// put your own params here

	public static void main(String[] args) throws Exception {
//		getToken();
//		recognizeJson(testFileName);
//		recognizeRaw();
		System.out.println(recognizeByBaidu(testFileName));
	}
	
	private static int ii = 0;
	public static String recognizeByBaidu(File file) {
		String recText = "";
		String resp = "";
		try {
			resp = recognizeJson(file);
			JSONObject object = new JSONObject(resp);
			String errNo = object.getString("err_no");
			if("0".equals(errNo)){
				JSONArray array = object.getJSONArray("result");
				for(int i=0;i<array.length();i++){
					recText += array.getString(i);
				}
				ii = 0;
			}else if("3302".equals(errNo)){
				ii++;
				if(kk == 1){
					getToken();
					recText = recognizeByBaidu(file);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recText;
	}
	private static int kk = 0;
	public static String recognizeByBaidu(String filePath) {
		String recText = "";
		String resp = "";
		try {
			resp = recognizeJson(filePath);
			JSONObject object = new JSONObject(resp);
			String errNo = object.getString("err_no");
			if("0".equals(errNo)){
				JSONArray array = object.getJSONArray("result");
				for(int i=0;i<array.length();i++){
					recText += array.getString(i);
				}
				kk = 0;
			}else if("3302".equals(errNo)){
				kk++;
				if(kk == 1){
					getToken();
					recText = recognizeByBaidu(filePath);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recText;
	}
	
	private static void getToken() throws Exception {
		String getTokenURL = "https://openapi.baidu.com/oauth/2.0/token?grant_type=client_credentials" + "&client_id="
				+ BaiduAppkey.APIKEY + "&client_secret=" + BaiduAppkey.SECRETKEY;
		HttpURLConnection conn = (HttpURLConnection) new URL(getTokenURL).openConnection();
		TOKEN = new JSONObject(printResponse(conn)).getString("access_token");
	}

	private static String recognizeJson(String filePath) throws Exception {
		File pcmFile = new File(filePath);
		HttpURLConnection conn = (HttpURLConnection) new URL(BaiduAppkey.SERVERURL).openConnection();
		// construct params
		JSONObject params = new JSONObject();
		params.put("format", "pcm");
		params.put("rate", 8000);
		params.put("channel", "1");
		params.put("token", TOKEN);
		params.put("cuid", cuid);
		params.put("len", pcmFile.length());
		params.put("speech", DatatypeConverter.printBase64Binary(loadFile(pcmFile)));

		// add request header
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");

		conn.setDoInput(true);
		conn.setDoOutput(true);

		// send request
		DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
		wr.writeBytes(params.toString());
		wr.flush();
		wr.close();

		return printResponse(conn);
	}
	private static String recognizeJson(File pcmFile) throws Exception {
//		File pcmFile = new File(filePath);
		HttpURLConnection conn = (HttpURLConnection) new URL(BaiduAppkey.SERVERURL).openConnection();
		// construct params
		JSONObject params = new JSONObject();
		params.put("format", "pcm");
		params.put("rate", 8000);
		params.put("channel", "1");
		params.put("token", TOKEN);
		params.put("cuid", cuid);
		params.put("len", pcmFile.length());
		params.put("speech", DatatypeConverter.printBase64Binary(loadFile(pcmFile)));
		
		// add request header
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
		
		conn.setDoInput(true);
		conn.setDoOutput(true);
		
		// send request
		DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
		wr.writeBytes(params.toString());
		wr.flush();
		wr.close();
		
		return printResponse(conn);
	}

	private static void recognizeRaw() throws Exception {
		File pcmFile = new File(testFileName);
		HttpURLConnection conn = (HttpURLConnection) new URL(BaiduAppkey.SERVERURL + "?cuid=" + cuid + "&token=" + TOKEN)
				.openConnection();

		// add request header
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "audio/pcm; rate=8000");

		conn.setDoInput(true);
		conn.setDoOutput(true);

		// send request
		DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
		wr.write(loadFile(pcmFile));
		wr.flush();
		wr.close();

		printResponse(conn);
	}

	private static String printResponse(HttpURLConnection conn) throws Exception {
		if (conn.getResponseCode() != 200) {
			// request error
			return "";
		}
		String output = "";
		InputStream is = null;
		StringBuffer response;
		try {
			is = conn.getInputStream();
			BufferedReader rd = new BufferedReader(new InputStreamReader(is));
			String line;
			response = new StringBuffer();
			while ((line = rd.readLine()) != null) {
				response.append(line);
				response.append('\r');
			}
			rd.close();
			System.out.println(new JSONObject(response.toString()).toString(4));
			output = response.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return output;
	}

	private static byte[] loadFile(File file) throws IOException {
		InputStream is = new FileInputStream(file);

		long length = file.length();
		byte[] bytes = new byte[(int) length];

		int offset = 0;
		int numRead = 0;
		while (offset < bytes.length && (numRead = is.read(bytes, offset, bytes.length - offset)) >= 0) {
			offset += numRead;
		}

		if (offset < bytes.length) {
			is.close();
			throw new IOException("Could not completely read file " + file.getName());
		}

		is.close();
		return bytes;
	}
}
