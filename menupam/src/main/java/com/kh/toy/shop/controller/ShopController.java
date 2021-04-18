package com.kh.toy.shop.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.kh.toy.member.model.vo.Member;
import com.kh.toy.shop.model.service.ShopSerivce;
import com.kh.toy.shop.model.vo.Menu;
import com.kh.toy.shop.model.vo.MenuCategory;
import com.kh.toy.shop.model.vo.Shop;
import com.kh.toy.shop.validator.ShopValidator;

@Controller
@RequestMapping("shop")
public class ShopController {
	
	private final ShopSerivce shopService;
	ShopValidator shopValidator;
	
	public ShopController(ShopSerivce shopService, ShopValidator shopValidator) {
		this.shopService = shopService;
		this.shopValidator = shopValidator;
	}
	
	@InitBinder(value = "shop")
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(shopValidator);
	}
	
	@GetMapping("shopRegister")
	public void shopRegister() {}
	
	
	@PostMapping("shopInfo")
	public String shopInfo(@RequestParam(name = "shopPackAble", defaultValue = "N") String shopPackAble
						,@Valid Shop shop
						,Errors error
						,@RequestParam(name="detailedAddress") String detailedAddress
						,@SessionAttribute("userInfo") Member userInfo
						,Model model) {
		
		if(error.hasErrors()) {
			return "shop/shopRegister";
		}
		
		//포장 기능 체크가 안됬을때 강제로 N 삽입.
		if(shop.getShopPackAble() == "") {
			shop.setShopPackAble(shopPackAble);
		}
		
		shop.setMemberId("mapTest");
		shopService.insertShop(shop); // kakaomap에서 확인 하기 위한 용도
	
		shop.setMemberId(userInfo.getMemberId());
		shop.setShopAddress(shop.getShopAddress() + "," + detailedAddress);
		shopService.insertShop(shop); // 실제로 사용할 매장정보 kakaomap 데이터 + 입력 데이터 DB저장
			
		model.addAttribute("msg", "매장등록이 완료 되었습니다.");
		model.addAttribute("url", "/index");
		
		return "common/result";
	}
	
	@GetMapping("shopModify")
	public void shopModify() {}
	
	@PostMapping("Modify")
	public String modify(Shop shop
						,@SessionAttribute("userInfo") Member userInfo
						,Model model) {
		
		shopService.ShopInfoModify(shop, userInfo.getMemberId());
		shopService.updateShop(shop);
		model.addAttribute("url", "/shop/shopModify"); //어디로 이동시킬지 말지 추후 예정
		
		return "common/result";
	}
	
	@GetMapping("shopManage")
	public void shopManage() {}
	
	@GetMapping("menuManage")
	public void menuManage(@SessionAttribute("userInfo") Member userInfo
						,HttpSession session
						,Model model
						,HttpServletRequest request) {
		
		Shop shopInfo = shopService.selectShopInfo(userInfo.getMemberId());
		
		session.setAttribute("shopInfo", shopInfo);
		model.addAllAttributes(shopService.selectCategoryList(shopInfo.getShopIdx()));
		model.addAllAttributes(shopService.selectMenuList(shopInfo.getShopIdx()));
	}
	
	
	@GetMapping("menuModify")
	public void menuModify(@SessionAttribute("shopInfo") Shop shopInfo
							,Model model) {

		model.addAllAttributes(shopService.selectCategoryList(shopInfo.getShopIdx()));	
	}
	
	@PostMapping("menuRegister")
	public String menuRegister(@RequestParam MultipartFile file
							,@SessionAttribute("shopInfo") Shop shopInfo
							,@RequestParam(name = "menuVegan", defaultValue = "N") String menuVegan
							,Menu menu
							,Model model
							,HttpServletRequest request
							,HttpSession session){
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/").concat("resources")
				+ File.separator + "images" + File.separator;
		
		if(menu.getMenuVegan() == null) {
			menu.setMenuVegan(menuVegan);
		}
		
		menu.setShopIdx(shopInfo.getShopIdx());
		shopService.menuRegister(file, menu, uploadPath);
		model.addAttribute("msg", "메뉴 등록이 완료 되었습니다.");
		model.addAttribute("url", "/shop/menuManage");
		
		return "common/result";
	}
	
	@GetMapping("categoryModify")
	public void categoryModify(@SessionAttribute("shopInfo") Shop shopInfo
							,Model model) {
		
		model.addAllAttributes(shopService.selectCategoryList(shopInfo.getShopIdx()));
	}
	
	@GetMapping("categoryData")
	public String categoryData(@SessionAttribute("shopInfo") Shop shopInfo
							,Model model
							,HttpSession session) {
		
		model.addAllAttributes(shopService.selectCategoryList(shopInfo.getShopIdx()));
		return "shop/categoryModify"; 	
	}
	
	@PostMapping("categoryEidt")
	public String categoryModify(MenuCategory menuCategory
								,@SessionAttribute("shopInfo") Shop shopInfo
 								,Model model) {
				
		shopService.updateCategoryName(menuCategory); // 카테고리 이름 수정
		model.addAllAttributes(shopService.selectCategoryList(shopInfo.getShopIdx()));
		
		return "shop/categoryModify";
	}
	
	@PostMapping("addCategory")
	public String addCategory(MenuCategory menuCategory
					,@SessionAttribute("shopInfo") Shop shopInfo
					,Model model) {
		
		shopService.insertCategory(menuCategory, shopInfo.getShopIdx());
		model.addAllAttributes(shopService.selectCategoryList(shopInfo.getShopIdx()));
		
		return "shop/categoryModify";
	}
	
	@PostMapping("deleteCategory")
	@ResponseBody
	public String deleteCategory(@RequestBody MenuCategory menuCategory
					,@SessionAttribute("shopInfo") Shop shopInfo
					,Model model) {
		
		shopService.deleteCategory(menuCategory);
		model.addAllAttributes(shopService.selectCategoryList(shopInfo.getShopIdx()));
		
		return "success";
	}
	
	
	@GetMapping("tableDetail")
	public void tableDetail(@SessionAttribute("userInfo") Member userInfo
						,Model model) {
		
		Shop shopInfo = shopService.selectShopInfo(userInfo.getMemberId());
		model.addAllAttributes(shopService.selectCategoryList(shopInfo.getShopIdx()));
		model.addAllAttributes(shopService.selectMenuList(shopInfo.getShopIdx()));
	}
			
}
