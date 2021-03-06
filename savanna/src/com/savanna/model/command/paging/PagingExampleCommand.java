package com.savanna.model.command.paging;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.vo.MemPagingVO;
import com.savanna.model.vo.MemberVO;

public class PagingExampleCommand implements Command{
	String cPage;
	
	public PagingExampleCommand() {
	
	}
	
	public PagingExampleCommand(String cPage) {
		this.cPage = cPage; // cPage는 jsp에서 get 방식으로 controller를 통해 전달받음
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		System.out.println(">> SearchController doGet() 실행~~~");
		
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		System.out.println("> idx: "+ idx + ", keyword: " + keyword + ", cpage: " + cPage);
		
		String path = "";
		if (keyword == null || keyword.equals("")) { 
			path = "controller?type=example"; // 검색값 없으면 리턴할 페이지로 이동
		} else { //검색값이 입력되었으니 DB에서 검색처리
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			
			MemPagingVO p = new MemPagingVO();

			//1. 검색한 데이터의 수를 구하기
			p.setTotalMember(PagingExampleDAO.getSearchCount(idx, keyword));
			p.setTotalPage();
//			System.out.println("> 전체 검색결과 수 : " + p.getTotalMember());
//			System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
			
			//2. 현재 페이지 구하기
//			System.out.println("cpage: " + cPage);
			
			if (cPage != null) {
				p.setNowPage(Integer.parseInt(cPage));
			}
//			
			//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
			p.setEnd(p.getNowPage() * p.getNumPerPage()); //현재페이지번호 * 페이지당 글수
			p.setBegin(p.getEnd() - p.getNumPerPage() + 1); 
			
			//(선택적)3-1 끝 글번호가 데이터건수보다 많은경우 데이터건수와 일치
			if (p.getEnd() > p.getTotalMember()) {
				p.setEnd(p.getTotalMember());
			}
//			System.out.println("--------------");
//			System.out.println(">> 현재 페이지 : " + p.getNowPage());
//			System.out.println(">> 시작글번호(begin) : " + p.getBegin());
//			System.out.println(">> 끝 글번호(end) : " + p.getEnd());
			
			//----- 블록(block) 계산하기 -----------
			//4. 블록의 시작페이지, 끝페이지 구하기(현재 페이지 번호 사용)
			//시작페이지 구하기
			int nowPage = p.getNowPage();
			int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
			p.setBeginPage(beginPage);
			p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
			
			//4-1. 끝페이지(endPage)가 전체 페이지수(totalPage) 보다 크면
			// 끝페이지 값을 전체페이지수로 변경처리
			if (p.getEndPage() > p.getTotalPage()) {
				p.setEndPage(p.getTotalPage());
			}
			
//			System.out.println(">>시작페이지(beginPage) : " + p.getBeginPage());
//			System.out.println(">>끝페이지(endPage) : " + p.getEndPage());
			
			
			//=====================================
			//현재 페이지 기준으로 DB데이터(게시글) 가져오기
			//시작글번호, 끝글번호, idx, keyword 저장용 Map 만들기(전달할 파라미터 저장용)
			Map<String, String> map = new HashMap<>();
			map.put("begin", Integer.toString(p.getBegin()));
			map.put("end", Integer.toString(p.getEnd()));
			map.put("idx", idx);
			map.put("keyword", keyword);
			
		
			// 현재 페이지에 표시할 데이터 조회
			List<MemberVO> list = PagingExampleDAO.getsearchList(map);
//			System.out.println("> 현재 페이지 글목록(list) : " + list);

			request.setAttribute("list", list); // 최종 데이터 리스트
			request.setAttribute("pvo", p); // 페이지 정보
			request.setAttribute("cPage", cPage); // 페이지값 jsp 페이지로 전달
			request.setAttribute("idx", idx); // idx값 유지를 위해 jsp 페이지로 전달
			request.setAttribute("keyword", keyword); // keyword값 유지를 위해 jsp 페이지로 전달

			path = "example/example.jsp"; // 최종적으로 리턴할 페이지
		}
		
		return path;
	}

}