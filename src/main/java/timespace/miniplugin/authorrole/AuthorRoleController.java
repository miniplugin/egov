/**
 * 개요
 * - 권한에 대한 controller 클래스를 정의한다.
 *
 * 상세내용
 * - 권한에 대한 등록, 수정, 삭제, 조회, 사용여부 확인 기능을 제공한다.
 * - 권한의 조회기능은 목록조회, 상세조회로 구분된다.
 * @author KIK
 * @version 1.0
 * @created 03-8-2020
 */

package timespace.miniplugin.authorrole;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import timespace.miniplugin.authorrole.AuthorRole;
import timespace.miniplugin.authorrole.AuthorRoleVO;
import timespace.miniplugin.authorrole.AuthorRoleService;

@Controller
public class AuthorRoleController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "authorRoleService")
    private AuthorRoleService authorRoleService;
    
    /** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

    @Autowired
	private DefaultBeanValidator beanValidator;
	
    /**
	 * 권한 목록화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping("/admin/authorrole/selectAuthorRoleListView.do")
    public String selectAuthorRoleListView() throws Exception {

        return "admin/authorrole/AuthorRoleList";
    }

	/**
	 * 권한를 관리하기 위해 등록된 권한목록을 조회한다.
	 * @param authorRoleVO - 권한 VO
	 * @return String - 리턴 URL
	 * @throws Exception
	 */
    @RequestMapping(value="/admin/authorrole/selectAuthorRoleList.do")
	public String selectAuthorRoleList(@ModelAttribute("authorRoleVO") AuthorRoleVO authorRoleVO,
                             		ModelMap model) throws Exception{

    	// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "admin/LoginUsr";
    	}
    	
    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(authorRoleVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(authorRoleVO.getPageUnit());
		paginationInfo.setPageSize(authorRoleVO.getPageSize());

		authorRoleVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		authorRoleVO.setLastIndex(paginationInfo.getLastRecordIndex());
		authorRoleVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		authorRoleVO.setAuthorRoleList(authorRoleService.selectAuthorRoleList(authorRoleVO));

		model.addAttribute("authorRoleList", authorRoleVO.getAuthorRoleList());

        int totCnt = authorRoleService.selectAuthorRoleListTotCnt(authorRoleVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

		return "admin/authorrole/AuthorRoleList";
	}

	/**
	 * 등록된 권한의 상세정보를 조회한다.
	 * @param authorRoleVO - 권한 Vo
	 * @return String - 리턴 Url
	 */
    @RequestMapping(value="/admin/authorrole/getAuthorRole.do")
	public String selectAuthorRole(@RequestParam("authorRoleId") Long authorRoleId,
			                   @ModelAttribute("authorRoleVO") AuthorRoleVO authorRoleVO,
			                   ModelMap model) throws Exception {

    	// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "admin/LoginUsr";
    	}
    	authorRoleVO.setAuthorRoleId(authorRoleId);

    	model.addAttribute("authorRole", authorRoleService.selectAuthorRole(authorRoleVO));
    	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    	
    	//그룹정보를 조회 - GROUP_ID정보
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));

    	return "admin/authorrole/AuthorRoleUpdt";
	}

	/**
	 * 권한등록 화면으로 이동한다.
	 * @param authorRole - 권한 model
	 * @return String - 리턴 Url
	 */
    @RequestMapping(value="/admin/authorrole/addViewAuthorRole.do")
	public String insertViewAuthorRole(@ModelAttribute("authorRoleVO") AuthorRoleVO authorRoleVO,
			                        ModelMap model) throws Exception {

    	// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "admin/LoginUsr";
    	}
    	model.addAttribute("authorRole", authorRoleVO);
    	//그룹정보를 조회 - GROUP_ID정보
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));
    	return "admin/authorrole/AuthorRoleRegist";
	}

	/**
	 * 권한정보를 신규로 등록한다.
	 * @param authorRole - 권한 model
	 * @return String - 리턴 Url
	 */
	@RequestMapping(value="/admin/authorrole/addAuthorRole.do")
	public String insertAuthorRole(@ModelAttribute("authorRole") AuthorRole authorRole,
			                   @ModelAttribute("authorRoleVO") AuthorRoleVO authorRoleVO,
			                    BindingResult bindingResult,
			                    SessionStatus status,
			                    ModelMap model) throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "admin/LoginUsr";
    	}
		beanValidator.validate(authorRole, bindingResult); //validation 수행

    	if (bindingResult.hasErrors()) {
    		model.addAttribute("authorRoleVO", authorRoleVO);
			return "admin/authorrole/AuthorRoleRegist";
		} else {
	    	status.setComplete();
	    	model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
	    	model.addAttribute("authorRole", authorRoleService.insertAuthorRole(authorRole, authorRoleVO));
			return "forward:/admin/authorrole/selectAuthorRoleList.do";

		}
	}

	/**
	 * 기 등록된 권한정보를 수정한다.
	 * @param authorRole - 권한 model
	 * @return String - 리턴 Url
	 */
    @RequestMapping(value="/admin/authorrole/updtAuthorRole.do")
	public String updateAuthorRole(@ModelAttribute("authorRole") AuthorRole authorRole,
			                    BindingResult bindingResult,
                                SessionStatus status,
                                ModelMap model) throws Exception {
    	// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "admin/LoginUsr";
    	}
    	beanValidator.validate(authorRole, bindingResult); //validation 수행

		if (bindingResult.hasErrors()) {
			model.addAttribute("authorRoleVO", authorRole);
			return "admin/authorrole/AuthorRoleUpdt";
		} else {
			authorRoleService.updateAuthorRole(authorRole);
			return "forward:/admin/authorrole/selectAuthorRoleList.do";
		}
	}

	/**
	 * 기 등록된 권한정보를 삭제한다.
	 * @param authorRole AuthorRole
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/admin/authorrole/removeAuthorRole.do")
	public String deleteAuthorRole(@RequestParam("authorRoleId") Long authorRoleId,
			                   @ModelAttribute("authorRole") AuthorRole authorRole,
			                    SessionStatus status,
			                    ModelMap model) throws Exception {

    	// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "admin/LoginUsr";
    	}
    	authorRole.setAuthorRoleId(authorRoleId);
    	authorRoleService.deleteAuthorRole(authorRole);
    	status.setComplete();
    	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
		return "forward:/admin/authorrole/selectAuthorRoleList.do";
	}
}
