package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *������AlipayConfig
 *���ܣ�����������
 *��ϸ�������ʻ��й���Ϣ������·��
 *�޸����ڣ�2017-04-05
 *˵����
 *���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
 *�ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���
 */

public class AlipayConfig {

//�����������������������������������Ļ�����Ϣ������������������������������

    // Ӧ��ID,����APPID���տ��˺ż�������APPID��Ӧ֧�����˺�
    public static String app_id = "2016110100783574";

    // �̻�˽Կ������PKCS8��ʽRSA2˽Կ
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCdT9lptSwqrIlVKl7glD9bRk9ZOnX8OalPspfaXlhOMaaw4bwwjW/jMmkxvjPjoRa61thNpD/EyFSP9+2YEY5teAJ2CpnLmUK1gDI6Kwz2Q4mt2mwLNR1RhmKmiIX9RL3o3XPVLJ5XeSGOH7DnYuWVcpxk+hzLHekh10omY83FC55a1NUdiAQjQsPck1y9JdqaByNByeAtitrGNNqmAnj+dT2ikO2SDUh3hBwewvKkdAdIohpekVAmFAICXMKnl+dkW1R49z1Jy0/y/mgFRghC0IYAQDxWBixNi2qSBO3O/lI8RCBjO/R7pnrFsjsWsWnZX/q7keHc9wwOCFgnh35lAgMBAAECggEAFe/TnqUQEqdaw1CUSHcD2sOUPxoi59hWnvGFsYLkh4ru9s2Tw6WFi8Y02yXt8Hk/RTC+mx0jc1qISEdHj6QrG2LX3QQfbD/kCJFm76ufNBw479B8rpdqjjrSOOzi2m2imf1/sKN3NTWEE2Ch97JX155S5tXl/AEgyIJQKchTIn4DNTzFwa2fTjldbYUM94WKBGLK0b4GcIyx5NYHILRquCC4+ha0X6+vxuAVYafUDRyH//62A9eWJFUPNM7ECaOLqE+Wcafu0xBJjxnl8/OtWO3ItVWCsXBtPyl69Z8QC1iZHI37X6GHalOlvGhw6ey0tXgsN4rCOIF13HAktkdOAQKBgQDVUyZBlsvl1tEaIkssN0Fm31GciJFLFQcq5bZ9d6BoKoCSxX62L6lFd/+ISZE69JTG2hp6G4PXkzvt6LRE8u77uNs/Hq2+MiwcDTAKVo8w2ME1vgOWRMjLVYrqa98NQefHE5HITgJc4XUEihjhvG6ZLq1udj5VvG27Kmd7jRAygQKBgQC8yCbUx/3j+3iXd5m341qI6IqwwRjBgaOUfpgxIEcibp/mlwzv6k1kqNptLwzcuGY8zbGr5juNBkZuE/HNY1NAjLyKLuLgLmudk0xq6INRwMCxyuaC+E5OhT7Ed4y3yFCnwTfoC+ZW+6wuC3hCEIQ7o5X05ya8MB6xVjJSqU/R5QKBgHtja+ZWJbvcg/gcy+RYVZD+LMNgzsFh+VJbqjFqRzLZGqNKbp9MdBlFbl1TSBiUrZVTRCtKzPidJfXXOqYC6i5ZXx9kTFSNyquzCQ2BwbMcPK0sKgD56jaKVR6ApHSToU+pxxHX5U/57GhixD+VcVdTA2e4JxgKNGIlBdQV5L+BAoGAdYpViySecyWu9vgTsMgRJa9MMzN3W3yBQkL0NZo4UDr6ulMQTgzfdS4hGdwysPbrSS51Umd+apceoQkwA8a1HjrCZXM99YFRpgIBkYsFwJA4Kjr//UnnT8Jsy1z4M7G4bkrCqWtHVp9KnDyt+sxX2N5IzvxhRMjdQ2M83/TlavUCgYAUGAgAPHL9mfbMDf7hpGdkLaSjkfz3kcMn+hViVaGIGzp7cD2Wy7YxMgrgjliv8v7yEJnqTg95QX1e+FTc1DYMdCBkGtJjLFQXe8NQgLHzpnXWcQeuoFSCztLrav6k9dKmOkSBQPHEm5/lvuLfCn7KIN1jD+XYqsY2lhLSi1MFBA==";

    // ֧������Կ,�鿴��ַ��https://openhome.alipay.com/platform/keyManage.htm ��ӦAPPID�µ�֧������Կ��
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmNO62K2NBVs03T+8EkGYiKtVOomCuQs7i75VVLlV5QRCHz3pRH/0NYxCHk/Jhobe7IWubVElzuWkgCk0o85VVeBGXz7SN7VXssCnHll/kF2sD2u0mno5MAHFZ3oqjokFTVc3rEOTeQt7/Maju6qEoUc3R5GN8YlPBBi+Woacz4ne9vvwM5kcbqmRqjc0JzF3NEpfkvzObB6dnjxcqKbElWZvvLpMajBkEpm1E1YIXc8eQ1io7+XBy8gzSKxLFd4YC4pVHuCGxDM8Ls/sSbMa+Vc1zVl7amXj/gPcyw4cBvcM5BLCwcltQ5QMwn5wJSs/7zwmLvKsf6ge2a9r1wA2TQIDAQAB\n";

    // �������첽֪ͨҳ��·��  ��http://��ʽ������·�������ܼ�?id=123�����Զ����������������������������
    public static String notify_url = "http://localhost:8080/notify_url.jsp";

    // ҳ����תͬ��֪ͨҳ��·�� ��http://��ʽ������·�������ܼ�?id=123�����Զ����������������������������
    public static String return_url = "http://localhost:8080/southernAirline/return_url.jsp";

    // ǩ����ʽ
    public static String sign_type = "RSA2";

    // �ַ������ʽ
    public static String charset = "utf-8";

    // ֧��������
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // ֧��������
    public static String log_path = "C:\\";


//�����������������������������������Ļ�����Ϣ������������������������������

    /**
     * д��־��������ԣ�����վ����Ҳ���ԸĳɰѼ�¼�������ݿ⣩
     * @param sWord Ҫд����־����ı�����
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

