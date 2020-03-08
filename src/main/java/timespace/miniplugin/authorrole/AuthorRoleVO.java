/**
 * 개요
 * - 스프링 시큐리티 권한에 대한 Vo 클래스를 정의한다.
 * 
 * 상세내용
 * - 권한의 목록 항목을 관리한다.
 * @author KIK
 * @version 1.0
 * @created 03-8-2020
 */

package timespace.miniplugin.authorrole;

import java.util.List;

public class AuthorRoleVO extends AuthorRole {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 권한 목록
	 */	
	List<AuthorRoleVO> authorRoleList;
	
	public List<AuthorRoleVO> getAuthorRoleList() {
		return authorRoleList;
	}

	public void setAuthorRoleList(List<AuthorRoleVO> authorRoleList) {
		this.authorRoleList = authorRoleList;
	}

}
