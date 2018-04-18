-- ȸ������
ALTER TABLE `MY_SCHEMA`.`MMBR_INF`
	DROP PRIMARY KEY; -- ȸ������ �⺻Ű

-- ȸ������
DROP TABLE IF EXISTS `MY_SCHEMA`.`MMBR_INF` RESTRICT;

-- ȸ������
CREATE TABLE `MY_SCHEMA`.`MMBR_INF` (
	`MMBR_NMBR`  INT          NOT NULL, -- ȸ����ȣ
	`MMBR_ID`    VARCHAR(16)  NOT NULL, -- ȸ�����̵�
	`MMBR_EMAIL` VARCHAR(40)  NOT NULL, -- ȸ���̸���
	`MMBR_NM`    VARCHAR(50)  NOT NULL, -- ȸ���̸�
	`MMBR_PHOTO` VARCHAR(120) NULL      -- ȸ������
);

-- ȸ������
ALTER TABLE `MY_SCHEMA`.`MMBR_INF`
	ADD CONSTRAINT `PK_MMBR_INF` -- ȸ������ �⺻Ű
		PRIMARY KEY (
			`MMBR_NMBR` -- ȸ����ȣ
		);

ALTER TABLE `MY_SCHEMA`.`MMBR_INF`
	MODIFY COLUMN `MMBR_NMBR` INT NOT NULL AUTO_INCREMENT;
    
===================================================================

-- ģ������ 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	DROP FOREIGN KEY `FK_MMBR_INF_TO_FREN_INF`; -- ȸ������ -> ģ������

-- ģ������ 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	DROP FOREIGN KEY `FK_UNIV_INF_TO_FREN_INF`; -- �б����� -> ģ������

-- ģ������ 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	DROP FOREIGN KEY `FK_COMP_INF_TO_FREN_INF`; -- ȸ������ -> ģ������

-- ģ������ 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	DROP PRIMARY KEY; -- ģ������  �⺻Ű

-- ģ������ 
DROP TABLE IF EXISTS `MY_SCHEMA`.`FREN_INF` RESTRICT;

-- ģ������ 
CREATE TABLE `MY_SCHEMA`.`FREN_INF` (
	`FREN_NMBR`     INT          NOT NULL, -- ģ����ȣ
	`FREN_NM`       VARCHAR(50)  NOT NULL, -- ģ���̸�
	`FREN_PHN_NMBR` VARCHAR(30)  NOT NULL, -- ģ����ȭ��ȣ
	`FREN_EMAIL`    VARCHAR(40)  NULL,     -- ģ���̸���
	`FREN_ADDR`     VARCHAR(255) NULL,     -- ģ���ּ�
	`FREN_PHOTO`    VARCHAR(120) NULL,     -- ģ������
	`MMBR_NMBR`     INT          NOT NULL, -- ȸ����ȣ
	`id`            INT          NULL,     -- �б�������ȣ
	`id2`           INT          NULL      -- ȸ��������ȣ
);

-- ģ������ 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	ADD CONSTRAINT `PK_FREN_INF` -- ģ������  �⺻Ű
		PRIMARY KEY (
			`FREN_NMBR` -- ģ����ȣ
		);

ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	MODIFY COLUMN `FREN_NMBR` INT NOT NULL AUTO_INCREMENT;

-- ģ������ 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	ADD CONSTRAINT `FK_MMBR_INF_TO_FREN_INF` -- ȸ������ -> ģ������ 
		FOREIGN KEY (
			`MMBR_NMBR` -- ȸ����ȣ
		)
		REFERENCES `MY_SCHEMA`.`MMBR_INF` ( -- ȸ������
			`MMBR_NMBR` -- ȸ����ȣ
		);

-- ģ������ 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	ADD CONSTRAINT `FK_UNIV_INF_TO_FREN_INF` -- �б����� -> ģ������ 
		FOREIGN KEY (
			`id` -- �б�������ȣ
		)
		REFERENCES `MY_SCHEMA`.`UNIV_INF` ( -- �б�����
			`UNIV_NMBR` -- �б�������ȣ
		);

-- ģ������ 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	ADD CONSTRAINT `FK_COMP_INF_TO_FREN_INF` -- ȸ������ -> ģ������ 
		FOREIGN KEY (
			`id2` -- ȸ��������ȣ
		)
		REFERENCES `MY_SCHEMA`.`COMP_INF` ( -- ȸ������
			`COMP_NMBR` -- ȸ��������ȣ
		);
        
        
========================================================================

-- �б�����
ALTER TABLE `MY_SCHEMA`.`UNIV_INF`
	DROP PRIMARY KEY; -- �б����� �⺻Ű

-- �б�����
DROP TABLE IF EXISTS `MY_SCHEMA`.`UNIV_INF` RESTRICT;

-- �б�����
CREATE TABLE `MY_SCHEMA`.`UNIV_INF` (
	`UNIV_NMBR` INT NOT NULL, -- �б�������ȣ
	`MAJ`       INT NOT NULL, -- ������
	`GRD`       INT NOT NULL  -- �г�
);

-- �б�����
ALTER TABLE `MY_SCHEMA`.`UNIV_INF`
	ADD CONSTRAINT `PK_UNIV_INF` -- �б����� �⺻Ű
		PRIMARY KEY (
			`UNIV_NMBR` -- �б�������ȣ
		);

ALTER TABLE `MY_SCHEMA`.`UNIV_INF`
	MODIFY COLUMN `UNIV_NMBR` INT NOT NULL AUTO_INCREMENT;
    
====================================================================

-- ȸ������
ALTER TABLE `MY_SCHEMA`.`COMP_INF`
	DROP PRIMARY KEY; -- ȸ������ �⺻Ű

-- ȸ������
DROP TABLE IF EXISTS `MY_SCHEMA`.`COMP_INF` RESTRICT;

-- ȸ������
CREATE TABLE `MY_SCHEMA`.`COMP_INF` (
	`COMP_NMBR` INT         NOT NULL, -- ȸ��������ȣ
	`COMP_NM`   VARCHAR(50) NOT NULL  -- ȸ���̸�
);

-- ȸ������
ALTER TABLE `MY_SCHEMA`.`COMP_INF`
	ADD CONSTRAINT `PK_COMP_INF` -- ȸ������ �⺻Ű
		PRIMARY KEY (
			`COMP_NMBR` -- ȸ��������ȣ
		);

ALTER TABLE `MY_SCHEMA`.`COMP_INF`
	MODIFY COLUMN `COMP_NMBR` INT NOT NULL AUTO_INCREMENT;