package timespace.miniplugin.com;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

/**
 * Admin 인증여부 체크 인터셉터
 * @author 공통서비스 개발팀 KIK
 * @since 2020.02.05
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2020.02.05  KIK          최초 생성
 *  
 *  </pre>
 */
public class AuthenticInterceptor extends WebContentInterceptor {
	/**
	 * 세션에 계정정보(LoginVO)가 있는지 여부로 인증 여부를 체크한다.
	 * 계정정보(LoginVO)가 없다면, 로그인 페이지로 이동한다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		if (loginVO.getId() != null) {
			return true;
		} else {
			ModelAndView modelAndView = new ModelAndView("redirect:/admin/adminLoginUsr.do");
			throw new ModelAndViewDefiningException(modelAndView);
		}
	}

}