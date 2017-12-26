package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */


public class AlipayConfig {
	
	//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

		// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016082700317472";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQC52W2wBm5gyHzxVQOGkh6wjjaITlhF0gv8Pjac9UiqQv5DcQ8XadkQNtfKhkdb5U2zT2Mty/yzSQuZODYNlEmrt1ufcgMmyL67W7iA0e4GP62Mx+k3i9CsBrnoQ/e/FAQs2n+tXu3apIN3Ti8VWIcu4Ak9V/sw678SZHQdJJjZUM5wnIPylkVDynFKmxNC17jtVsWaXblHgu1Lkq/tQPoKHcB0AMeHKYc3hwZtVq6yO4xMDLa7ByFIGFIAcxsCib2AfFnKfYpJ8vRr6tdUgW6HtmqAmQGVJI6NVQD85s+T0QrAEdFDt6rjMx36PaGjzyE7OrGsKN0+d/HVNZQHR+fNAgMBAAECggEAVR/0D8ZCVG5AXEG2RbMz/2aEL9bCs+hLuRO97BKlX+cjkzx7zxuaYsTb/lWW5c6X0mOwZ8+hRXVVrK6Eg5/CRrbLbrLIIsGcKzENx2NghNgx4+PFPL37rG/AQ1Sua4T9jJXgGUb750OnO8RB6KMN+DiBwulDktrIP+JnFNoocJC7Zt1HpywvdHxMfP0ApjtShbmk451B+SzJtnhvI4Y0EDTKPpRdNkkRiz87Lzf5JeA6Rth9UxkA7wdvOuggdu8OQjP5+v/XVl43IVLWRHUz5cFzCJ25usoTBwJB9HkohePMoFK7kBoncLl+yENQ8JySQSInZYPfZr5/TBh8e4f8OQKBgQD1f5nFe4dbXNaOC3WV3clnVKvFJsnOej21Nn3tdnx3E0TW8SlMKI8bVHRPvJFEb0gtC5W/G4bBkOASLLttkEljHLPR1cIcF5gKwurhlNj4vBF2vtZMOi3bwPnE8GKyutLtkZJfE1FavSqrUZJ4TORKO5PXsr5JTx6+pp6ImzfhcwKBgQDBzJ+f6cOfCScmqOaSXRc/99dpVnpwOwoCNRhCcE8QgxhXV8TgB/RCVbhG2P9V6hvp9m7qSddchp9wQ65wNGRMQZ4GXrSNyI7R2nJcZnl3dXa49nm88OiPafshYin6Xh2HDMQDjc2X+5aviQuN3umWW3aLCjkfmtWta56p9iXBvwJ/GO7crzHcjWrgX4zKZG4iBlyTFXLbDB1eJwlhwLxH59ANLcdQamu0HRJ2vaJpHoouymRi0QX6qa4NE8t3PalpyqcfnDAZhsDesDkboc18O8bd/zFikltWTPtMYrQHUh+nTHl8ZCuSF6UesEeYmJ82kFN8sGt25/shJDvH3hfllQKBgEcfxeV2cWjIfyndCuHkcEf1uYTbTAwsXrv4qHKZrSquMhy8BXEC+k3uD7dQpETvqlbvLj2l4/f9ID6fWEGtuLGT018bGsB+Powd06K9qQ6CeZPgQUVqVK9tgdD6qdVM/SE3OijjvfRtTRwW+7qReMDJyHO2yMgklw8SVCSkRa8ZAoGBAM/ZOVL/PzNnBqYbY2DgKrA6jL8O9sGTlSXtg0VsK0ru7Fq1wtdON3IcVB/2WWro0qU96eH1U1BpHmFLxlUVnlJmaBfnY7tDtBrPYv3igpDzCZbuJsveyzjCyX/r/SAPq/Fq/H8VfpFbVBEbU9feKBFXo5SoUHme98J5NpQoCTZx";
 // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA9N2L1yqVmt8MTTbpas6XmrgPme0KrdqEacFgxthx1MbGc4kgd1RzoIFLsKB0d8EsmeUr9CuitbbZAHOyLVARE6sg7FHLHglHwXz9vNnJENQGpyMtYdn2Jk+eXpKa/cWUmZiJEMSppAdgRDaMaT7TKaPVbLT0ZmteMMFCVzoAdo0NHFtGCxtJq68efeyZ7GPGXLwqufUtdX/9hphujl0MQPpAaIYQgLOY3bXIzU4zqzuKWZJk8EudbdtelofD5vAR8i2scea9thR8gmn5Vn5LrS/rswjWY4f3IEZLftK4yQWfc4KaqHSr9XanupBj7V3wBtj7A7nNr+gsUNZ1jjUTiwIDAQAB";
    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://688210bd.ngrok.io/mywinplus/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://688210bd.ngrok.io/mywinplus/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


	//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

