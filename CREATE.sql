CREATE DATABASE innheimta;
GO
USE innheimta;
GO
/****** Object:  Table afslattarkodi    Script Date: 22.4.2018 22:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE afslattarkodi(
	id int NOT NULL,
	lysing nvarchar(150) NOT NULL,
 CONSTRAINT PK_afslattarkodi PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table dagsstada    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE dagsstada(
	id bigint NOT NULL,
	krafa_id bigint NOT NULL,
	dagur date NOT NULL
) ON PRIMARY
GO
/****** Object:  Table drattarvaxtaregla    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE drattarvaxtaregla(
	id nvarchar(1) NOT NULL,
	lysing nvarchar(150) NOT NULL,
 CONSTRAINT PK_drattarvaxtaregla PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table drattarvaxtastofnkodi    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE drattarvaxtastofnkodi(
	id nvarchar(1) NOT NULL,
	lysing nvarchar(150) NOT NULL,
 CONSTRAINT PK_drattarvaxtastofnkodi PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table gengiskodi    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE gengiskodi(
	id nvarchar(1) NOT NULL,
	lysing nvarchar(150) NOT NULL,
 CONSTRAINT PK_gengiskodi PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table greidandi    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE greidandi(
	id bigint NOT NULL,
	vidskiptamadur_id bigint NOT NULL,
	heimilisfang_id bigint NULL,
	samningur_id int NOT NULL,
	skilabod_a_greidslusedla nchar(500) NULL,
PRIMARY KEY NONCLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table greidslukodi    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE greidslukodi(
	id nvarchar(1) NOT NULL,
	lysing nvarchar(150) NOT NULL,
 CONSTRAINT PK_greidslukodi PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table heimilisfang    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE heimilisfang(
	id bigint IDENTITY(1,1) NOT NULL,
	postnumer_id nchar(3) NOT NULL,
	heimili_1 nchar(100) NOT NULL,
	heimili_2 nchar(100) NULL,
 CONSTRAINT heimilisfang_pk PRIMARY KEY NONCLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table hreyfing    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE hreyfing(
	id bigint IDENTITY(1,1) NOT NULL,
	krafa_id bigint NOT NULL,
	tegund_hreyfingar_id int NOT NULL,
	hreyfingardagur date NOT NULL,
	eindagi date NOT NULL,
	innlausnarbanki nchar(4) NULL,
	nidurfellingardagur date NOT NULL,
	upphaed numeric(18, 2) NOT NULL,
	tilvisun nvarchar(16) NOT NULL,
	sedilnumer nvarchar(7) NULL,
	vidskiptanumer nvarchar(16) NULL,
	tilkynningar_og_greidslugjald_1 int NULL,
	tilkynningar_og_greidslugjald_2 int NULL,
	vanskilagjaldskodi_id nvarchar(1) NULL,
	fyrra_vanskilagjald_dagafjoldi int NULL,
	fyrra_vanskilagjald numeric(18, 2) NULL,
	seinna_vanskilagjald_dagafjoldi int NULL,
	seinna_vanskilagjald numeric(18, 2) NULL,
	annar_kostnadur int NULL,
	annar_vanskilakostnadur int NULL,
	drattarvaxtastofnkodi_id nvarchar(1) NULL,
	drattarvaxtaregla_id nvarchar(1) NULL,
	drattarvaxtaprosenta int NULL,
	mynt_id nvarchar(3) NULL,
	gengiskodi_id nvarchar(1) NULL,
	greidslukodi_id nvarchar(1) NULL,
	afslattarkodi_id int NULL,
	fyrri_afslattur_dagafjoldi int NULL,
	fyrri_afslattur numeric(18, 2) NULL,
	seinni_afslattur_dagafjoldi int NULL,
	seinni_afslattur numeric(18, 2) NULL,
	url nchar(200) NULL,
	nafn nchar(32) NULL,
	berist_til nchar(32) NULL,
	heimilisfang nchar(32) NULL,
	sveitarfelag nchar(32) NULL,
	nafn_krofuhafa nchar(32) NULL,
	heimilisfang_krofuhafa nchar(32) NULL,
	sveitarfelag_krofuhafa nchar(32) NULL,
	simanumer_krofuhafa nchar(7) NULL,
	athugasemd_1 nchar(80) NULL,
	athugasemd_2 nchar(80) NULL,
	vaxtadagsetning date NULL,
	innborgunardagur date NULL,
	innborgunarupphaed numeric(18, 2) NULL,
	greiddir_drattarvextir numeric(18, 2) NULL,
	greidd_upphaed numeric(18, 2) NULL,
	greiddur_fjarmagnstekjuskattur numeric(18, 2) NULL,
	veittur_afslattur numeric(18, 2) NULL,
	greitt_tilkynningargjald numeric(18, 2) NULL,
	greitt_vanskilagjald numeric(18, 2) NULL,
	greiddur_annar_vanskilakostnadur numeric(18, 2) NULL,
	greiddur_annar_kostnadur numeric(18, 2) NULL,
	ogreitt_tilkynningjargjald numeric(18, 2) NULL,
	bokunardagur date NULL,
	greidslugengi numeric(10, 6) NULL,
 CONSTRAINT hreyfing_pk PRIMARY KEY NONCLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table krafa    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE krafa(
	id bigint IDENTITY(1,1) NOT NULL,
	samningur_id int NOT NULL,
	astand_id int NOT NULL,
	greidandi_id bigint NOT NULL,
	banki int NOT NULL,
	hofudbok int NOT NULL,
	numer int NOT NULL,
	gjalddagi date NOT NULL,
	eindagi date NOT NULL,
	nidurfellingardagur date NOT NULL,
	upphaed numeric(18, 2) NOT NULL,
	tilvisun nvarchar(16) NOT NULL,
	sedilnumer nvarchar(7) NULL,
	vidskiptanumer nvarchar(16) NULL,
	tilkynningar_og_greidslugjald_1 int NULL,
	tilkynningar_og_greidslugjald_2 int NULL,
	vanskilagjaldskodi_id nvarchar(1) NULL,
	fyrra_vanskilagjald_dagafjoldi int NULL,
	fyrra_vanskilagjald numeric(18, 2) NULL,
	seinna_vanskilagjald_dagafjoldi int NULL,
	seinna_vanskilagjald numeric(18, 2) NULL,
	annar_kostnadur int NULL,
	annar_vanskilakostnadur int NULL,
	drattarvaxtastofnkodi_id nvarchar(1) NULL,
	drattarvaxtaregla_id nvarchar(1) NULL,
	drattarvaxtaprosenta int NULL,
	mynt_id nvarchar(3) NULL,
	gengiskodi_id nvarchar(1) NULL,
	greidslukodi_id nvarchar(1) NULL,
	afslattarkodi_id int NULL,
	fyrri_afslattur_dagafjoldi int NULL,
	fyrri_afslattur numeric(18, 2) NULL,
	seinni_afslattur_dagafjoldi int NULL,
	seinni_afslattur numeric(18, 2) NULL,
	url nchar(200) NULL,
	nafn nchar(32) NULL,
	berist_til nchar(32) NULL,
	heimilisfang nchar(32) NULL,
	sveitarfelag nchar(32) NULL,
	nafn_krofuhafa nchar(32) NULL,
	heimilisfang_krofuhafa nchar(32) NULL,
	sveitarfelag_krofuhafa nchar(32) NULL,
	simanumer_krofuhafa nchar(7) NULL,
	athugasemd_1 nchar(80) NULL,
	athugasemd_2 nchar(80) NULL,
	stada_tilkynningar_og_greidslugjald_1 int NOT NULL,
	stada_tilkynningar_og_greidslugjald_2 int NOT NULL,
	stada_fyrra_vanskilagjald int NOT NULL,
	stada_seinna_vanskilagjald int NOT NULL,
	stada_annar_kostnadur int NOT NULL,
	stada_annar_vanskilakostnadur int NOT NULL,
	stada_drattarvextir int NOT NULL,
	stada_afslattur int NOT NULL,
	upphaed_til_greidslu int NOT NULL,
 CONSTRAINT PK_Krafa PRIMARY KEY NONCLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table krafa_astand    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE krafa_astand(
	id int NOT NULL,
	lysing nvarchar(150) NOT NULL,
 CONSTRAINT PK_krafa_astand PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table mynt    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE mynt(
	id nvarchar(3) NOT NULL,
	gjaldmidill nvarchar(150) NOT NULL,
 CONSTRAINT PK_mynt PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table postnumer    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE postnumer(
	postnumer nchar(3) NOT NULL,
	stadur nchar(150) NOT NULL,
 CONSTRAINT postnumer_pk PRIMARY KEY NONCLUSTERED 
(
	postnumer ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table samningur    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE samningur(
	id int IDENTITY(1,1) NOT NULL,
	vidskiptamadur_id bigint NOT NULL,
	kostnadarreikningur_id char(12) NULL,
	visir nvarchar(3) NOT NULL,
	heimilisfang_id bigint NULL,
	tilkynningar_og_greidslugjald_1 int NULL,
	tilkynningar_og_greidslugjald_2 int NULL,
	vanskilagjaldskodi_id nvarchar(1) NULL,
	fyrra_vanskilagjald_dagafjoldi int NULL,
	fyrra_vanskilagjald numeric(18, 2) NULL,
	seinna_vanskilagjald_dagafjoldi int NULL,
	seinna_vanskilagjald numeric(18, 2) NULL,
	drattarvaxtastofnkodi_id nvarchar(1) NULL,
	drattavvaxtaregla_id nvarchar(1) NULL,
	drattarvaxtaprosenta numeric(4, 2) NULL,
	mynt_id nvarchar(3) NOT NULL,
	gengiskodi_id nvarchar(1) NULL,
	greidslukodi_id nvarchar(1) NULL,
 CONSTRAINT samningur_pk PRIMARY KEY NONCLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table tegund_hreyfingar    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE tegund_hreyfingar(
	id int NOT NULL,
	faerslugerd nchar(1) NULL,
	lysing nvarchar(150) NULL,
 CONSTRAINT tegund_hreyfingar_pk PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table tegund_logadila    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE tegund_logadila(
	id int NOT NULL,
	lysing nvarchar(150) NOT NULL,
 CONSTRAINT tegund_logadila_pk PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table thjodskra    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE thjodskra(
	kennitala nvarchar(10) NOT NULL,
	nafn nvarchar(50) NOT NULL,
	heimili nvarchar(50) NULL,
	postnumer_id nchar(3) NULL,
	tegund_logadila_id int NOT NULL,
 CONSTRAINT thjodskra_pk PRIMARY KEY NONCLUSTERED 
(
	kennitala ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table vanskilagjaldskodi    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE vanskilagjaldskodi(
	id nvarchar(1) NOT NULL,
	lysing nvarchar(150) NOT NULL,
 CONSTRAINT PK_vanskilagjaldskodi PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
/****** Object:  Table vidskiptamadur    Script Date: 22.4.2018 22:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE vidskiptamadur(
	id bigint IDENTITY(1,1) NOT NULL,
	kennitala nvarchar(10) NOT NULL,
	heimilisfang_id bigint NULL,
	ahaetta_1 nchar(50) NULL,
	ahaetta_2 nchar(50) NULL,
	ahaetta_3 nchar(50) NULL,
	ahaetta_4 nchar(50) NULL,
 CONSTRAINT vidskiptamadur_pk PRIMARY KEY NONCLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY
GO
ALTER TABLE greidandi  WITH CHECK ADD  CONSTRAINT greidandi_heimilisfang_fk FOREIGN KEY(heimilisfang_id)
REFERENCES heimilisfang (id)
GO
ALTER TABLE greidandi CHECK CONSTRAINT greidandi_heimilisfang_fk
GO
ALTER TABLE greidandi  WITH CHECK ADD  CONSTRAINT greidandi_samningur_fk FOREIGN KEY(samningur_id)
REFERENCES samningur (id)
GO
ALTER TABLE greidandi CHECK CONSTRAINT greidandi_samningur_fk
GO
ALTER TABLE greidandi  WITH CHECK ADD  CONSTRAINT greidandi_vidskiptamadur_fk FOREIGN KEY(vidskiptamadur_id)
REFERENCES vidskiptamadur (id)
GO
ALTER TABLE greidandi CHECK CONSTRAINT greidandi_vidskiptamadur_fk
GO
ALTER TABLE heimilisfang  WITH NOCHECK ADD  CONSTRAINT heimilisfang_postnumer_fk FOREIGN KEY(postnumer_id)
REFERENCES postnumer (postnumer)
GO
ALTER TABLE heimilisfang NOCHECK CONSTRAINT heimilisfang_postnumer_fk
GO
ALTER TABLE hreyfing  WITH CHECK ADD  CONSTRAINT hreyfing_afslattarkodi_fk FOREIGN KEY(afslattarkodi_id)
REFERENCES afslattarkodi (id)
GO
ALTER TABLE hreyfing CHECK CONSTRAINT hreyfing_afslattarkodi_fk
GO
ALTER TABLE hreyfing  WITH CHECK ADD  CONSTRAINT hreyfing_drattarvaxtaregla_fk FOREIGN KEY(drattarvaxtaregla_id)
REFERENCES drattarvaxtaregla (id)
GO
ALTER TABLE hreyfing CHECK CONSTRAINT hreyfing_drattarvaxtaregla_fk
GO
ALTER TABLE hreyfing  WITH CHECK ADD  CONSTRAINT hreyfing_drattarvaxtastofnkodi_fk FOREIGN KEY(drattarvaxtastofnkodi_id)
REFERENCES drattarvaxtastofnkodi (id)
GO
ALTER TABLE hreyfing CHECK CONSTRAINT hreyfing_drattarvaxtastofnkodi_fk
GO
ALTER TABLE hreyfing  WITH CHECK ADD  CONSTRAINT hreyfing_gengiskodi_fk FOREIGN KEY(gengiskodi_id)
REFERENCES gengiskodi (id)
GO
ALTER TABLE hreyfing CHECK CONSTRAINT hreyfing_gengiskodi_fk
GO
ALTER TABLE hreyfing  WITH CHECK ADD  CONSTRAINT hreyfing_greidslukodi_fk FOREIGN KEY(greidslukodi_id)
REFERENCES greidslukodi (id)
GO
ALTER TABLE hreyfing CHECK CONSTRAINT hreyfing_greidslukodi_fk
GO
ALTER TABLE hreyfing  WITH CHECK ADD  CONSTRAINT hreyfing_krafa_fk FOREIGN KEY(krafa_id)
REFERENCES krafa (id)
GO
ALTER TABLE hreyfing CHECK CONSTRAINT hreyfing_krafa_fk
GO
ALTER TABLE hreyfing  WITH CHECK ADD  CONSTRAINT hreyfing_mynt_fk FOREIGN KEY(mynt_id)
REFERENCES mynt (id)
GO
ALTER TABLE hreyfing CHECK CONSTRAINT hreyfing_mynt_fk
GO
ALTER TABLE hreyfing  WITH CHECK ADD  CONSTRAINT hreyfing_tegund_hreyfingar_fk FOREIGN KEY(tegund_hreyfingar_id)
REFERENCES tegund_hreyfingar (id)
GO
ALTER TABLE hreyfing CHECK CONSTRAINT hreyfing_tegund_hreyfingar_fk
GO
ALTER TABLE hreyfing  WITH CHECK ADD  CONSTRAINT hreyfing_vanskilagjaldskodi_fk FOREIGN KEY(vanskilagjaldskodi_id)
REFERENCES vanskilagjaldskodi (id)
GO
ALTER TABLE hreyfing CHECK CONSTRAINT hreyfing_vanskilagjaldskodi_fk
GO
ALTER TABLE krafa  WITH CHECK ADD  CONSTRAINT krafa_afslattarkodi_fk FOREIGN KEY(afslattarkodi_id)
REFERENCES afslattarkodi (id)
GO
ALTER TABLE krafa CHECK CONSTRAINT krafa_afslattarkodi_fk
GO
ALTER TABLE krafa  WITH CHECK ADD  CONSTRAINT krafa_astand_fk FOREIGN KEY(astand_id)
REFERENCES krafa_astand (id)
GO
ALTER TABLE krafa CHECK CONSTRAINT krafa_astand_fk
GO
ALTER TABLE krafa  WITH CHECK ADD  CONSTRAINT krafa_drattarvaxtaregla_fk FOREIGN KEY(drattarvaxtaregla_id)
REFERENCES drattarvaxtaregla (id)
GO
ALTER TABLE krafa CHECK CONSTRAINT krafa_drattarvaxtaregla_fk
GO
ALTER TABLE krafa  WITH CHECK ADD  CONSTRAINT krafa_drattarvaxtastofnkodi_fk FOREIGN KEY(drattarvaxtastofnkodi_id)
REFERENCES drattarvaxtastofnkodi (id)
GO
ALTER TABLE krafa CHECK CONSTRAINT krafa_drattarvaxtastofnkodi_fk
GO
ALTER TABLE krafa  WITH CHECK ADD  CONSTRAINT krafa_gengiskodi_fk FOREIGN KEY(gengiskodi_id)
REFERENCES gengiskodi (id)
GO
ALTER TABLE krafa CHECK CONSTRAINT krafa_gengiskodi_fk
GO
ALTER TABLE krafa  WITH CHECK ADD  CONSTRAINT krafa_greidandi_fk FOREIGN KEY(greidandi_id)
REFERENCES greidandi (id)
GO
ALTER TABLE krafa CHECK CONSTRAINT krafa_greidandi_fk
GO
ALTER TABLE krafa  WITH CHECK ADD  CONSTRAINT krafa_greidslukodi_fk FOREIGN KEY(greidslukodi_id)
REFERENCES greidslukodi (id)
GO
ALTER TABLE krafa CHECK CONSTRAINT krafa_greidslukodi_fk
GO
ALTER TABLE krafa  WITH CHECK ADD  CONSTRAINT krafa_mynt_fk FOREIGN KEY(mynt_id)
REFERENCES mynt (id)
GO
ALTER TABLE krafa CHECK CONSTRAINT krafa_mynt_fk
GO
ALTER TABLE krafa  WITH CHECK ADD  CONSTRAINT krafa_samningur_fk FOREIGN KEY(samningur_id)
REFERENCES samningur (id)
GO
ALTER TABLE krafa CHECK CONSTRAINT krafa_samningur_fk
GO
ALTER TABLE krafa  WITH CHECK ADD  CONSTRAINT krafa_vanskilagjaldskodi_fk FOREIGN KEY(vanskilagjaldskodi_id)
REFERENCES vanskilagjaldskodi (id)
GO
ALTER TABLE krafa CHECK CONSTRAINT krafa_vanskilagjaldskodi_fk
GO
ALTER TABLE samningur  WITH CHECK ADD  CONSTRAINT samningur_drattarvaxtaregla_fk FOREIGN KEY(drattavvaxtaregla_id)
REFERENCES drattarvaxtaregla (id)
GO
ALTER TABLE samningur CHECK CONSTRAINT samningur_drattarvaxtaregla_fk
GO
ALTER TABLE samningur  WITH CHECK ADD  CONSTRAINT samningur_drattarvaxtastofnkodi_fk FOREIGN KEY(drattarvaxtastofnkodi_id)
REFERENCES drattarvaxtastofnkodi (id)
GO
ALTER TABLE samningur CHECK CONSTRAINT samningur_drattarvaxtastofnkodi_fk
GO
ALTER TABLE samningur  WITH CHECK ADD  CONSTRAINT samningur_gengiskodi_fk FOREIGN KEY(gengiskodi_id)
REFERENCES gengiskodi (id)
GO
ALTER TABLE samningur CHECK CONSTRAINT samningur_gengiskodi_fk
GO
ALTER TABLE samningur  WITH CHECK ADD  CONSTRAINT samningur_greidslukodi_fk FOREIGN KEY(greidslukodi_id)
REFERENCES greidslukodi (id)
GO
ALTER TABLE samningur CHECK CONSTRAINT samningur_greidslukodi_fk
GO
ALTER TABLE samningur  WITH CHECK ADD  CONSTRAINT samningur_heimilisfang_fk FOREIGN KEY(heimilisfang_id)
REFERENCES heimilisfang (id)
GO
ALTER TABLE samningur CHECK CONSTRAINT samningur_heimilisfang_fk
GO
ALTER TABLE samningur  WITH CHECK ADD  CONSTRAINT samningur_mynt_fk FOREIGN KEY(mynt_id)
REFERENCES mynt (id)
GO
ALTER TABLE samningur CHECK CONSTRAINT samningur_mynt_fk
GO
ALTER TABLE samningur  WITH CHECK ADD  CONSTRAINT samningur_vanskilagjaldskodi_fk FOREIGN KEY(vanskilagjaldskodi_id)
REFERENCES vanskilagjaldskodi (id)
GO
ALTER TABLE samningur CHECK CONSTRAINT samningur_vanskilagjaldskodi_fk
GO
ALTER TABLE samningur  WITH CHECK ADD  CONSTRAINT samningur_vidskiptamadur_fk FOREIGN KEY(vidskiptamadur_id)
REFERENCES vidskiptamadur (id)
GO
ALTER TABLE samningur CHECK CONSTRAINT samningur_vidskiptamadur_fk
GO
ALTER TABLE thjodskra  WITH NOCHECK ADD  CONSTRAINT thjodskra_postnumer_fk FOREIGN KEY(postnumer_id)
REFERENCES postnumer (postnumer)
GO
ALTER TABLE thjodskra NOCHECK CONSTRAINT thjodskra_postnumer_fk
GO
ALTER TABLE thjodskra  WITH CHECK ADD  CONSTRAINT thjodskra_tegund_logadila_fk FOREIGN KEY(tegund_logadila_id)
REFERENCES tegund_logadila (id)
GO
ALTER TABLE thjodskra CHECK CONSTRAINT thjodskra_tegund_logadila_fk
GO
ALTER TABLE vidskiptamadur  WITH CHECK ADD  CONSTRAINT vidskiptamadur_heimili_fk FOREIGN KEY(heimilisfang_id)
REFERENCES heimilisfang (id)
GO
ALTER TABLE vidskiptamadur CHECK CONSTRAINT vidskiptamadur_heimili_fk
GO
ALTER TABLE vidskiptamadur  WITH CHECK ADD  CONSTRAINT vidskiptamadur_thjodskra_fk FOREIGN KEY(kennitala)
REFERENCES thjodskra (kennitala)
GO
ALTER TABLE vidskiptamadur CHECK CONSTRAINT vidskiptamadur_thjodskra_fk
GO
