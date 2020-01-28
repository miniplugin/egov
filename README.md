## 전자정부표준프레임웍(이하 egov로 표기)<br> 심플홈템플릿(이하 sht로 표기)을 이용한 CMS 만들기
***
전자정부 표준프레임워크 라이선스는 Apache 2.0 라이선스를 따릅니다.
UI작업에 사용된 부트스트랩은 MIT 라이센스에 따름니다.
[라이센스 보기](https://www.egovframe.go.kr/EgovLicense.jsp)[newtab]
***
> 작업일자: 20200128
### egov-sht 프로젝트 Mysql을 Hsql로 변환
- egov3.8개발환경에서는 초기 sht프로젝트는 HsqlDb를 사용합니다.
- 실제 상용 서비스에서는 Mysql을 사용하기 때문에, Mysql로 변경하고, 관리자 기능-관리자등록/삭제 을 추가하였습니다.
- 이번에 View 부분을 반응형으로 바꾸기 위해서, 임시로 HsqlDb로 다시 변경 하였습니다.

#### Mysql 일때와 Hsql 일대 스키마 차이는 아래와 같습니다(나머지 테이블 17개는 동일함).
DB구분 | 테이블명 | 확인쿼리
---|:---:|:---
`Mysql용` | comtecopseq / comvnusermaster | `SELECT * FROM comtecopseq;`
`Hsql용` | LETTHEMPLYRINFOCHANGEDTLS / LETTNAUTHORINFO / LETTNEMPLYRSCRTYESTBS | `SELECT * FROM LETTNAUTHORINFO;`
