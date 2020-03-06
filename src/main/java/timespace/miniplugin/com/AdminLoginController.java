package timespace.miniplugin.com;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.uat.uia.service.EgovLoginService;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

/**
 * 일반 로그인을 처리하는 컨트롤러 클래스
 * @author 공통서비스 개발팀 KIK
 * @since 2020.02.05
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      수정자      수정내용
 *  -------            --------        ---------------------------
 *  2020.02.05  KIK     최초 생성
 *
 *  </pre>
 */
@Controller
public class AdminLoginController {

	/** EgovLoginService */
	@Resource(name = "loginService")
	private EgovLoginService loginService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** TRACE */
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;

	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/adminLoginUsr.do")
	public String loginUsrView(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "admin/LoginUsr";//cmm/uat/uia/EgovLoginUsr
	}

	/**
	 * 일반 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/actionLogin.do")
	public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {

		/* 세선 내용 확인 테스트
		//세션을 가져온다. (가져올 세션이 없다면 생성한다.)
		HttpSession httpSession = request.getSession(true);
		// "LoginVO"로 바인딩된 객체를 돌려준다. ("LoginVO"로 바인딩된 객체가 없다면 null)
		LoginVO loginVOsession = (LoginVO) httpSession.getAttribute("LoginVO");
		if(loginVOsession != null) {loginVO=loginVOsession;System.out.println(loginVOsession.getId());}
		*/
		// 1. 일반 로그인 처리
		LoginVO resultVO = loginService.actionLogin(loginVO);

		boolean loginPolicyYn = true;

		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("") && loginPolicyYn) {

			request.getSession().setAttribute("LoginVO", resultVO);
			return "forward:/admin/mainPage.do";
		} else {

			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "admin/LoginUsr";
		}

	}

	/**
	 * 로그인 후 메인화면으로 들어간다. 현재 사용되지 않음.
	 * @param
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = {"/admin/home.do","/admin/actionMain.do"})
	public String actionMain(ModelMap model) throws Exception {

		// 1. 사용자 인증 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "admin/LoginUsr";
		}

		// 2. 메인 페이지 이동
		return "forward:/admin/mainPage.do";
	}

	/**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {

		RequestContextHolder.getRequestAttributes().removeAttribute("LoginVO", RequestAttributes.SCOPE_SESSION);

		return "redirect:/admin/actionMain.do"; // cmm/main/mainPage.do
	}

}