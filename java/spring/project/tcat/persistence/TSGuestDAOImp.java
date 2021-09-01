package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.config.Configuration;

@Repository
public class TSGuestDAOImp implements TSGuestDAO{
		
	// 회원정보 수정(비밀번호 체크)
	@Override
	public int pwdCheck(Map<String, Object> map) {
		TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);

		int pwdCheck=0;
		
		pwdCheck = dao.pwdCheck(map);
			
		
		return pwdCheck;
	}
	
	

	
	// 회원정보 수정
		@Override
		public MemberVO myModify(String login_id) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public int updateMember(MemberVO vo) {
			int cnt = 0;
			System.out.println("여기다 !!!!!");
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			cnt = dao.updateMember(vo);
			System.out.println("여기다 222222!!!!!");
			return cnt;
		}



		// 아이디 검색
		@Override
		public MemberVO memberSelect(String id) {
			MemberVO vo=new MemberVO();
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			vo=dao.memberSelect(id);
			return vo;
		}



		// 관람후기 목록
		@Override
		public ArrayList<TcatBoardVO> commentBoard(Map<String, Object> map) {
			ArrayList<TcatBoardVO> dtos = null; // 큰 바구니
			String Hcnt = (String) map.get("Hcnt");
			if(Hcnt==null) {
				map.put("Hcnt", "공연");
			}
			map.put("s", Hcnt);
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			if (Hcnt.equals("스토어")) {
				dtos = dao.commentB(map);
			} else {
				dtos = dao.commentA(map);
			}
			return dtos;
		}
		// 관람후기 목록
		@Override
		public ArrayList<TcatBoardVO> commentA(Map<String, Object> map) {
			ArrayList<TcatBoardVO> dtos = null; // 큰 바구니
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			dtos = dao.commentA(map);
			return dtos;
		}
		// 스토어(상품)후기 목록
		@Override
		public ArrayList<TcatBoardVO> commentB(Map<String, Object> map) {
			ArrayList<TcatBoardVO> dtos = null; // 큰 바구니
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			dtos = dao.commentB(map);
			return dtos;
		}
		// 관람후기 개수
		@Override
		public int comment(Map<String, Object> map) {
			int cnt = 0;
			
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			cnt = dao.comment(map);

			return cnt;
		}
		// 스토어후기 개수
		@Override
		public int commentS(Map<String, Object> map) {
			int cnt = 0;
			
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			cnt = dao.commentS(map);
			return cnt;
		}
		//고객단 후기 한줄평 쓰기
		@Override
		public int commentWrite(TcatBoardVO vo) {
			int cnt = 0;
			
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			cnt = dao.commentWrite(vo);
			
			return cnt;
		}



		// 게스트 관람/후기(해당공연) 개수
		@Override
		public int selectComment(Map<String, Object> map) {
			int cnt = 0;
			
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			cnt = dao.selectComment(map);
			
			return cnt;
		}



		// 게스트 관람/후기 (해당공연) 목록
		@Override
		public ArrayList<TcatBoardVO> selectCommentBoard(Map<String, Object> map) {
			ArrayList<TcatBoardVO> dtos = null; // 큰 바구니
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			dtos = dao.selectCommentBoard(map);
			System.out.println("===========================");
			for(int i =0; i<dtos.size(); i++) {
                String perf_image=dtos.get(i).getPerf_image();
                System.out.println("perf_image==="+perf_image);
             }
			System.out.println("===========================");
			return dtos;
		}



		// 게스트 상품/후기 작성
		@Override
		public int commentWriteS(TcatBoardVO vo) {
			int cnt = 0;
			
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			cnt = dao.commentWriteS(vo);
			
			return cnt;
		}



		// 게스트 상품/후기 (해당상품) 개수
		@Override
		public int selectCommentS(Map<String, Object> map) {
			int cnt = 0;
			
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			cnt = dao.selectCommentS(map);
			
			return cnt;
			
		}



		// 게스트 스토어/후기 (해당상품) 목록
		@Override
		public ArrayList<TcatBoardVO> selectCommentBoardS(Map<String, Object> map) {
			ArrayList<TcatBoardVO> dtos = null; // 큰 바구니
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			
			dtos = dao.selectCommentBoardS(map);
			
			return dtos;
		}

		// 게스트가 후기 수정할 수 있게 - 공연용
		@Override
		public int commentsModify(TcatBoardVO vo) {
			int cnt = 0;
			
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			cnt = dao.commentsModify(vo);
			
			return cnt;
		}



		// 게스트가 후기 삭제하기 - 공연용
		@Override
		public int commentDeldao(int notice_num) {
			int cnt = 0;
			
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			cnt = dao.commentDeldao(notice_num);
			
			return cnt;
		}



		// 게스트가 후기 수정할 수 있게 - 스토어
		@Override
		public int commentsModifyS(TcatBoardVO vo) {
			int cnt = 0;
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			cnt = dao.commentsModifyS(vo);
			return cnt;
		}



		// 게스트가 후기 삭제하기 - 스토어
		@Override
		public int commentDeldaoS(int notice_num) {
			int cnt = 0;
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			cnt = dao.commentDeldaoS(notice_num);
			return cnt;
		}




		//게스트관람후기 타이틀 가져오기
		@Override
		public String getperfTitlePlz(int per_id) {
			// TODO Auto-generated method stub
			String title="";
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			title = dao.getperfTitlePlz(per_id);
			return title;
	
		}




		//게스트스토어후기 타이틀 가져오기
		@Override
		public String getListdisc_title(int disc_code) {
			// TODO Auto-generated method stub
			String title="";
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			title = dao.getListdisc_title(disc_code);
			return title;
		}
		
		
		
		
		
		
}
