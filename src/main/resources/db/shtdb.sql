CREATE MEMORY TABLE LETTCCMMNCLCODE(CL_CODE CHAR(3) NOT NULL PRIMARY KEY,CL_CODE_NM VARCHAR(60),CL_CODE_DC VARCHAR(200),USE_AT CHAR(1),FRST_REGIST_PNTTM TIMESTAMP,FRST_REGISTER_ID VARCHAR(20),LAST_UPDT_PNTTM TIMESTAMP,LAST_UPDUSR_ID VARCHAR(20))
CREATE MEMORY TABLE LETTCCMMNCODE(CODE_ID VARCHAR(6) NOT NULL PRIMARY KEY,CODE_ID_NM VARCHAR(60),CODE_ID_DC VARCHAR(200),USE_AT CHAR(1),CL_CODE CHAR(3),FRST_REGIST_PNTTM TIMESTAMP,FRST_REGISTER_ID VARCHAR(20),LAST_UPDT_PNTTM TIMESTAMP,LAST_UPDUSR_ID VARCHAR(20),CONSTRAINT SYS_FK_86 FOREIGN KEY(CL_CODE) REFERENCES LETTCCMMNCLCODE(CL_CODE))
CREATE MEMORY TABLE LETTCCMMNDETAILCODE(CODE_ID VARCHAR(6) NOT NULL,CODE VARCHAR(15) NOT NULL,CODE_NM VARCHAR(60),CODE_DC VARCHAR(200),USE_AT CHAR(1),FRST_REGIST_PNTTM TIMESTAMP,FRST_REGISTER_ID VARCHAR(20),LAST_UPDT_PNTTM TIMESTAMP,LAST_UPDUSR_ID VARCHAR(20),PRIMARY KEY(CODE_ID,CODE),CONSTRAINT SYS_FK_89 FOREIGN KEY(CODE_ID) REFERENCES LETTCCMMNCODE(CODE_ID))
CREATE MEMORY TABLE LETTHEMPLYRINFOCHANGEDTLS(EMPLYR_ID VARCHAR(20) NOT NULL,CHANGE_DE CHAR(20) NOT NULL,ORGNZT_ID CHAR(20),GROUP_ID CHAR(20),EMPL_NO VARCHAR(20) NOT NULL,SEXDSTN_CODE CHAR(1),BRTHDY CHAR(20),FXNUM VARCHAR(20),HOUSE_ADRES VARCHAR(100) NOT NULL,HOUSE_END_TELNO VARCHAR(4),AREA_NO VARCHAR(4),DETAIL_ADRES VARCHAR(100) NOT NULL,ZIP VARCHAR(6) NOT NULL,OFFM_TELNO VARCHAR(20),MBTLNUM VARCHAR(20) NOT NULL,EMAIL_ADRES VARCHAR(50),HOUSE_MIDDLE_TELNO VARCHAR(4),PSTINST_CODE CHAR(8),EMPLYR_STTUS_CODE VARCHAR(15) NOT NULL,ESNTL_ID CHAR(20),PRIMARY KEY(EMPLYR_ID,CHANGE_DE))
CREATE MEMORY TABLE LETTNAUTHORGROUPINFO(GROUP_ID CHAR(20) NOT NULL PRIMARY KEY,GROUP_NM VARCHAR(60) NOT NULL,GROUP_CREAT_DE CHAR(20) NOT NULL,GROUP_DC VARCHAR(100))
CREATE MEMORY TABLE LETTNAUTHORINFO(AUTHOR_CODE VARCHAR(30) NOT NULL PRIMARY KEY,AUTHOR_NM VARCHAR(60) NOT NULL,AUTHOR_DC VARCHAR(200),AUTHOR_CREAT_DE CHAR(20) NOT NULL)
CREATE MEMORY TABLE LETTNBBS(NTT_ID NUMERIC(20) NOT NULL,BBS_ID CHAR(20) NOT NULL,NTT_NO NUMERIC(20),NTT_SJ VARCHAR(2000),NTT_CN LONGVARCHAR,ANSWER_AT CHAR(1),PARNTSCTT_NO NUMERIC(10),ANSWER_LC INTEGER,SORT_ORDR NUMERIC(8),RDCNT NUMERIC(10),USE_AT CHAR(1) NOT NULL,NTCE_BGNDE CHAR(20),NTCE_ENDDE CHAR(20),NTCR_ID VARCHAR(20),NTCR_NM VARCHAR(20),PASSWORD VARCHAR(200),ATCH_FILE_ID CHAR(20),FRST_REGIST_PNTTM TIMESTAMP NOT NULL,FRST_REGISTER_ID VARCHAR(20) NOT NULL,LAST_UPDT_PNTTM TIMESTAMP,LAST_UPDUSR_ID VARCHAR(20),PRIMARY KEY(NTT_ID,BBS_ID))
CREATE MEMORY TABLE LETTNBBSMASTER(BBS_ID CHAR(20) NOT NULL PRIMARY KEY,BBS_NM VARCHAR(255) NOT NULL,BBS_INTRCN VARCHAR(2400),BBS_TY_CODE CHAR(6) NOT NULL,BBS_ATTRB_CODE CHAR(6) NOT NULL,REPLY_POSBL_AT CHAR(1),FILE_ATCH_POSBL_AT CHAR(1) NOT NULL,ATCH_POSBL_FILE_NUMBER NUMERIC(2) NOT NULL,ATCH_POSBL_FILE_SIZE NUMERIC(8),USE_AT CHAR(1) NOT NULL,TMPLAT_ID CHAR(20),FRST_REGISTER_ID VARCHAR(20) NOT NULL,FRST_REGIST_PNTTM TIMESTAMP NOT NULL,LAST_UPDUSR_ID VARCHAR(20),LAST_UPDT_PNTTM TIMESTAMP)
CREATE MEMORY TABLE LETTNBBSMASTEROPTN(BBS_ID CHAR(20) DEFAULT '' NOT NULL PRIMARY KEY,ANSWER_AT CHAR(1) DEFAULT '' NOT NULL,STSFDG_AT CHAR(1) DEFAULT '' NOT NULL,FRST_REGIST_PNTTM TIMESTAMP DEFAULT '1970-01-01 00:00:00.0' NOT NULL,LAST_UPDT_PNTTM TIMESTAMP,FRST_REGISTER_ID VARCHAR(20) DEFAULT '' NOT NULL,LAST_UPDUSR_ID VARCHAR(20))
CREATE MEMORY TABLE LETTNBBSUSE(BBS_ID CHAR(20) NOT NULL,TRGET_ID CHAR(20) NOT NULL,USE_AT CHAR(1) NOT NULL,REGIST_SE_CODE CHAR(6),FRST_REGIST_PNTTM TIMESTAMP,FRST_REGISTER_ID VARCHAR(20) NOT NULL,LAST_UPDT_PNTTM TIMESTAMP,LAST_UPDUSR_ID VARCHAR(20),PRIMARY KEY(BBS_ID,TRGET_ID),CONSTRAINT SYS_FK_98 FOREIGN KEY(BBS_ID) REFERENCES LETTNBBSMASTER(BBS_ID))
CREATE MEMORY TABLE LETTNEMPLYRINFO(EMPLYR_ID VARCHAR(20) NOT NULL PRIMARY KEY,ORGNZT_ID CHAR(20),USER_NM VARCHAR(60) NOT NULL,PASSWORD VARCHAR(200) NOT NULL,EMPL_NO VARCHAR(20),IHIDNUM VARCHAR(13),SEXDSTN_CODE CHAR(1),BRTHDY CHAR(20),FXNUM VARCHAR(20),HOUSE_ADRES VARCHAR(100) NOT NULL,PASSWORD_HINT VARCHAR(100) NOT NULL,PASSWORD_CNSR VARCHAR(100) NOT NULL,HOUSE_END_TELNO VARCHAR(4) NOT NULL,AREA_NO VARCHAR(4) NOT NULL,DETAIL_ADRES VARCHAR(100),ZIP VARCHAR(6) NOT NULL,OFFM_TELNO VARCHAR(20),MBTLNUM VARCHAR(20) NOT NULL,EMAIL_ADRES VARCHAR(50),OFCPS_NM VARCHAR(60),HOUSE_MIDDLE_TELNO VARCHAR(4) NOT NULL,GROUP_ID CHAR(20),PSTINST_CODE CHAR(8),EMPLYR_STTUS_CODE VARCHAR(15) NOT NULL,ESNTL_ID CHAR(20) NOT NULL,CRTFC_DN_VALUE VARCHAR(20),SBSCRB_DE TIMESTAMP,CONSTRAINT SYS_FK_101 FOREIGN KEY(GROUP_ID) REFERENCES LETTNAUTHORGROUPINFO(GROUP_ID) ON DELETE CASCADE)
CREATE MEMORY TABLE LETTNEMPLYRSCRTYESTBS(SCRTY_DTRMN_TRGET_ID VARCHAR(20) NOT NULL PRIMARY KEY,MBER_TY_CODE VARCHAR(15),AUTHOR_CODE VARCHAR(30) NOT NULL,CONSTRAINT SYS_FK_104 FOREIGN KEY(SCRTY_DTRMN_TRGET_ID) REFERENCES LETTNEMPLYRINFO(EMPLYR_ID),CONSTRAINT SYS_FK_113 FOREIGN KEY(AUTHOR_CODE) REFERENCES LETTNAUTHORINFO(AUTHOR_CODE))
CREATE MEMORY TABLE LETTNENTRPRSMBER(ENTRPRS_MBER_ID VARCHAR(20) NOT NULL PRIMARY KEY,ENTRPRS_SE_CODE CHAR(15),BIZRNO VARCHAR(10),JURIRNO VARCHAR(13),CMPNY_NM VARCHAR(60) NOT NULL,CXFC VARCHAR(50),ZIP VARCHAR(6) NOT NULL,ADRES VARCHAR(100) NOT NULL,ENTRPRS_MIDDLE_TELNO VARCHAR(4) NOT NULL,FXNUM VARCHAR(20),INDUTY_CODE CHAR(15),APPLCNT_NM VARCHAR(50) NOT NULL,APPLCNT_IHIDNUM VARCHAR(13),SBSCRB_DE TIMESTAMP,ENTRPRS_MBER_STTUS VARCHAR(15),ENTRPRS_MBER_PASSWORD VARCHAR(200),ENTRPRS_MBER_PASSWORD_HINT VARCHAR(100) NOT NULL,ENTRPRS_MBER_PASSWORD_CNSR VARCHAR(100) NOT NULL,GROUP_ID CHAR(20),DETAIL_ADRES VARCHAR(100),ENTRPRS_END_TELNO VARCHAR(4) NOT NULL,AREA_NO VARCHAR(4) NOT NULL,APPLCNT_EMAIL_ADRES VARCHAR(50) NOT NULL,ESNTL_ID CHAR(20) NOT NULL,CONSTRAINT SYS_FK_116 FOREIGN KEY(GROUP_ID) REFERENCES LETTNAUTHORGROUPINFO(GROUP_ID) ON DELETE CASCADE)
CREATE MEMORY TABLE LETTNFILE(ATCH_FILE_ID CHAR(20) NOT NULL PRIMARY KEY,CREAT_DT TIMESTAMP NOT NULL,USE_AT CHAR(1))
CREATE MEMORY TABLE LETTNFILEDETAIL(ATCH_FILE_ID CHAR(20) NOT NULL,FILE_SN NUMERIC(10) NOT NULL,FILE_STRE_COURS VARCHAR(2000) NOT NULL,STRE_FILE_NM VARCHAR(255) NOT NULL,ORIGNL_FILE_NM VARCHAR(255),FILE_EXTSN VARCHAR(20) NOT NULL,FILE_CN LONGVARCHAR,FILE_SIZE NUMERIC(8),PRIMARY KEY(ATCH_FILE_ID,FILE_SN),CONSTRAINT SYS_FK_119 FOREIGN KEY(ATCH_FILE_ID) REFERENCES LETTNFILE(ATCH_FILE_ID))
CREATE MEMORY TABLE LETTNGNRLMBER(MBER_ID VARCHAR(20) NOT NULL PRIMARY KEY,PASSWORD VARCHAR(200) NOT NULL,PASSWORD_HINT VARCHAR(100),PASSWORD_CNSR VARCHAR(100),IHIDNUM VARCHAR(13),MBER_NM VARCHAR(50) NOT NULL,ZIP VARCHAR(6) NOT NULL,ADRES VARCHAR(100) NOT NULL,AREA_NO VARCHAR(4) NOT NULL,MBER_STTUS VARCHAR(15),DETAIL_ADRES VARCHAR(100),END_TELNO VARCHAR(4) NOT NULL,MBTLNUM VARCHAR(20) NOT NULL,GROUP_ID CHAR(20),MBER_FXNUM VARCHAR(20),MBER_EMAIL_ADRES VARCHAR(50),MIDDLE_TELNO VARCHAR(4) NOT NULL,SBSCRB_DE TIMESTAMP,SEXDSTN_CODE CHAR(1),ESNTL_ID CHAR(20) NOT NULL,CONSTRAINT SYS_FK_122 FOREIGN KEY(GROUP_ID) REFERENCES LETTNAUTHORGROUPINFO(GROUP_ID) ON DELETE CASCADE)
CREATE MEMORY TABLE LETTNORGNZTINFO(ORGNZT_ID CHAR(20) NOT NULL PRIMARY KEY,ORGNZT_NM VARCHAR(20) NOT NULL,ORGNZT_DC VARCHAR(100))
CREATE MEMORY TABLE LETTNSCHDULINFO(SCHDUL_ID CHAR(20) NOT NULL PRIMARY KEY,SCHDUL_SE CHAR(1),SCHDUL_DEPT_ID VARCHAR(20),SCHDUL_KND_CODE VARCHAR(20),SCHDUL_BEGINDE TIMESTAMP,SCHDUL_ENDDE TIMESTAMP,SCHDUL_NM VARCHAR(255),SCHDUL_CN VARCHAR(2500),SCHDUL_PLACE VARCHAR(255),SCHDUL_IPCR_CODE CHAR(1),SCHDUL_CHARGER_ID VARCHAR(20),ATCH_FILE_ID CHAR(20),FRST_REGIST_PNTTM TIMESTAMP,FRST_REGISTER_ID VARCHAR(20),LAST_UPDT_PNTTM TIMESTAMP,LAST_UPDUSR_ID VARCHAR(20),REPTIT_SE_CODE CHAR(3))
CREATE MEMORY TABLE LETTNTMPLATINFO(TMPLAT_ID CHAR(20) NOT NULL PRIMARY KEY,TMPLAT_NM VARCHAR(255),TMPLAT_COURS VARCHAR(2000),USE_AT CHAR(1),TMPLAT_SE_CODE CHAR(6),FRST_REGISTER_ID VARCHAR(20),FRST_REGIST_PNTTM TIMESTAMP,LAST_UPDUSR_ID VARCHAR(20),LAST_UPDT_PNTTM TIMESTAMP)
CREATE MEMORY TABLE IDS(TABLE_NAME VARCHAR(20) DEFAULT '' NOT NULL PRIMARY KEY,NEXT_ID NUMERIC(30) DEFAULT 0 NOT NULL)
CREATE MEMORY TABLE COMTECOPSEQ(TABLE_NAME VARCHAR(20) DEFAULT '' NOT NULL PRIMARY KEY,NEXT_ID NUMERIC(30) DEFAULT 0 NOT NULL)
ALTER TABLE LETTHEMPLYRINFOCHANGEDTLS ADD CONSTRAINT SYS_FK_92 FOREIGN KEY(EMPLYR_ID) REFERENCES LETTNEMPLYRINFO(EMPLYR_ID)
ALTER TABLE LETTNBBS ADD CONSTRAINT SYS_FK_95 FOREIGN KEY(BBS_ID) REFERENCES LETTNBBSMASTER(BBS_ID)
ALTER TABLE LETTNEMPLYRSCRTYESTBS ADD CONSTRAINT SYS_FK_107 FOREIGN KEY(SCRTY_DTRMN_TRGET_ID) REFERENCES LETTNENTRPRSMBER(ENTRPRS_MBER_ID)
ALTER TABLE LETTNEMPLYRSCRTYESTBS ADD CONSTRAINT SYS_FK_110 FOREIGN KEY(SCRTY_DTRMN_TRGET_ID) REFERENCES LETTNGNRLMBER(MBER_ID)
SET WRITE_DELAY 20
SET SCHEMA PUBLIC
INSERT INTO LETTCCMMNCLCODE VALUES('LET','전자정부 프레임워크 경량환경 템플릿','전자정부 프레임워크 경량환경 템플릿','Y','2011-08-31 00:00:00.000000000','SYSTEM','2011-08-31 00:00:00.000000000','SYSTEM')
INSERT INTO LETTCCMMNCODE VALUES ('COM001', '등록구분', '게시판, 커뮤니티, 동호회 등록구분코드', 'Y', 'LET', '2011-08-02 21:13:36', 'SYSTEM', '2011-08-02 21:13:36', 'SYSTEM'),('COM003', '업무구분', '업무구분코드', 'Y', 'LET', '2011-08-02 21:13:36', 'SYSTEM', '2011-08-02 21:13:36', 'SYSTEM'),('COM004', '게시판유형', '게시판유형구분코드', 'Y', 'LET', '2011-08-02 21:13:36', 'SYSTEM', '2011-08-02 21:13:36', 'SYSTEM'),('COM005', '템플릿유형', '템플릿유형구분코드', 'Y', 'LET', '2011-08-02 21:13:36', 'SYSTEM', '2011-08-02 21:13:36', 'SYSTEM'),('COM009', '게시판속성', '게시판 속성', 'Y', 'LET', '2011-08-02 21:13:36', 'SYSTEM', '2011-08-02 21:13:36', 'SYSTEM'),('COM013', '회원상태', '회원 가입 신청/승인/삭제를 위한 상태 구분', 'Y', 'LET', '2011-08-12 10:52:34', 'SYSTEM', '2011-08-12 10:52:34', 'SYSTEM'),('COM014', '성별구분', '남녀 성별 구분', 'Y', 'LET', '2011-08-12 10:52:34', 'SYSTEM', '2011-08-12 10:52:34', 'SYSTEM'),('COM018', '질문유형', '질문유형 객관식/주관식 상태구분', 'Y', 'LET', '2011-08-24 16:37:56', 'SYSTEM', '2011-08-24 16:37:56', 'SYSTEM'),('COM022', '비밀번호 힌트', '비밀번호 힌트 구분코드', 'Y', 'LET', '2011-08-12 10:52:34', 'SYSTEM', '2011-08-12 10:52:34', 'SYSTEM'),('COM028', '질의응답처리상태', 'Q/A 처리상태코드', 'Y', 'LET', '2011-08-22 20:53:01', 'SYSTEM', '2011-08-22 20:53:01', 'SYSTEM'),('COM029', '롤유형코드', '롤유형코드', 'Y', 'LET', '2011-08-12 10:46:39', 'SYSTEM', '2011-08-12 10:46:39', 'SYSTEM'),('COM034', '직업유형', '직업유형코드', 'Y', 'LET', '2011-08-24 14:41:07', 'SYSTEM', '2011-08-24 14:41:07', 'SYSTEM')
INSERT INTO LETTCCMMNDETAILCODE VALUES ('COM001', 'REGC01', '단일 게시판 이용등록', '단일 게시판 이용등록', 'Y', '2011-08-02 21:13:36', 'SYSTEM', '2011-08-02 21:13:36', 'SYSTEM'),('COM001', 'REGC07', '게시판사용자등록', '게시판사용자등록', 'Y', '2011-08-02 21:13:36', 'SYSTEM', '2011-08-02 21:13:36', 'SYSTEM'),('COM003', 'BBS', '게시판', '게시판', 'Y', '2011-08-02 21:13:36', 'SYSTEM', '2011-08-02 21:13:36', 'SYSTEM'),('COM004', 'BBST01', '일반게시판', '일반게시판', 'Y', '2011-08-02 21:13:36', 'SYSTEM', '2011-08-02 21:13:36', 'SYSTEM'),('COM004', 'BBST02', '익명게시판', '익명게시판', 'N', '2011-08-02 21:13:36', 'SYSTEM', '2011-08-02 21:13:36', 'SYSTEM'),('COM004', 'BBST03', '공지게시판', '공지게시판', 'Y', '2011-08-02 21:13:36', 'SYSTEM', '2011-08-02 21:13:36', 'SYSTEM'),('COM005', 'TMPT01', '게시판템플릿', '게시판템플릿', 'Y', '2011-08-02 21:13:36', 'SYSTEM', '2011-08-02 21:13:36', 'SYSTEM'),('COM009', 'BBSA01', '유효게시판', '유효게시판', 'N', '2011-08-02 21:13:37', 'SYSTEM', '2011-08-02 21:13:37', 'SYSTEM'),('COM009', 'BBSA02', '갤러리', '갤러리', 'Y', '2011-08-02 21:13:37', 'SYSTEM', '2011-08-02 21:13:37', 'SYSTEM'),('COM009', 'BBSA03', '일반게시판', '일반게시판', 'Y', '2011-08-02 21:13:37', 'SYSTEM', '2011-08-02 21:13:37', 'SYSTEM'),('COM013', 'A', '회원 가입 신청 상태', '회원 가입 신청 상태', 'Y', '2011-08-12 10:57:34', 'SYSTEM', '2011-08-12 10:57:34', 'SYSTEM'),('COM013', 'D', '회원 가입 삭제 상태', '회원 가입 삭제 상태', 'Y', '2011-08-12 10:57:34', 'SYSTEM', '2011-08-12 10:57:34', 'SYSTEM'),('COM013', 'P', '회원 가입 승인 상태', '회원 가입 승인 상태', 'Y', '2011-08-12 10:57:34', 'SYSTEM', '2011-08-12 10:57:34', 'SYSTEM'),('COM014', 'F', '여자', '여자', 'Y', '2011-08-12 10:57:34', 'SYSTEM', '2011-08-12 10:57:34', 'SYSTEM'),('COM014', 'M', '남자', '남자', 'Y', '2011-08-12 10:57:34', 'SYSTEM', '2011-08-12 10:57:34', 'SYSTEM'),('COM018', '1', '객관식', '객관식', 'Y', '2011-08-24 16:37:56', 'SYSTEM', '2011-08-24 16:37:56', 'SYSTEM'),('COM018', '2', '주관식', '주관식', 'Y', '2011-08-24 16:37:56', 'SYSTEM', '2011-08-24 16:37:56', 'SYSTEM'),('COM022', ' P01', '가장 기억에 남는 장소는?', '가장 기억에 남는 장소는?', 'Y', '2011-08-12 10:57:33', 'SYSTEM', '2011-08-12 10:57:33', 'SYSTEM'),('COM022', ' P02', '나의 좌우명은?', '나의 좌우명은?', 'Y', '2011-08-12 10:57:33', 'SYSTEM', '2011-08-12 10:57:33', 'SYSTEM'),('COM022', ' P03', '나의 보물 제1호는?', '나의 보물 제1호는?', 'Y', '2011-08-12 10:57:33', 'SYSTEM', '2011-08-12 10:57:33', 'SYSTEM'),('COM022', ' P04', '가장 기억에 남는 선생님 성함은?', '가장 기억에 남는 선생님 성함은?', 'Y', '2011-08-12 10:57:33', 'SYSTEM', '2011-08-12 10:57:33', 'SYSTEM'),('COM022', ' P05', '다른 사람은 모르는 나만의 신체비밀은?', '다른 사람은 모르는 나만의 신체비밀은?', 'Y', '2011-08-12 10:57:33', 'SYSTEM', '2011-08-12 10:57:33', 'SYSTEM'),('COM028', '1', '접수대기', '접수대기', 'Y', '2011-08-22 20:53:02', 'SYSTEM', '2011-08-22 20:53:02', 'SYSTEM'),('COM028', '2', '접수', '접수', 'Y', '2011-08-22 20:53:02', 'SYSTEM', '2011-08-22 20:53:02', 'SYSTEM'),('COM028', '3', '완료', '완료', 'Y', '2011-08-22 20:53:02', 'SYSTEM', '2011-08-22 20:53:02', 'SYSTEM'),('COM029', 'url', 'URL', 'URL', 'Y', '2011-08-12 10:46:39', 'SYSTEM', '2011-08-12 10:46:39', 'SYSTEM'),('COM034', '1', '학생', '학생', 'Y', '2011-08-24 14:41:44', 'SYSTEM', '2011-08-24 14:41:44', 'SYSTEM'),('COM034', '2', '대학생', '대학생', 'Y', '2011-08-24 14:41:44', 'SYSTEM', '2011-08-24 14:41:44', 'SYSTEM'),('COM034', '3', '군인', '군인', 'Y', '2011-08-24 14:41:45', 'SYSTEM', '2011-08-24 14:41:45', 'SYSTEM'),('COM034', '4', '교사', '교사', 'Y', '2011-08-24 14:41:45', 'SYSTEM', '2011-08-24 14:41:45', 'SYSTEM'),('COM034', '5', '기타', '기타', 'Y', '2011-08-24 14:41:45', 'SYSTEM', '2011-08-24 14:41:45', 'SYSTEM')
INSERT INTO LETTNAUTHORGROUPINFO VALUES('GROUP_00000000000000','기본 그룹입니다','2011-08-31','기본 그룹')
INSERT INTO LETTNBBSMASTER VALUES('BBSMSTR_AAAAAAAAAAAA','공지사항','공지사항게시판','BBST03','BBSA03','Y','Y',2,5242880,'Y','TMPLAT_BOARD_DEFAULT','USRCNFRM_00000000000','2011-08-31 12:00:00.000000000','USRCNFRM_00000000000','2011-08-31 12:00:00.000000000')
INSERT INTO LETTNBBSMASTER VALUES('BBSMSTR_BBBBBBBBBBBB','갤러리','갤러리게시판','BBST01','BBSA02','Y','Y',2,5242880,'Y','TMPLAT_BOARD_DEFAULT','USRCNFRM_00000000000','2011-08-31 12:00:00.000000000','USRCNFRM_00000000000','2011-08-31 12:00:00.000000000')
INSERT INTO LETTNBBSUSE VALUES('BBSMSTR_AAAAAAAAAAAA','SYSTEM_DEFAULT_BOARD','Y','REGC01','2011-08-31 12:00:00.000000000','USRCNFRM_00000000000','2011-08-31 12:00:00.000000000','USRCNFRM_00000000000')
INSERT INTO LETTNBBSUSE VALUES('BBSMSTR_BBBBBBBBBBBB','SYSTEM_DEFAULT_BOARD','Y','REGC01','2011-08-31 12:00:00.000000000','USRCNFRM_00000000000','2011-08-31 12:00:00.000000000','USRCNFRM_00000000000')
INSERT INTO LETTNEMPLYRINFO VALUES('admin','ORGNZT_0000000000000','관리자','DUzTQigHMa1bSbwvQTmDhgz236LDOM2/UMLlhTtsmUQ=','','','F','','','관리자 주소','','','','','','','','','','','','GROUP_00000000000000','00000000','P','USRCNFRM_00000000000','','2011-08-31 00:00:00.000000000')
INSERT INTO LETTNTMPLATINFO VALUES('TMPLAT_BOARD_DEFAULT','게시판 기본템플릿','/css/egovframework/cop/bbs/egovbbsTemplate.css','Y','TMPT01','SYSTEM','2011-08-31 00:00:00.000000000',NULL,NULL)
INSERT INTO IDS VALUES('BBS_ID',1)
INSERT INTO IDS VALUES('FILE_ID',1)
INSERT INTO IDS VALUES('SAMPLE',1)
INSERT INTO IDS VALUES('SCHDUL_ID',1)
INSERT INTO IDS VALUES('TMPLAT_ID',1)
INSERT INTO LETTNBBS VALUES(1,'BBSMSTR_AAAAAAAAAAAA',1,'홈페이지 샘플공지1 수정테스트','홈페이지 샘플공지1','N',0,0,2,1,'Y','10000101','99991231','','','',NULL,'2017-12-04 20:19:21','USRCNFRM_00000000000','2017-12-05 15:17:09','USRCNFRM_00000000000'),(2,'BBSMSTR_AAAAAAAAAAAA',2,'홈페이지 샘플공지2','홈페이지 샘플공지2','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2017-12-04 20:19:21','USRCNFRM_00000000000',NULL,NULL),(3,'BBSMSTR_AAAAAAAAAAAA',3,'홈페이지 샘플공지3','홈페이지 샘플공지3','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2017-12-04 20:19:21','USRCNFRM_00000000000',NULL,NULL),(4,'BBSMSTR_AAAAAAAAAAAA',4,'홈페이지 샘플공지4','홈페이지 샘플공지4','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2017-12-04 20:19:21','USRCNFRM_00000000000',NULL,NULL),(5,'BBSMSTR_AAAAAAAAAAAA',5,'홈페이지 샘플공지5','홈페이지 샘플공지5','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2017-12-04 20:19:21','USRCNFRM_00000000000',NULL,NULL),(6,'BBSMSTR_BBBBBBBBBBBB',6,'홈페이지 샘플게시1','홈페이지 샘플게시1','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2017-12-04 20:19:21','USRCNFRM_00000000000',NULL,NULL),(7,'BBSMSTR_BBBBBBBBBBBB',7,'홈페이지 샘플게시2','홈페이지 샘플게시2','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2017-12-04 20:19:21','USRCNFRM_00000000000',NULL,NULL),(8,'BBSMSTR_BBBBBBBBBBBB',8,'홈페이지 샘플게시3','홈페이지 샘플게시3','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2017-12-04 20:19:21','USRCNFRM_00000000000',NULL,NULL),(9,'BBSMSTR_BBBBBBBBBBBB',9,'홈페이지 샘플게시4','홈페이지 샘플게시4','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2017-12-04 20:19:21','USRCNFRM_00000000000',NULL,NULL),(10,'BBSMSTR_BBBBBBBBBBBB',10,'홈페이지 샘플게시5','홈페이지 샘플게시5','N',0,0,2,0,'Y','10000101','99991231','','','',NULL,'2017-12-04 20:19:21','USRCNFRM_00000000000',NULL,NULL)
INSERT INTO LETTNORGNZTINFO VALUES ('ORGNZT_0000000000000','기본조직','기본조직')
INSERT INTO COMTECOPSEQ VALUES ('USRCNFRM_ID',20)