--------------------------------------------------------
--  Datei erstellt -Montag-Januar-30-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table HF_CAT
--------------------------------------------------------

  CREATE TABLE "HF_CAT" 
   (	"INT_KEY" NUMBER(11,0), 
	"HF_USER_IK" NUMBER(11,0), 
	"CAT_NAME" VARCHAR2(255 char), 
	"PARENT_HF_CAT_IK_" NUMBER(11,0), 
	"CAT_DESC" VARCHAR2(2000 char), 
	"INT_SEQ" NUMBER(10,0), 
	"LAST_CHANGE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table HF_PLAYLIST
--------------------------------------------------------

  CREATE TABLE "HF_PLAYLIST" 
   (	"INT_KEY" NUMBER(11,0), 
	"PLAYLIST_NAME" VARCHAR2(255 char), 
	"HF_CAT_IK" NUMBER(11,0), 
	"HF_USER_IK" NUMBER(11,0), 
	"DESCRIPTION" VARCHAR2(2000 char), 
	"INT_SEQ" NUMBER(10,0), 
	"LAST_CHANGE" DATE, 
	"SHARE_FLAG" VARCHAR2(1 char)
   ) ;
--------------------------------------------------------
--  DDL for Table HF_PLAYLIST_POS
--------------------------------------------------------

  CREATE TABLE "HF_PLAYLIST_POS" 
   (	"INT_KEY" NUMBER(11,0), 
	"HF_PLAYLIST_IK" NUMBER(11,0), 
	"ORDER_NUM" NUMBER(3,0), 
	"INT_SEQ" NUMBER(10,0), 
	"LAST_CHANGE" DATE, 
	"TRACK_NAME" VARCHAR2(255 char), 
	"ALBUM" VARCHAR2(255 char), 
	"ARTIST" VARCHAR2(255 char), 
	"ARTIST_ID" VARCHAR2(255 char), 
	"ALBUM_ID" VARCHAR2(255 char), 
	"TRACK_ID" VARCHAR2(255 char), 
	"GENRE" VARCHAR2(255 char), 
	"IMAGE_URL" VARCHAR2(255 char)
   ) ;
--------------------------------------------------------
--  DDL for Table HF_PLAYLIST_RAT
--------------------------------------------------------

  CREATE TABLE "HF_PLAYLIST_RAT" 
   (	"INT_KEY" NUMBER(11,0), 
	"RATING" NUMBER(1,0), 
	"DESCRIPTION" VARCHAR2(2000 char), 
	"HF_PLAYLIST_IK" NUMBER(11,0), 
	"RATER_NAME" VARCHAR2(255 char), 
	"INT_SEQ" NUMBER(10,0), 
	"LAST_CHANGE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table HF_USER
--------------------------------------------------------

  CREATE TABLE "HF_USER" 
   (	"INT_KEY" NUMBER(11,0), 
	"USERNAME" VARCHAR2(255 char), 
	"PASSWORD" VARCHAR2(255 char), 
	"LONGNAME" VARCHAR2(255 char), 
	"INT_SEQ" NUMBER(10,0), 
	"LAST_CHANGE" DATE
   ) ;
REM INSERTING into HF_CAT
SET DEFINE OFF;
REM INSERTING into HF_PLAYLIST
SET DEFINE OFF;
REM INSERTING into HF_PLAYLIST_POS
SET DEFINE OFF;
REM INSERTING into HF_PLAYLIST_RAT
SET DEFINE OFF;
REM INSERTING into HF_USER
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index HF_CAT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HF_CAT_PK" ON "HF_CAT" ("INT_KEY") 
  ;
--------------------------------------------------------
--  DDL for Index HF_PLAYLIST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HF_PLAYLIST_PK" ON "HF_PLAYLIST" ("INT_KEY") 
  ;
--------------------------------------------------------
--  DDL for Index HF_PLAYLIST_POS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HF_PLAYLIST_POS_PK" ON "HF_PLAYLIST_POS" ("INT_KEY") 
  ;
--------------------------------------------------------
--  DDL for Index HF_PLAYLIST_RAT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HF_PLAYLIST_RAT_PK" ON "HF_PLAYLIST_RAT" ("INT_KEY") 
  ;
--------------------------------------------------------
--  DDL for Index HF_USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HF_USER_PK" ON "HF_USER" ("INT_KEY") 
  ;
--------------------------------------------------------
--  Constraints for Table HF_CAT
--------------------------------------------------------

  ALTER TABLE "HF_CAT" MODIFY ("HF_USER_IK" NOT NULL ENABLE);
  ALTER TABLE "HF_CAT" MODIFY ("CAT_NAME" NOT NULL ENABLE);
  ALTER TABLE "HF_CAT" MODIFY ("INT_KEY" NOT NULL ENABLE);
  ALTER TABLE "HF_CAT" ADD CONSTRAINT "HF_CAT_PK" PRIMARY KEY ("INT_KEY")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table HF_PLAYLIST
--------------------------------------------------------

  ALTER TABLE "HF_PLAYLIST" MODIFY ("PLAYLIST_NAME" NOT NULL ENABLE);
  ALTER TABLE "HF_PLAYLIST" MODIFY ("HF_CAT_IK" NOT NULL ENABLE);
  ALTER TABLE "HF_PLAYLIST" MODIFY ("HF_USER_IK" NOT NULL ENABLE);
  ALTER TABLE "HF_PLAYLIST" MODIFY ("INT_KEY" NOT NULL ENABLE);
  ALTER TABLE "HF_PLAYLIST" ADD CONSTRAINT "HF_PLAYLIST_PK" PRIMARY KEY ("INT_KEY")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table HF_PLAYLIST_POS
--------------------------------------------------------

  ALTER TABLE "HF_PLAYLIST_POS" MODIFY ("HF_PLAYLIST_IK" NOT NULL ENABLE);
  ALTER TABLE "HF_PLAYLIST_POS" MODIFY ("INT_KEY" NOT NULL ENABLE);
  ALTER TABLE "HF_PLAYLIST_POS" ADD CONSTRAINT "HF_PLAYLIST_POS_PK" PRIMARY KEY ("INT_KEY")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table HF_PLAYLIST_RAT
--------------------------------------------------------

  ALTER TABLE "HF_PLAYLIST_RAT" MODIFY ("RATING" NOT NULL ENABLE);
  ALTER TABLE "HF_PLAYLIST_RAT" MODIFY ("HF_PLAYLIST_IK" NOT NULL ENABLE);
  ALTER TABLE "HF_PLAYLIST_RAT" MODIFY ("INT_KEY" NOT NULL ENABLE);
  ALTER TABLE "HF_PLAYLIST_RAT" ADD CONSTRAINT "HF_PLAYLIST_RAT_PK" PRIMARY KEY ("INT_KEY")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table HF_USER
--------------------------------------------------------

  ALTER TABLE "HF_USER" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "HF_USER" MODIFY ("LONGNAME" NOT NULL ENABLE);
  ALTER TABLE "HF_USER" MODIFY ("INT_KEY" NOT NULL ENABLE);
  ALTER TABLE "HF_USER" ADD CONSTRAINT "HF_USER_PK" PRIMARY KEY ("INT_KEY")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HF_CAT
--------------------------------------------------------

  ALTER TABLE "HF_CAT" ADD CONSTRAINT "HF_CAT_HF_USER_FK1" FOREIGN KEY ("HF_USER_IK")
	  REFERENCES "HF_USER" ("INT_KEY") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HF_PLAYLIST
--------------------------------------------------------

  ALTER TABLE "HF_PLAYLIST" ADD CONSTRAINT "HF_PLAYLIST_HF_CAT_FK1" FOREIGN KEY ("HF_CAT_IK")
	  REFERENCES "HF_CAT" ("INT_KEY") ENABLE;
  ALTER TABLE "HF_PLAYLIST" ADD CONSTRAINT "HF_PLAYLIST_HF_USER_FK1" FOREIGN KEY ("HF_USER_IK")
	  REFERENCES "HF_USER" ("INT_KEY") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HF_PLAYLIST_POS
--------------------------------------------------------

  ALTER TABLE "HF_PLAYLIST_POS" ADD CONSTRAINT "HF_PLAYLIST_POS_FK1" FOREIGN KEY ("HF_PLAYLIST_IK")
	  REFERENCES "HF_PLAYLIST" ("INT_KEY") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HF_PLAYLIST_RAT
--------------------------------------------------------

  ALTER TABLE "HF_PLAYLIST_RAT" ADD CONSTRAINT "HF_PLAYLIST_RAT_FK1" FOREIGN KEY ("HF_PLAYLIST_IK")
	  REFERENCES "HF_PLAYLIST" ("INT_KEY") ENABLE;

--------------------------------------------------------
--  Sequence for PK for Table HF_CAT
--------------------------------------------------------    
    CREATE SEQUENCE HF_CAT_PK_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999 MINVALUE 1 CACHE 20;

--------------------------------------------------------
--  Sequence for PK for Table HF_PLAYLIST
--------------------------------------------------------    
    CREATE SEQUENCE HF_PLAYLIST_PK_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999 MINVALUE 1 CACHE 20;

--------------------------------------------------------
--  Sequence for PK for Table HF_PLAYLIST_POS_POS
--------------------------------------------------------    
    CREATE SEQUENCE HF_PLAYLIST_POS_PK_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999 MINVALUE 1 CACHE 20;

--------------------------------------------------------
--  Sequence for PK for Table HF_PLAYLIST_RAT_POS
--------------------------------------------------------    
    CREATE SEQUENCE HF_PLAYLIST_RAT_PK_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999 MINVALUE 1 CACHE 20;

--------------------------------------------------------
--  Sequence for PK for Table HF_USER
--------------------------------------------------------    
    CREATE SEQUENCE HF_USER_PK_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999 MINVALUE 1 CACHE 20;
