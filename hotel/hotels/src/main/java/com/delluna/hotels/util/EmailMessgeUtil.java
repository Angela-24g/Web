package com.delluna.hotels.util;

public class EmailMessgeUtil {
	public static EmailHash emailHash;
	
	public static String getVerifyEmailMessge(int authNo) {
		emailHash = new EmailHash();		
		return emailHash.getVerifyMessage(authNo);
	}
	public static String getFindPwEmailMessage(int authNo) {
		emailHash = new EmailHash();		
		return emailHash.getFindPwMessage(authNo);
	}

}

class EmailHash{
	String html;
	
	String getVerifyMessage(int authNo) {
		html = "<html lang=\"ko\">";
		html += "<head><title>Emogrifier Example</title></head>";
		html += "<body>";
		html += "<div class=\"wrap\" style=\"margin: 0 auto;width: 900px;background-color: #fff;border: 1px solid #c4c4c4;box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.3);font-size: 16px;line-height: 22px;color: #333;\">";
		html += "<div class=\"inner_wrap\" style=\"padding: 30px;\">";
		html += "<div class=\"box\">";
		html += "<h1 class=\"title\" style=\"padding-bottom: 20px;\">HOTEL DEULLA</h1>";
		html +=	"<p class=\"desc\" style=\"margin: 40px 0;\">";
		html += "호텔 델루나 가입을 위한 인증번호입니다.<br> 아래 인증번호를 확인하여 이메일 주소 인증을 완료해 주세요.";
		html += "</p>";
		html += "</div>";
		html += "<div class=\"box2\" style=\"border-bottom: 1px solid #c4c4c4;height: 150px;\">";
		html += "<h2 class=\"title\" style=\"padding-bottom: 20px;\">&#51064;&#51613;&#53076;&#46300;</h2>";
		html += "<p class=\"desc\" style=\"margin: 40px 0;\">"+authNo+"</p>";
		html +=	"</div>";
		html += "<p class=\"small\" style=\"font-size: 12px;color: rgba(0, 0, 0, .6);\">";
		html += "본 메일은 발신전용입니다.<br> Copyright 2021 HOTEL DELLUNA All Rights Reserved";
		html += "</div></div></body></html>";
		return html;
	}
	String getFindPwMessage(int authNo) {
		html = "<html lang=\"ko\">";
		html += "<head><title>Emogrifier Example</title></head>";
		html += "<body>";
		html += "<div class=\"wrap\" style=\"margin: 0 auto;width: 900px;background-color: #fff;border: 1px solid #c4c4c4;box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.3);font-size: 16px;line-height: 22px;color: #333;\">";
		html += "<div class=\"inner_wrap\" style=\"padding: 30px;\">";
		html += "<div class=\"box\">";
		html += "<h1 class=\"title\" style=\"padding-bottom: 20px;\">HOTEL DEULLA</h1>";
		html +=	"<p class=\"desc\" style=\"margin: 40px 0;\">";
		html += "호텔 델루나 로그인을 위한 인증번호입니다.<br> 아래 인증번호로 재 로그인 하세요";
		html += "</p>";
		html += "</div>";
		html += "<div class=\"box2\" style=\"border-bottom: 1px solid #c4c4c4;height: 150px;\">";
		html += "<h2 class=\"title\" style=\"padding-bottom: 20px;\">&#51064;&#51613;&#53076;&#46300;</h2>";
		html += "<p class=\"desc\" style=\"margin: 40px 0;\">"+authNo+"</p>";
		html +=	"</div>";
		html += "<p class=\"small\" style=\"font-size: 12px;color: rgba(0, 0, 0, .6);\">";
		html += "본 메일은 발신전용입니다.<br> Copyright 2021 HOTEL DELLUNA All Rights Reserved";
		html += "</div></div></body></html>";
		return html;
	}
}
