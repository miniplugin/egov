/**
 * 개요
 * - 배너에 대한 DAO 클래스를 정의한다.
 * 
 * 상세내용
 * - 배너에 대한 등록, 수정, 삭제, 조회, 반영확인 기능을 제공한다.
 * - 배너의 조회기능은 목록조회, 상세조회로 구분된다.
 * @author 이문준
 * @version 1.0
 * @created 03-8-2009 오후 2:07:11
 */

package timespace.miniplugin.authorrole;

import java.util.List;

import egovframework.com.cmm.service.FileVO;
import timespace.com.cmm.service.impl.EgovComAbstractDAO;
import timespace.miniplugin.authorrole.AuthorRole;
import timespace.miniplugin.authorrole.AuthorRoleVO;

import org.springframework.stereotype.Repository;

@Repository("authorRoleDAO")
public class AuthorRoleDAO extends EgovComAbstractDAO {
	
	/**
	 * 배너를 관리하기 위해 등록된 배너목록을 조회한다.
	 * @param authorRoleVO - 배너 Vo
	 * @return List - 배너 목록
	 * @exception Exception
	 */	
	public List<AuthorRoleVO> selectAuthorRoleList(AuthorRoleVO authorRoleVO) throws Exception {
		return selectList("authorRoleDAO.selectAuthorRoleList", authorRoleVO);
	}

    /**
	 * 배너목록 총 갯수를 조회한다.
	 * @param authorRoleVO AuthorRoleVO
	 * @return int
	 * @exception Exception
	 */
    public int selectAuthorRoleListTotCnt(AuthorRoleVO authorRoleVO) throws Exception {
        return (Integer)selectOne("authorRoleDAO.selectAuthorRoleListTotCnt", authorRoleVO);
    }

	/**
	 * 등록된 배너의 상세정보를 조회한다.
	 * @param authorRoleVO - 배너 Vo
	 * @return AuthorRoleVO - 배너 Vo
	 * 
	 * @param authorRoleVO
	 */
	public AuthorRoleVO selectAuthorRole(AuthorRoleVO authorRoleVO) throws Exception {
		return (AuthorRoleVO) selectOne("authorRoleDAO.selectAuthorRole", authorRoleVO);
	}

	/**
	 * 배너정보를 신규로 등록한다.
	 * @param authorRole - 배너 model
	 */
	public void insertAuthorRole(AuthorRole authorRole) throws Exception {
		long authorRoleId = (Long)selectOne("authorRoleDAO.selectMaxAuthorRoleId");
		authorRole.setAuthorRoleId(authorRoleId);
		insert("authorRoleDAO.insertAuthorRole", authorRole);
	}

	/**
	 * 기 등록된 배너정보를 수정한다.
	 * @param authorRole - 배너 model
	 */
	public void updateAuthorRole(AuthorRole authorRole) throws Exception {
        update("authorRoleDAO.updateAuthorRole", authorRole);
	}

	/**
	 * 기 등록된 배너정보를 삭제한다.
	 * @param authorRole - 배너 model
	 * 
	 * @param authorRole
	 */
	public void deleteAuthorRole(AuthorRole authorRole) throws Exception {
		delete("authorRoleDAO.deleteAuthorRole", authorRole);
	}

	/**
	 * 기 등록된 배너정보의 이미지파일을 삭제하기 위해 파일정보를 조회한다.
	 * @param authorRole - 배너 model
	 * @return FileVO - 파일 VO
	 */
	public FileVO selectAuthorRoleFile(AuthorRole authorRole) throws Exception {
		return (FileVO) selectOne("authorRoleDAO.selectAuthorRoleFile", authorRole);
	}

	/**
	 * 배너가 특정화면에 반영된 결과를 조회한다.
	 * @param authorRoleVO - 배너 VO
	 * @return AuthorRoleVO - 배너 VO
	 * @exception Exception
	 */
	
	public List<AuthorRoleVO> selectAuthorRoleResult(AuthorRoleVO authorRoleVO) throws Exception {
		return selectList("authorRoleDAO.selectAuthorRoleResult", authorRoleVO);
	}

}
