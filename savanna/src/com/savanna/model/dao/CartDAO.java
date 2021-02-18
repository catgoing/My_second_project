package com.savanna.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.savanna.model.vo.BookVO;
import com.savanna.model.vo.CartVO;
import com.savanna.model.vo.MemberVO;
import com.savanna.mybatis.DBService;

public class CartDAO {

	// 장바구니 추가 - 매개변수 : 책번호, 회원id
	public static boolean insertCart(int book_no, String id) {
		BookVO bvo = selectOne(book_no);
		String addr = getMemberAddr(id);
		CartVO cvo = searchCart(book_no, id);
		
		boolean check = false;
		
		if(cvo == null) { //장바구니에 상품이 없을 때
			cvo = new CartVO(); //장바구니 생성
			cvo.setBook_name(bvo.getBook_name());
			cvo.setBook_no(book_no);
			cvo.setId(id);
			cvo.setCart_quan(1);
			cvo.setCart_price(bvo.getPrice());
			cvo.setAddr(addr);
			
			System.out.println("cvo : " + cvo.toString());
			SqlSession ss = DBService.getFactory().openSession(true);
			ss.insert("mystudy.insertcart", cvo);
			ss.close();
		} else if (cvo != null){		//있을 때
			check = true;
		}
		return check;
	}
	
	//장바구니에 추가하기위해 책 한권의 정보를 가져옴!
	public static BookVO selectOne(int book_no) {
		SqlSession ss = DBService.getFactory().openSession(true);
		BookVO bvo = ss.selectOne("mystudy.onebook", book_no);
		ss.close();
		return bvo;
	}
	
	// 장바구니에 책이 있는지 찾기(중복조회)
	public static CartVO searchCart(int book_no, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("book_no", book_no);
		map.put("id", id);
		
		CartVO cvo = null;
		
		SqlSession ss = DBService.getFactory().openSession(true);
		int jungbok = ss.selectOne("mystudy.jungbok", map);
		
		if(jungbok == 0) {
			cvo = null;
		} else {
			cvo = ss.selectOne("mystudy.cartone", map);
		}
		ss.close();
		
		return cvo;
	}
	
	//장바구니 일반 조회 - 매개변수 : id
	public static List<CartVO> cartList(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<CartVO> cartList = ss.selectList("mystudy.cartlist", id);
		ss.close();
		return cartList;
	}
	
	// 장바구니 수량변경 - 매개변수 : map(책번호 + 회원아이디)
	public static void setQuant(Map<String, Object> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("mystudy.cartquanupdate", map);
		ss.close();
	}
	
	
	//장바구니 상품 삭제 - 매개변수 : map(책번호 + 회원아이디)
	public static void deleteProduct(Map<String, Object> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("mystudy.deleteincart", map);
		ss.close();
	}
	
	//장바구니 전체 금액 조회 - 매개변수 : id
	public static int totalPrice(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int tot = ss.selectOne("mystudy.totprice", id);
		ss.close();
		return tot;
	}
	
	// 장바구니 비우기 - 매개변수 : id
	public static void clearCart(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("mystudy.clearcart", id);
		ss.close();
	}
	
	//장바구니 구매처리->구매내역
	public static void sendOrder(CartVO cvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("mystudy.sendorder", cvo);
		ss.close();
	}
	
	//장바구니에 주소를 가져오기 위해 회원정보를 가져옴
	public static String getMemberAddr(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		String addr = ss.selectOne("mystudy.getmemaddr", id);
		ss.close();
		return addr;
	}
}