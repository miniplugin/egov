## 전자정부표준프레임웍(이하 egov로 표기)<br> 심플홈템플릿(이하 sht로 표기)을 이용한 CMS 만들기
***
전자정부 표준프레임워크 라이선스는 Apache 2.0 라이선스를 따릅니다.부트스트랩/AdminLTE/기타등등<br>
표준프레임워크 내에서 사용된 외부 오픈소스의 경우 원 오픈소스의 라이선스 정책을 유지합니다.
[라이센스 보기](https://www.egovframe.go.kr/EgovLicense.jsp)
***
>작업일자(아래): 20200210
### 게시판 관리중 게시판 생성관리 CRUD 적용

>작업일자(아래): 20200207
### 사이트관리(관리자) 관리자 관리 프로그램 적용

>작업일자(아래): 20200206
### 사이트관리(관리자) 페이지 분리 후 문제 발생 처리
- 관리자관리 기능 추가에 따른 EgovMberManage_SQL_Hsql.xml 추가.
- Hsql, Mysql 2개 같이 호환 않되는 문제가 있어서 초기 파일 EgovMberManage.jsp 수정.
- HsqlDb일때 Select쿼리 preparation구문에서 아래와 같은 쿼리문제 발생(Update, Insert는 정상).
- Hsql 에러메시지(Mysql은 정상): SQL Statement (preparation failed) unexpected token: ?.
- Select, Update, Insert는 문제없고, MysqlDb일때는 문제 없음. 그래서, 확인만 하고 넘어감.
- Hsql 더미데이터: shtdb.sql , Mysql 더미데이터: sht20200206.sql 수정.

>작업일자(아래): 20200205
### 사이트관리(관리자) 페이지 로그인 부분 분리 후 적용(Admin LTE 공개 플러그인 적용)
- egov-com-servlet.xml 파일에 admin 하위 페이지 접속 제한 및 관리자 로그인 경로 사용자와 분리.
- admin 폴더 생성 후 기본 디자인 파일 생성.
- admin/home.do = MainView.jsp 와 LoginUsr.jsp 프로그램 적용.

>작업일자(아래): 20200204
### 기존 심플템플릿과 신규 템플릿 분리 
- [공통]egov3.8개발환경 심플템플릿 기반.
- /src/main/wepapp/resources 추가 후 template_start 추가.
- WEB-INF/jsp/main/template_start 추가.
- 기존 소스 변경한 파일2개: 1).홈페이지 초기화면 EgovMainView.jsp 수정. 기존백업 EgovMainView_org.jsp
- 2).WEB-INF/jsp/cmm/uat/uia/EgovLoginUsr.jsp 수정. 기존백업  EgovLoginUsr_org.jsp

>작업일자(아래): 20200203
### 갤러리 자료실 답글 CRUD프로그램 적용 및 입력/수정후 페이지 새로고침시 데이터중복등록되는 문제 처리
>작업일자(아래): 20200202
### 고객지원 반응형 디자인에 갤러리 자료실 CRUD프로그램 적용
>작업일자(아래): 20200201
### 고객지원 서비스신청 및 갤러리 자료실 리스트/상세뷰/입력 화면 반응형으로 변경
>작업일자(아래): 20200130
### 정보마당, 로그인페이지 반응형으로 변경
>작업일자(아래): 20200129
### 반응형(모바일)에서 2차메뉴 보이기 추가 common_bottom.jsp 에 자바스크립트 추가
>작업일자(아래): 20200128
### egov-sht 프로젝트 Mysql을 Hsql로 변환
- egov3.8개발환경에서는 초기 sht프로젝트는 HsqlDb를 사용합니다.
- 실제 상용 서비스에서는 Mysql을 사용하기 때문에, Mysql로 변경하고, 관리자 기능-관리자등록/삭제 을 추가하였습니다.
- 이번에 View 부분을 반응형으로 바꾸기 위해서, 임시로 HsqlDb로 다시 변경 하였습니다.
- 변경한 파일3개: pom.xml, globals.properties, context-datasource.xml

#### Mysql 일때와 Hsql 일대 스키마 차이는 아래와 같습니다(나머지 테이블 17개는 동일함).
DB구분 | 테이블명 | 확인쿼리
---|:---:|:---
`Mysql용` | comtecopseq / comvnusermaster | `SELECT * FROM comtecopseq;`
`Hsql용` | LETTHEMPLYRINFOCHANGEDTLS / LETTNAUTHORINFO / LETTNEMPLYRSCRTYESTBS | `SELECT * FROM LETTNAUTHORINFO;`
