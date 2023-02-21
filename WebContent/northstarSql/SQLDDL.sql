-- EXAM.DEPT definition

		
		CREATE TABLE CUSTOMER (
			CUS_NO     INT (3) auto_increment primary key ,
		    CUS_NAME   VARCHAR(2),
		    TEL_NUM    VARCHAR(2),
		    JUMIN_NUM  CHAR(13), 
			EMP_NO     INT(3),
			CONSTRAINT CUSTOMER_JUMIN_NUM_UN UNIQUE (JUMIN_NUM),
		    CONSTRAINT `SYS_C009441` FOREIGN KEY (EMP_NO) references EMPLOYEE(EMP_NO)
		);
		
		CREATE TABLE EMPLOYEE (
			EMP_NO     INT(3) AUTO_INCREMENT,
		    EMP_NAME   VARCHAR(2),
		    DEP_NO     INT(2) ,
		    JIKUP      VARCHAR(2), 
		    SALARY     INT(9),
		    HIRE_DATE  DATE,
			JUMIN_NUM  CHAR(13) ,
		    PHONE_NUM  VARCHAR(2),
		    MER_EMP_NO INT(3),
		    CONSTRAINT EMPLOYEE_PK PRIMARY KEY (EMP_NO),
		    CONSTRAINT EMPLOYEE_JUMIN_NUM_UN UNIQUE (JUMIN_NUM),
		    CONSTRAINT EMPLOYEE_MER_EMP_NO_FK FOREIGN KEY (MER_EMP_NO) REFERENCES EMPLOYEE(EMP_NO),
		    CONSTRAINT SYS_C009437 FOREIGN KEY (DEP_NO) REFERENCES DEPT(DEP_NO),
		    INDEX IX01_SAL (SALARY)
		);
		
		CREATE TABLE DEPT (
			DEP_NO     INT(2) AUTO_INCREMENT ,
		    DEP_NAME   VARCHAR(2),
		    LOC        VARCHAR(2),
			CONSTRAINT DEPT_PK PRIMARY KEY (DEP_NO),
		    CONSTRAINT DEPT_DEP_NAME_UN UNIQUE (DEP_NAME)
		);


-- EXAM.DEPT definition

CREATE TABLE "EXAM"."DEPT" 
   (	"DEP_NO" NUMBER(2,0), 
	"DEP_NAME" VARCHAR2(10) NOT NULL ENABLE, 
	"LOC" VARCHAR2(4000) NOT NULL ENABLE, 
	 PRIMARY KEY ("DEP_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM"  ENABLE, 
	 UNIQUE ("DEP_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM" ;

CREATE UNIQUE INDEX "EXAM"."SYS_C009228" ON "EXAM"."DEPT" ("DEP_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM" ;
  CREATE UNIQUE INDEX "EXAM"."SYS_C009230" ON "EXAM"."DEPT" ("DEP_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM" ;
  
  
  -- EXAM.EMPLOYEE definition

CREATE TABLE "EXAM"."EMPLOYEE" 
   (	"EMP_NO" NUMBER(3,0), 
	"EMP_NAME" VARCHAR2(10) NOT NULL ENABLE, 
	"DEP_NO" NUMBER(2,0), 
	"JIKUP" VARCHAR2(10) NOT NULL ENABLE, 
	"SALARY" NUMBER(9,0) DEFAULT 0, 
	"HIRE_DATE" DATE DEFAULT SYSDATE, 
	"JUMIN_NUM" CHAR(13) NOT NULL ENABLE, 
	"PHONE_NUM" VARCHAR2(15) NOT NULL ENABLE, 
	"MGR_EMP_NO" NUMBER(3,0), 
	 PRIMARY KEY ("EMP_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM"  ENABLE, 
	 UNIQUE ("JUMIN_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM"  ENABLE, 
	 FOREIGN KEY ("DEP_NO")
	  REFERENCES "EXAM"."DEPT" ("DEP_NO") ON DELETE CASCADE ENABLE, 
	 CONSTRAINT "EMPLOYEE_MGR_EMP_NO_FK" FOREIGN KEY ("MGR_EMP_NO")
	  REFERENCES "EXAM"."EMPLOYEE" ("EMP_NO") ON DELETE CASCADE DISABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM" ;

CREATE UNIQUE INDEX "EXAM"."SYS_C009265" ON "EXAM"."EMPLOYEE" ("JUMIN_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM" ;
  CREATE INDEX "EXAM"."IX01_SAL" ON "EXAM"."EMPLOYEE" ("SALARY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM" ;
  CREATE UNIQUE INDEX "EXAM"."EMPLOYEE_PK" ON "EXAM"."EMPLOYEE" ("EMP_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM" ;
  
  -- EXAM.CUSTOMER definition

CREATE TABLE "EXAM"."CUSTOMER" 
   (	"CUS_NO" NUMBER(3,0), 
	"CUS_NAME" VARCHAR2(10) NOT NULL ENABLE, 
	"TEL_NUM" VARCHAR2(15), 
	"JUMIN_NUM" CHAR(13) NOT NULL ENABLE, 
	"EMP_NO" NUMBER(3,0), 
	 PRIMARY KEY ("CUS_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM"  ENABLE, 
	 UNIQUE ("JUMIN_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM"  ENABLE, 
	 FOREIGN KEY ("EMP_NO")
	  REFERENCES "EXAM"."EMPLOYEE" ("EMP_NO") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM" ;

CREATE UNIQUE INDEX "EXAM"."SYS_C009216" ON "EXAM"."CUSTOMER" ("CUS_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM" ;
  CREATE UNIQUE INDEX "EXAM"."SYS_C009218" ON "EXAM"."CUSTOMER" ("JUMIN_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_EXAM" ;
  
  