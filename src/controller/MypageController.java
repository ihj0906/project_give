package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.Donation;
import dto.LoginInfo;
import service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageSvc;
	
	@RequestMapping("/mypage/infoyourgive")
	public String myDonationList(Model model, HttpSession session) {
		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");
		ArrayList<Donation> myDonationList = mypageSvc.myDonationList(loginInfo.getId());
		model.addAttribute("myDonationList", myDonationList);
		return "mypage/infoyourgive";
	}

}
