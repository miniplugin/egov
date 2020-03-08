/**
 * 개요
 * - 권한에 대한 ServiceImpl 클래스를 정의한다.
 * 
 * 상세내용
 * - 권한에 대한 등록, 수정, 삭제, 조회, 반영확인 기능을 제공한다.
 * - 권한의 조회기능은 목록조회, 상세조회로 구분된다.
 * @author 이문준
 * @version 1.0
 * @created 03-8-2009 오후 2:07:12
 */

package timespace.miniplugin.authorrole;

import java.util.List;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import timespace.miniplugin.authorrole.AuthorRole;
import timespace.miniplugin.authorrole.AuthorRoleVO;
import timespace.miniplugin.authorrole.AuthorRoleService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("authorRoleService")
public class AuthorRoleServiceImpl extends EgovAbstractServiceImpl implements AuthorRoleService {
	
	@Resource(name="authorRoleDAO")
    private AuthorRoleDAO authorRoleDAO;

	/**
	 * 권한를 관리하기 위해 등록된 권한목록을 조회한다.
	 * @param authorRoleVO - 권한 VO
	 * @return List - 권한 목록
	 */
	public List<AuthorRoleVO> selectAuthorRoleList(AuthorRoleVO authorRoleVO) throws Exception{
		return authorRoleDAO.selectAuthorRoleList(authorRoleVO);
	}

	/**
	 * 권한목록 총 갯수를 조회한다.
	 * @param authorRoleVO - 권한 VO
	 * @return int - 권한 카운트 수
	 */
	public int selectAuthorRoleListTotCnt(AuthorRoleVO authorRoleVO) throws Exception {
		return authorRoleDAO.selectAuthorRoleListTotCnt(authorRoleVO);
	}
	
	/**
	 * 등록된 권한의 상세정보를 조회한다.
	 * @param authorRoleVO - 권한 VO
	 * @return AuthorRoleVO - 권한 VO
	 */
	public AuthorRoleVO selectAuthorRole(AuthorRoleVO authorRoleVO) throws Exception{
		return authorRoleDAO.selectAuthorRole(authorRoleVO);
	}

	/**
	 * 권한정보를 신규로 등록한다.
	 * @param authorRole - 권한 model
	 */
	public AuthorRoleVO insertAuthorRole(AuthorRole authorRole, AuthorRoleVO authorRoleVO) throws Exception{
        authorRoleDAO.insertAuthorRole(authorRole);
        return selectAuthorRole(authorRoleVO);
	}

	/**
	 * 기 등록된 권한정보를 수정한다.
	 * @param authorRole - 권한 model
	 */
	public void updateAuthorRole(AuthorRole authorRole) throws Exception{
        authorRoleDAO.updateAuthorRole(authorRole);
	}

	/**
	 * 기 등록된 권한정보를 삭제한다.
	 * @param authorRole - 권한 model
	 */
	public void deleteAuthorRole(AuthorRole authorRole) throws Exception {
        authorRoleDAO.deleteAuthorRole(authorRole);
	}

}