/**
 * 개요
 * - 권한에 대한 Service Interface를 정의한다.
 * 
 * 상세내용
 * - 권한에 대한 등록, 수정, 삭제, 조회, 반영확인 기능을 제공한다.
 * - 권한의 조회기능은 목록조회, 상세조회로 구분된다.
 * @author KIK
 * @version 1.0
 * @created 03-8-2020
 */

package timespace.miniplugin.authorrole;

import java.util.List;

public interface AuthorRoleService {

	/**
	 * 권한을 관리하기 위해 등록된 권한목록을 조회한다.
	 * @param AuthorRoleVO - 권한 Vo
	 * @return List - 권한 목록
	 * 
	 * @param AuthorRoleVO
	 */
	public List<AuthorRoleVO> selectAuthorRoleList(AuthorRoleVO authorRoleVO) throws Exception;

	/**
	 * 권한목록 총 갯수를 조회한다.
	 * @param AuthorRoleVO - 권한 Vo
	 * @return int - 권한 카운트 수
	 * 
	 * @param AuthorRoleVO
	 */
	public int selectAuthorRoleListTotCnt(AuthorRoleVO authorRoleVO) throws Exception;
	
	/**
	 * 등록된 권한의 상세정보를 조회한다.
	 * @param AuthorRoleVO - 권한 Vo
	 * @return AuthorRoleVO - 권한 Vo
	 * 
	 * @param AuthorRoleVO
	 */
	public AuthorRoleVO selectAuthorRole(AuthorRoleVO authorRoleVO) throws Exception;

	/**
	 * 권한정보를 신규로 등록한다.
	 * @param AuthorRole - 권한 model
	 * 
	 * @param AuthorRole
	 */
	public AuthorRoleVO insertAuthorRole(AuthorRole authorRole, AuthorRoleVO authorRoleVO) throws Exception;

	/**
	 * 기 등록된 권한정보를 수정한다.
	 * @param AuthorRole - 권한 model
	 * 
	 * @param AuthorRole
	 */
	public void updateAuthorRole(AuthorRole authorRole) throws Exception;

	/**
	 * 기 등록된 권한정보를 삭제한다.
	 * @param AuthorRole - 권한 model
	 * 
	 * @param AuthorRole
	 */
	public void deleteAuthorRole(AuthorRole authorRole) throws Exception;

}
