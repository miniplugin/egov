package timespace.miniplugin.start;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.bbs.service.EgovBBSManageService;
import egovframework.let.cop.com.service.EgovTemplateManageService;
import egovframework.let.cop.com.service.TemplateInfVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * 템플릿 메인 페이지 컨트롤러 클래스(Sample 소스)
 * @author 실행환경 개발팀 JJY
 * @since 2011.08.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2011.08.31  JJY            최초 생성
 *
 * </pre>
 */
@Controller@SessionAttributes(types = ComDefaultVO.class)
public class MainController {

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;
	/**
	 * 사이트 템플릿
	 */
	@Resource(name = "EgovTemplateManageService")
    private EgovTemplateManageService tmplatService;

	/**
	 * 메인 페이지에서 템플릿 화면으로 연계하는 기능을 제공한다.
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/home.do")
	public String forwardPageWithTemplate(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 사이트 템플릿 지정 시작 LETTNTMPLATINFO > TMPLAT_ID[TMPLAT_SITE_DEFAULT]
		String returnUrl = "/main/template/mainPage.do";//초기 템플릿
		TemplateInfVO siteTmplatInfVO = new TemplateInfVO();
		siteTmplatInfVO.setTmplatSeCode("TMPT02");
		//siteTmplatInfVO.setTypeFlag("SITE");
		Map<String, Object> sitemap = tmplatService.selectTemplateInfs(siteTmplatInfVO);
		if(sitemap != null) {
			List<TemplateInfVO> mapList = (List<TemplateInfVO>) sitemap.get("resultList");
			//System.out.println(sitemap.get("resultList"));//디버그
			for(TemplateInfVO templateInfVO : mapList) {
				//System.out.println(templateInfVO.getTmplatId());
				//System.out.println(templateInfVO.getTmplatSeCode());
				//System.out.println(templateInfVO.getUseAt());
				//System.out.println(templateInfVO.getTmplatCours());
				if(templateInfVO.getTmplatSeCode().equals("TMPT02") && templateInfVO.getUseAt().equals("Y")) {
					returnUrl = templateInfVO.getTmplatCours();
				}
			}
	    }
		System.out.println("템플릿 URL: " + returnUrl);
		return "redirect:"+returnUrl; // main/template/mainPage.do || cmm/main/mainPage.do
		// 사이트 템플릿 지정 끝
	}
	
	/**
	 * 메인 페이지에서 각 업무 화면으로 연계하는 기능을 제공한다.
	 *
	 * @param request
	 * @param commandMap
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/main/template/forwardPage.do")
	public String forwardPageWithMenuNo(HttpServletRequest request, @RequestParam Map<String, Object> commandMap)
	  throws Exception{
		return "";
	}

	/**
	 * 템플릿 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/main/template/mainPage.do")
	public String getMgtMainPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		// 공지사항 메인 컨텐츠 조회 시작 ---------------------------------
		BoardVO boardVO = new BoardVO();
		boardVO.setPageUnit(5);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_AAAAAAAAAAAA");

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, "BBSA02");
		model.addAttribute("notiList", map.get("resultList"));

		boardVO.setBbsId("BBSMSTR_BBBBBBBBBBBB");
		map = bbsMngService.selectBoardArticles(boardVO, "BBSA02");
		model.addAttribute("galList", map.get("resultList"));
		// 공지사항 메인컨텐츠 조회 끝 -----------------------------------
	
		return "main/template_start/MainView";
	}

}