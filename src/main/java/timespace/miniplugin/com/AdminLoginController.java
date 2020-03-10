package timespace.miniplugin.com;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.uat.uia.service.EgovLoginService;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.support.WebApplicationContextUtils;

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
	public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {

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

			// 2. spring security 연동
			//초기값 확인 -> 실제는 하단에서 각각 resultVO.getId(), resultVO.getPassword() 로 변경 처리
			//System.out.println("username=" + resultVO.getUserSe() + resultVO.getId() + " password=" + resultVO.getUniqId());
			request.getSession().setAttribute("LoginVO", resultVO);
			UsernamePasswordAuthenticationFilter springSecurity = null;
			ApplicationContext act = WebApplicationContextUtils
					.getRequiredWebApplicationContext(request.getSession().getServletContext());
			Map<String, UsernamePasswordAuthenticationFilter> beans = act
					.getBeansOfType(UsernamePasswordAuthenticationFilter.class);
			if (beans.size() > 0) {
				springSecurity = (UsernamePasswordAuthenticationFilter) beans.values().toArray()[0];
				springSecurity.setUsernameParameter("egov_security_username");
				springSecurity.setPasswordParameter("egov_security_password");
				springSecurity.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher(
						request.getServletContext().getContextPath() + "/egov_security_login", "POST"));
			} else {
				throw new IllegalStateException("No AuthenticationProcessingFilter");
			}
			springSecurity.setContinueChainBeforeSuccessfulAuthentication(false); // false 이면 chain 처리 되지 않음.. (filter가
																					// 아닌 경우 false로...)
			request.getSession().setAttribute("LoginVO", resultVO);

			springSecurity.doFilter(new RequestWrapperForSecurity(request, resultVO.getId(), resultVO.getPassword()), response, null);
			
			/* 전자정부 기반이 아닌 스프링 시큐리티 기본 출력 
	    	 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    	 Object details = authentication.getDetails();
	    	 System.out.println(authentication);
	    	 System.out.println(details);
	    	 System.out.println(authentication.getAuthorities());
	    	 System.out.println(authentication.getPrincipal());
	    	*/
			/* 전자정부 기반 스프링 시큐리티 확인 
			Boolean isLogin = EgovUserDetailsHelper.isAuthenticated();
	    	System.out.println("isLogin " + isLogin);
	    	LoginVO user = null;
	    	user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
	    	System.out.println("사용자 ID " + user.getId());
	    	*/
			System.out.println("context-security.xml파일의 jdbcAuthoritiesByUsernameQuery 확인");
	    	List<String> authorities = EgovUserDetailsHelper.getAuthorities();
	    	// 1. authorites 에  권한이 있는지 체크 TRUE/FALSE
	    	System.out.println(authorities.contains("ROLE_ADMIN"));
	    	System.out.println(authorities.contains("ROLE_USER"));
	    	System.out.println(authorities.contains("ROLE_ANONYMOUS"));
	    	// 2. authorites 에  ROLE 이 여러개 설정된 경우
	    	if(authorities.size()!=0){
		    	for(Iterator<String> it=authorities.iterator();it.hasNext();){
		    		String auth = it.next();
		    		System.out.println("사용자 권한 " + auth);
		    	}
	    	}
	    	/*
	    	// 3. authorites 에  ROLE 이 하나만 설정된 경우
	    	String auth = (String) authorities.toArray()[0];
	    	System.out.println("권한 auth : " + auth);
	    	*/
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
		/*
		RequestContextHolder.getRequestAttributes().removeAttribute("LoginVO", RequestAttributes.SCOPE_SESSION);
		SecurityContextHolder.clearContext();//스프링 시큐리티 로그아웃 처리 추가
		*/
		HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
		//return "redirect:/admin/actionMain.do"; // cmm/main/mainPage.do
        return "redirect:/admin/adminLoginUsr.do"; 
	}

}
class RequestWrapperForSecurity extends HttpServletRequestWrapper {
	private String username = null;
	private String password = null;

	public RequestWrapperForSecurity(HttpServletRequest request, String username, String password) {
		super(request);

		this.username = username;
		this.password = password;
	}
	
	@Override
	public String getServletPath() {		
		return ((HttpServletRequest) super.getRequest()).getContextPath() + "/egov_security_login";
	}

	@Override
	public String getRequestURI() {		
		return ((HttpServletRequest) super.getRequest()).getContextPath() + "/egov_security_login";
	}

	@Override
	public String getParameter(String name) {
		if (name.equals("egov_security_username")) {
			return username;
		}

		if (name.equals("egov_security_password")) {
			return password;
		}

		return super.getParameter(name);
	}
}