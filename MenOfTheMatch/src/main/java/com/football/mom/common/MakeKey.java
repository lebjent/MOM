package com.football.mom.common;

public class MakeKey {
	
	/*
	 * 작 성 자 : 전 준 표
	 * 작 성 일 : 2023-06-26
	 * 작 성 내 용 : 팀을 생성할때 기본키를 만들어 주는 함수
	 */
	public static String makeTeamNumber(String key) {
		String start = "MOM"; //상품번호 시작
		
		String resultKey = "";
		
		if(key == null) {
			resultKey = start+"000001";
		}else {
			//앞에 EQM을 제외하고 숫자만 추출
			String strNumber = key.replace("MOM","");
			
			//EQM을 뺀 문자열을 숫자로 변환
			int number = Integer.parseInt(strNumber);
			
			String end = String.valueOf(number+1);//기존 numbering에서 +1더하기
			
			//숫자를 문자열로 변환하여 length를 통하여 숫자의 자리수 구하기
			int length = end.length();
			
			//ex)맨앞에 숫자가 1로 바뀌는 순간 0을 붙혀서 코드를 생성하지 않는다.
			if(6-length>0) {
				String front = "";
				for(int i = 0; i< 6-length; i++) {//자리수에 맡게 for문으로0을 생성
					front += "0";
				}
				resultKey = start + front + end;
			}else {
				resultKey = start + end;
			}
			
		}
		
		return resultKey;
	}
	
}
