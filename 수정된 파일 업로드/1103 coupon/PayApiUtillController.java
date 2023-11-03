package com.gamestoreproject.apiutill;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gamestoreproject.dto.Order;
import com.gamestoreproject.service.MemberService;
import com.gamestoreproject.service.PayService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;


@Controller
public class PayApiUtillController {
	@Autowired
	PayService psvc;
	@Autowired
	MemberService msvc;
	String checkPoint = "";
	// 카카오페이
	@RequestMapping(value = "/kakaoPay_ready")
	public @ResponseBody String kakaoPay_ready(Order od, HttpSession session) throws IOException {
		System.out.println("카카오페이 결제 준비 요청 - kakaoPay_ready");
		System.out.println(od);
		String result = psvc.kakaoPay_ready(od, session);
		return result;
	}
	@RequestMapping(value="/kakaoPay_approval")
	public ModelAndView kakaoPay_approval(String pg_token, HttpSession session) {
		System.out.println("카카오 결제 승인 요청");
		ModelAndView mav = new ModelAndView();
		System.out.println("pg_token : "+pg_token);
		String tid = (String)session.getAttribute("tid");
		System.out.println("tid : "+tid);
		String result = psvc.kakaoPay_approval(tid,pg_token);
		if(result == null) {
			System.out.println("결제 오류");
			mav.addObject("payResult", "N");
		} else {
			System.out.println("결제 승인");
			mav.addObject("payResult", "Y");
		}
		session.removeAttribute("tid");
		mav.setViewName("payment/PayResult");
		return mav;
	}
	@RequestMapping(value="/kakaoPay_cancel")
	public ModelAndView kakaoPay_cancel() {
		System.out.println("cancel");
		ModelAndView mav = new ModelAndView();
		mav.addObject("payResult", "N");
		mav.setViewName("payment/PayResult");
		return mav;
	}
	// 네이버페이
	
	// kcp
	
	@RequestMapping(value="/registOrderInfo")
	public @ResponseBody String registReserveInfo(Order od, HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		String oitem = od.getOitem();
		//System.out.println(od.getOitem());
		if(loginId == null) {
			return "login";
		} else {			
			od.setOmcode(loginId);
		}
		System.out.println(od);
		int inputResult = 0;
		if(oitem.equals("point")) {
			System.out.println("포인트 충전");
			String point = od.getOprice();
			System.out.println(point);
			inputResult = psvc.inputCharge(loginId, point);
			if(inputResult==0) {
				System.out.println("변경 실패");
				return "";
			} else {
				checkPoint = "point";
			}
		}
		String registResult = psvc.registOrderInfo(od);		
		//System.out.println("mid : "+re.getMid());
				
		//System.out.println("mvcode : "+re.getMvcode());
		//System.out.println("thcode : "+re.getThcode());
		//System.out.println("schall : "+re.getSchall());
		//System.out.println("mvcode : "+re.getScdate());
		return registResult;
	}
	@RequestMapping(value="/reserveFail")
	public @ResponseBody int purchasefail(String ocode, HttpSession session, String point) {
		System.out.println("결제취소");
		String loginId = (String)session.getAttribute("loginId");
		System.out.println(ocode);
		if (checkPoint == "point"){
			int minusPoint = psvc.minusPoint(point, loginId);
			if(minusPoint>0) {
				System.out.println("포인트 변경 성공");
			}
		}
		int deleteResult = psvc.delete(ocode);
		return deleteResult;
	}
	private IamportClient api;

    public PayApiUtillController() {
        // REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
        this.api = new IamportClient("8665136313660747","CQjXdvr5D6Jbpmh46GpF6upxmTius9YbquV37vmXttH2fipKG0BXx5US2NNLCqni7mPi49NXuYcSDjiZ");
    }

    @ResponseBody
    @RequestMapping(value="/verifyIamport/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(
            Model model
            , Locale locale
            , HttpSession session
            , @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
    {
        return api.paymentByImpUid(imp_uid);
    }

}