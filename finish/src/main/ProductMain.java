package main;

import java.util.ArrayList;

import dao.ProductDAO;
import vo.ProductVO;

public class ProductMain {
	public static void main(String[] args) {
		//new ProductDAO();
		
		ProductDAO dao = new ProductDAO();
		
		//전체 데이터 조회
//		ArrayList<ProductVO> list = dao.getAllData();
//		
//		for(ProductVO vo : list) {
//			System.out.println(vo.getImgfile());
//		}
		
		
		//상품 번호로 개별 조회
//		ProductVO vo = dao.getData(6);	//있는 번호로 조회, 없는번호로 조회하는 상황도 있을 수 있으니 if 번호가 없으면~ 처리해주어야
//		System.out.println(vo.getPno()+" , "+vo.getBigfile());
		
		
		//상품 이름으로 개별 조회
//		ProductVO vo = dao.getDataByName("샤넬백");
//		System.out.println(vo.getPno() + " , " + vo.getPname());
		
		//상품 수정
//		ProductVO vo = new ProductVO();
//		vo.setPno(10);	//10번넘버를 밑의 내용으로 수정한다~~
//		
//		vo.setPrice(1000000);
//		vo.setDcratio(5);
//		vo.setQty(20);
//		
//		dao.modifyData(vo);
		
		
		//상품 삭제
		dao.deleteData(13);
		
		
		
		
		
	}
}
