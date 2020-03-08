/**
 * 개요
 * - 스프링 시큐리티 권한에 대한 model 클래스를 정의한다.
 * 
 * 상세내용
 * - 권한의 패턴, 코드, 설명, 순서, 사용여부 항목을 관리한다.
 * @author KIK
 * @version 1.0
 * @created 03-8-2020
 */

package timespace.miniplugin.authorrole;

import egovframework.com.cmm.ComDefaultVO;

public class AuthorRole extends ComDefaultVO {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 권한 ID
	 */
	private long authorRoleId = 0L;
	/**
	 * 권한 패턴 ROLE_PTTRN
	 */
	private String rolePttrn;
	/**
	 * 권한 코드 AUTHOR_CODE
	 */
	private String authorCode;
	/**
	 * 권한 설명 AUTHORROLE_DC
	 */
	private String authorRoleDc;
	/**
	 * 권한 순서 SORT_ORDR
	 */
	private String sortOrder;
	/**
	 * 사용여부 USE_AT
	 */
	private String useAt;
	
	public long getAuthorRoleId() {
		return authorRoleId;
	}
	public void setAuthorRoleId(long authorRoleId) {
		this.authorRoleId = authorRoleId;
	}
	public String getRolePttrn() {
		return rolePttrn;
	}
	public void setRolePttrn(String rolePttrn) {
		this.rolePttrn = rolePttrn;
	}
	public String getAuthorCode() {
		return authorCode;
	}
	public void setAuthorCode(String authorCode) {
		this.authorCode = authorCode;
	}
	public String getAuthorRoleDc() {
		return authorRoleDc;
	}
	public void setAuthorRoleDc(String authorRoleDc) {
		this.authorRoleDc = authorRoleDc;
	}
	public String getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}
	public String getUseAt() {
		return useAt;
	}
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}
}
