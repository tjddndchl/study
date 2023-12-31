package ch09_class.typing;

import java.util.ArrayList;

public class Dictionary {
	//전역적으로 사용하는 상수
	public static final int OPTION_STUDENT_NAME=0; 
	public static final int OPTION_CODING_WORD=1; 
	public static final int OPTION_RANDOM_ALPHABET=2; 
	public static ArrayList<String> makeWordList(int option) {
		ArrayList<String> wordList = new ArrayList<String>();
		//option 0;학생목록 1:코딩용어, 2:랜덤알파벳
		if (option == OPTION_STUDENT_NAME) {
			wordList.add("Kim GyuYeong");
			wordList.add("Kim DongHyun");
			wordList.add("Kim SangJun");
			wordList.add("Kim SungUn");
			wordList.add("Kim SeJun");
			wordList.add("Noh YoonGi");
			wordList.add("Park GeunHye");
			wordList.add("Sa WeonGi ");
			wordList.add("Song HyunJi");
			wordList.add("Shin GaHee");
			wordList.add("Ye JunSeo");
			wordList.add("Yoon GaYoung");
			wordList.add("Yun SeoJun");
			wordList.add("Lee GyuHwan");
			wordList.add("Lee SangHee");
			wordList.add("Lee YoungGyu");
			wordList.add("Lee JaeWoo");
			wordList.add("Lee HoJe");
			wordList.add("Lim JiYoon");
			wordList.add("Jeong MinHyoung");
			wordList.add("Jo HaEun");
			wordList.add("Choi MinHyeock");
			wordList.add("Choi SungWoong");
			
		} else if(option == OPTION_CODING_WORD){
			wordList.add("Class");
			wordList.add("static");
			wordList.add("while");
			wordList.add("for");
			wordList.add("method");
			wordList.add("Class");
			wordList.add("public");
			wordList.add("Constructor");

		}else if(option == OPTION_RANDOM_ALPHABET){
			//랜덤알파벳6자리
			String[] alphabet = "qwertyuiopasdfghjklzxcvbnm".split("");
			//10개만담기
			for(int i=0; i<10;i++) {
				String word = "";
				for(int j =0; j<6; j++) {
					int randIdx = (int)(Math.random()*alphabet.length);
					word += alphabet[randIdx];
				}
				wordList.add(word);
			}
		}
		return wordList;

	}
}
