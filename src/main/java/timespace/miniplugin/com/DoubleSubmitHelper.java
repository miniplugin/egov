package timespace.miniplugin.com;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import timespace.com.cmm.util.EgovDoubleSubmitHelper;
/**
 * from HttpServletRequest to MultipartHttpServletRequest 확장 to double submit preventer
 * @author Vincent Han
 * @since 2020.02.04
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일        수정자       수정내용
 *  -------    --------    ---------------------------
 *  2020.02.04	KIK			최초 생성
 *
 * </pre>
 */
public class DoubleSubmitHelper extends EgovDoubleSubmitHelper {
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovDoubleSubmitHelper.class);
	
	public static boolean checkAndSaveToken(HttpServletRequest request) {
		return checkAndSaveToken(request, DEFAULT_TOKEN_KEY);
	}
	
	public static boolean checkAndSaveToken(HttpServletRequest request, String tokenKey) {
		
		//RequestContextHolder.setRequestAttributes(new ServletRequestAttributes(request));//request 재설정
		HttpSession session = request.getSession();
		
		// check session...
		if (session.getAttribute(EgovDoubleSubmitHelper.SESSION_TOKEN_KEY) == null) {
			throw new RuntimeException("Double Submit Preventer TagLig isn't set. Check JSP.");
		}

		String parameter = request.getParameter(EgovDoubleSubmitHelper.PARAMETER_NAME);
		// check parameter...
		if (parameter == null) {
			throw new RuntimeException("Double Submit Preventer parameter isn't set. Check JSP.");
		}
		@SuppressWarnings("unchecked")
		Map<String, String> map = (Map<String, String>) session.getAttribute(EgovDoubleSubmitHelper.SESSION_TOKEN_KEY);
		
		if (parameter.equals(map.get(tokenKey))) {
			
			LOGGER.debug("[Double Submit] session token ({}) equals to parameter token.", tokenKey);
			
			map.put(tokenKey, getNewUUID());
			
			return true;
		}

		LOGGER.debug("[Double Submit] session token ({}) isn't equal to parameter token.", tokenKey);
		
		return false;
	}
}
