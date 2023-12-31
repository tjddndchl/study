package ch14_jdbc_conn;

import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Scanner;

import ch14_jdbc_conn.dao.UserDao;
import ch14_jdbc_conn.model.BbsVo;
import ch14_jdbc_conn.model.DetailedBbsVo;
import ch14_jdbc_conn.model.UserVO;
import ch14_jdbc_conn.service.UserService;

public class UserMain {
	
	public static void main(String[] args) {
		 Scanner sc = new Scanner(System.in);
	      UserService userService = UserService.getInstance();
	      while(true) {
	          System.out.println("어떤 작업을 원하시나요? ");
	          System.out.println("1.로그인|2.회원가입|3.종료");
	          System.out.print(">>>");
	          int command =0;
	          command = Integer.parseInt(sc.nextLine());
	          if(command == 1) {
	             System.out.println("id를 입력해주세요");
	             System.out.print(">>>");
	             String id = sc.nextLine();
	             System.out.println("비밀번호를 입력해주세요 ^^");
	             System.out.print(">>>");
	             String pw = sc.nextLine();
	             UserVO userVO = userService.loginUser(id);
	             if(pw.equals(userVO.getUserPw())) {
	                System.out.println(userVO.getUserNm() + "님 환영합니다.");
	                //-- 게시글 출력 
	                ArrayList<BbsVo> list = userService.bbsList();
	                for(int i = 0 ; i < list.size(); i ++) {
	                   String result =  MessageFormat.format("게시글 {0} | {1} | {2} | {3} |"
	                         , list.get(i).getRnum(), list.get(i).getBbsNo()
	                         , list.get(i).getBbsTitle(), list.get(i).getAuthorId());
	                   System.out.println(result);
	                }
	                System.out.println("어떤 작업을 원하시나요?");
	                System.out.println("1.상세조회|2.게시글삭제|3.종료");
	                command = Integer.parseInt(sc.nextLine());
	                if(command == 1) {
	                   System.out.println("상세 내용을 보고싶은 번호 순서를 입력하세요");
	                   int no =Integer.parseInt(sc.nextLine()); 
	                   ArrayList<DetailedBbsVo> list2 = userService.DetailList(no);
	                   System.out.println(list2);
	                   // 게시글중 1 입력시 게시글1의 상세내용과 댓글을 출력하세요
	                   // (1) 상세내용을 담을 VO생성 or 기존 VO 컬럼추가
	                   // (2) 상세내용 query작성
	                   // (3) dao, service 메서드 추가
	                   // (4) 1입력시 1에 해당하는 bbsno로 조회 내용을 출력
	                   
	                 
	                  
	                }
	             }else {
	                System.out.println("아이디 비번을 확인하세요!!");
	             }
	          }else if(command == 2){
	             //회원가입 선택
	             System.out.println("아이디를 입력해주세요.");
	             System.out.print(">> ");
	             String id = sc.nextLine();
	             System.out.println("비번을 입력해주세요");
	             System.out.print(">> ");
	             String pw = sc.nextLine();
	             System.out.println("이름을 입력해주세요");
	             System.out.print(">> ");
	             String nm = sc.nextLine();
	             UserVO userVO = new UserVO(id,nm,pw);
	             userService.insertUser(userVO);
	             System.out.println(nm + "님 가입되셨습니다 ^^"); 
	             
	          }else if(command == 3){
	             System.out.println("-----종료-----");
	             break;
	          }
	      }

		
	}
		
}

