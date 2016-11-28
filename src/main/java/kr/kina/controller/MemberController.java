package kr.kina.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.kina.domain.MemberVO;
import kr.kina.domain.SongVO;
import kr.kina.service.FavoriteService;
import kr.kina.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	private final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Inject
	FavoriteService favoriteService;
	
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public void signUpGET() throws Exception {
		log.info("SignUp GET ..");
	}
	
	/**  회원가입 : POST 
	 *   @param	  MemberVO객체, Model객체
	 *   @return  String xxx.jsp
	 */
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String signUpPOST(MemberVO member, RedirectAttributes rttr, Model model) throws Exception {
		log.info("SignUp POST ..");
		service.signUp(member);
		
		rttr.addAttribute("msg", "SUCCESS");
		model.addAttribute("userid", member.getId());
		return "redirect:/";
	}
	
	/**
	 * 	 로그인 : GET
	 */
	@RequestMapping(value="/fLogin", method=RequestMethod.GET)
	public void loginGET() throws Exception {
		log.info("Login GET ..");
	}
	
	/**
	 *	로그인  : POST  
	 */
	@RequestMapping(value="/fLogin", method=RequestMethod.POST)
	public String loginPOST(String id, String password,
						  RedirectAttributes attr, HttpServletRequest request) throws Exception {

		service.login(id, password);
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		attr.addFlashAttribute("msg", "Login");
		
		return "redirect:/";
	}
	
	/**
	 *  로그아웃  
	 */
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session)throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	
	/**
	 *	마이뮤직 : GET 
	 */
	@RequestMapping(value="/myMusic", method=RequestMethod.GET)
	public String myMusicGET(HttpSession session, RedirectAttributes attr, Model model) throws Exception {
		log.info("myMusic GET.. ");
		
		String userid = (String) session.getAttribute("id");
			 
		if(userid == null){
			attr.addFlashAttribute("plzLogin", "myMusicFail");
			return "redirect:/";
		}else{  //해당 아이디로 favoriteSong table에서 데이터를 가져와서 뿌려준다. 조건1. 데이터가 없으면 없다고 뿌려주고, 조건2. 데이터가 있으면 뿌려준다.
			List<SongVO> vo = favoriteService.searchSong(userid); 
			if(vo.size() != 0){
				model.addAttribute("favoriteSongList", vo);
				model.addAttribute("favoriteSongNum", vo.size());
			}else{
				model.addAttribute("favoriteSongNum", 0);
			}
			model.addAttribute("id", userid);
		}
		return "/member/myMusic";
	}	
}
