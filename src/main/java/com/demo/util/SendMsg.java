package com.demo.util;

import java.io.IOException;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

public class SendMsg {
	
	public static void sendmsg(String phone,String code) throws HttpException, IOException {
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.api.smschinese.cn"); 
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//��ͷ�ļ�������ת��
		NameValuePair[] data ={ new NameValuePair("Uid", "jinjiage"),new NameValuePair("Key", "71899fb7910c2a1f27c7"),new NameValuePair("smsMob",phone),new NameValuePair("smsText",code)};
		post.setRequestBody(data);

		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		System.out.println("statusCode:"+statusCode);
		for(Header h : headers)
		{
		System.out.println(h.toString());
		}
		String result = new String(post.getResponseBodyAsString().getBytes("gbk")); 
		System.out.println(result); //��ӡ������Ϣ״̬


		post.releaseConnection();
	}
}
