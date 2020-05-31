package main;

import dao.ProductDAO;
import vo.ProductVO;

public class insertProduct {
	public static void main(String[] args) {
		ProductDAO dao = new ProductDAO();
		
		ProductVO vo = new ProductVO();
		
//		vo.setPname("샤넬백");
//		vo.setPrice(5000000);
//		vo.setDcratio(10);	//할인율
//		vo.setProdesc("명품 위의 명품 - 기다림의 미학");	//상품설명
//		vo.setQty(5);	//재고
//		vo.setImgfile("../images/chanel.png");	
//		vo.setBigfile("../images/gucci.png");
//		
//		int result = dao.addData(vo);
//		System.out.println(result);
		
		vo.setPname("삭제할거");
		vo.setPrice(2500000);
		vo.setDcratio(20);	//할인율
		vo.setProdesc("명품 위의 명품 - 기다림의 미학");	//상품설명
		vo.setQty(15);	//재고
		vo.setImgfile("../images/gucci.png");	
		vo.setBigfile("../images/gucci.png");
		
		int result = dao.addData(vo);
		System.out.println(result);
		
		
		
		
	}
}
