--drop table
DROP TABLE BOOK CASCADE CONSTRAINTS;
DROP TABLE MENU CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE OWNER CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE RESTAURANT CASCADE CONSTRAINTS;
DROP TABLE REVEIW CASCADE CONSTRAINTS;
DROP TABLE USERLOG CASCADE CONSTRAINTS;
DROP TABLE USERTABLE CASCADE CONSTRAINTS;


--create table

CREATE TABLE book (

    book_no           NUMBER NOT NULL,

    book_type         VARCHAR2(32 BYTE),

    people            NUMBER,

    request           VARCHAR2(1000 BYTE),

    usertable_user_no NUMBER NOT NULL,

    restaurant_res_no NUMBER NOT NULL,

    state             NUMBER(1),

    book_hours        VARCHAR2(2 BYTE)

);

 

ALTER TABLE book ADD CONSTRAINT book_pk PRIMARY KEY ( book_no );

 

CREATE TABLE menu (

    menu_no           NUMBER NOT NULL,

    menu              VARCHAR2(100 BYTE),

    price             NUMBER(13),

    discount_rate     NUMBER(4),

    expiry_date       VARCHAR2(13 BYTE),

    restaurant_res_no NUMBER NOT NULL

);

 

ALTER TABLE menu ADD CONSTRAINT menu_pk PRIMARY KEY ( menu_no );

 

CREATE TABLE notice (

    notice_no    NUMBER NOT NULL,

    writer       VARCHAR2(32 BYTE),

    title        VARCHAR2(100 BYTE),

    content      VARCHAR2(2000 BYTE),

    hit          NUMBER,

    notice_date  DATE,

    lastmodified DATE

);

 

ALTER TABLE notice ADD CONSTRAINT notice_pk PRIMARY KEY ( notice_no );

 

CREATE TABLE owner (

    o_no NUMBER NOT NULL,
    
    o_name varchar2(50 byte),

    o_id VARCHAR2(32 BYTE) NOT NULL,

    o_pw VARCHAR2(100 BYTE) NOT NULL,
    
    o_email varchar2(100 BYTE),
    
    state number(1)

);

 

ALTER TABLE owner ADD CONSTRAINT owner_pk PRIMARY KEY ( o_no );

 

CREATE TABLE qna (

    q_no         NUMBER NOT NULL,

    writer       VARCHAR2(32 BYTE),

    title        VARCHAR2(100 BYTE),

    content      VARCHAR2(2000 BYTE),

    hit          NUMBER,

    q_date       DATE,

    lastmodified DATE

);

 

ALTER TABLE qna ADD CONSTRAINT qna_pk PRIMARY KEY ( q_no );

 

CREATE TABLE reply (

    reply_no         NUMBER NOT NULL,

    writer           VARCHAR2(32 BYTE),

    title            VARCHAR2(100 BYTE),

    content          VARCHAR2(2000 BYTE),

    reply_date       DATE,

    lastmodified     DATE,

    notice_notice_no NUMBER NOT NULL,

    qna_q_no         NUMBER NOT NULL,

    review_review_no NUMBER NOT NULL

);

 

ALTER TABLE reply ADD CONSTRAINT reply_pk PRIMARY KEY ( reply_no );

 

CREATE TABLE restaurant (

    res_no     NUMBER NOT NULL,

    res_name   VARCHAR2(50 BYTE),

    address    VARCHAR2(300 BYTE),
    
    address_detail varchar2(300 byte),

    open_time  VARCHAR2(20 BYTE),
    
    lose_time  VARCHAR2(20 BYTE),

    tel    VARCHAR2(13 BYTE),
    
    content varchar2(4000 BYTE),
    
    res_menu varchar2(100 byte),
    
    res_price varchar2(100 byte),
    
    res_option varchar2(200 byte),

    origin     VARCHAR2(300 BYTE),

    saved      VARCHAR2(300 BYTE),

    path       VARCHAR2(300 BYTE),

    owner_o_no NUMBER NOT NULL

);

 

ALTER TABLE restaurant ADD CONSTRAINT restaurant_pk PRIMARY KEY ( res_no );

 

CREATE TABLE review (

    review_no         NUMBER NOT NULL,

    writer            VARCHAR2(32 BYTE),

    content           VARCHAR2(2000 BYTE),

    origin            VARCHAR2(300 BYTE),

    saved             VARCHAR2(300 BYTE),

    path              VARCHAR2(300 BYTE),

    review_date       DATE,

    rate              NUMBER(5),

    usertable_user_no NUMBER NOT NULL,

    restaurant_res_no NUMBER NOT NULL

);

 

ALTER TABLE review ADD CONSTRAINT review_pk PRIMARY KEY ( review_no );

 

CREATE TABLE userlog (

    log_no            NUMBER NOT NULL,

    log_date          DATE,

    usertable_user_no NUMBER NOT NULL

);

 

ALTER TABLE userlog ADD CONSTRAINT userlog_pk PRIMARY KEY ( log_no );

 

CREATE TABLE usertable (

    user_no    NUMBER NOT NULL,

    id         VARCHAR2(32 BYTE) NOT NULL,

    pw         VARCHAR2(100 BYTE),

    user_name  VARCHAR2(50 BYTE),

    user_tel   VARCHAR2(13 BYTE),

    user_grade VARCHAR2(6 BYTE),

    user_date  DATE,

    user_hbd   VARCHAR2(10 BYTE),

    state      NUMBER(1),

    point      NUMBER(4),

    user_email VARCHAR2(100 BYTE)

);


ALTER TABLE usertable ADD CONSTRAINT usertable_pk PRIMARY KEY ( user_no );

--drop sequence
DROP SEQUENCE book_no_seq;  
DROP SEQUENCE menu_no_seq; 
DROP SEQUENCE notice_no_seq; 
DROP SEQUENCE o_no_seq; 
DROP SEQUENCE q_no_seq; 
DROP SEQUENCE reply_no_seq; 
DROP SEQUENCE res_no_seq; 
DROP SEQUENCE review_no_seq; 
DROP SEQUENCE log_no_seq; 
DROP SEQUENCE user_no_seq; 

-- create sequence

CREATE SEQUENCE book_no_seq  INCREMENT BY 1 START WITH 1  NOCYCLE NOCACHE; 
CREATE SEQUENCE menu_no_seq  INCREMENT BY 1 START WITH 1  NOCYCLE NOCACHE; 
CREATE SEQUENCE notice_no_seq  INCREMENT BY 1 START WITH 1  NOCYCLE NOCACHE; 
CREATE SEQUENCE o_no_seq  INCREMENT BY 1 START WITH 1  NOCYCLE NOCACHE; 
CREATE SEQUENCE q_no_seq  INCREMENT BY 1 START WITH 1  NOCYCLE NOCACHE; 
CREATE SEQUENCE reply_no_seq  INCREMENT BY 1 START WITH 1  NOCYCLE NOCACHE; 
CREATE SEQUENCE res_no_seq  INCREMENT BY 1 START WITH 1  NOCYCLE NOCACHE; 
CREATE SEQUENCE review_no_seq  INCREMENT BY 1 START WITH 1  NOCYCLE NOCACHE; 
CREATE SEQUENCE log_no_seq  INCREMENT BY 1 START WITH 1  NOCYCLE NOCACHE; 
CREATE SEQUENCE user_no_seq  INCREMENT BY 1 START WITH 1  NOCYCLE NOCACHE; 



--foreign key

ALTER TABLE book

    ADD CONSTRAINT book_restaurant_fk FOREIGN KEY ( restaurant_res_no )

        REFERENCES restaurant ( res_no )

            ON DELETE CASCADE;

 

ALTER TABLE book

    ADD CONSTRAINT book_usertable_fk FOREIGN KEY ( usertable_user_no )

        REFERENCES usertable ( user_no )

            ON DELETE CASCADE;

 

ALTER TABLE menu

    ADD CONSTRAINT menu_restaurant_fk FOREIGN KEY ( restaurant_res_no )

        REFERENCES restaurant ( res_no )

            ON DELETE CASCADE;

 

ALTER TABLE reply

    ADD CONSTRAINT reply_notice_fk FOREIGN KEY ( notice_notice_no )

        REFERENCES notice ( notice_no )

            ON DELETE CASCADE;

 

ALTER TABLE reply

    ADD CONSTRAINT reply_qna_fk FOREIGN KEY ( qna_q_no )

        REFERENCES qna ( q_no )

            ON DELETE CASCADE;

 

ALTER TABLE reply

    ADD CONSTRAINT reply_review_fk FOREIGN KEY ( review_review_no )

        REFERENCES review ( review_no )

            ON DELETE CASCADE;

 

ALTER TABLE restaurant

    ADD CONSTRAINT restaurant_owner_fk FOREIGN KEY ( owner_o_no )

        REFERENCES owner ( o_no )

            ON DELETE CASCADE;

 

ALTER TABLE review

    ADD CONSTRAINT review_restaurant_fk FOREIGN KEY ( restaurant_res_no )

        REFERENCES restaurant ( res_no )

            ON DELETE CASCADE;

 

ALTER TABLE review

    ADD CONSTRAINT review_usertable_fk FOREIGN KEY ( usertable_user_no )

        REFERENCES usertable ( user_no )

            ON DELETE CASCADE;

 

ALTER TABLE userlog

    ADD CONSTRAINT userlog_usertable_fk FOREIGN KEY ( usertable_user_no )

        REFERENCES usertable ( user_no )

            ON DELETE CASCADE;
            
select * from tab;
select * from user_sequences;
select * from restaurant;
