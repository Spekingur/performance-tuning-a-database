USE innheimta;

dbcc freeproccache; -- Throw away execution plans, among other things
dbcc dropcleanbuffers; -- Empty the (block) buffer cache

CREATE INDEX ix_krafa_samningur ON krafa (samningur_id);
CREATE INDEX ix_krafa_astand_id ON krafa (astand_id);
CREATE INDEX ix_krafa_kostnadur ON krafa (annar_kostnadur)
	INCLUDE (annar_vanskilakostnadur, fyrri_afslattur, seinni_afslattur);
CREATE INDEX ix_krafa_banki ON krafa (banki)
	INCLUDE (id, samningur_id, upphaed_til_greidslu);
CREATE INDEX ix_samningur_vidskiptamadur_id ON samningur (vidskiptamadur_id);
CREATE INDEX ix_hreyfing_krafa ON hreyfing (krafa_id);
CREATE INDEX ix_hreyfing_bokun ON hreyfing (bokunardagur);
CREATE INDEX ix_hreyfing_tegund_hreyfingar_id ON hreyfing (tegund_hreyfingar_id) 
	INCLUDE (krafa_id, bokunardagur);
CREATE INDEX ix_hreyfing_innbdagur ON hreyfing (innborgunardagur);
CREATE INDEX ix_thjodskra_postnumer ON thjodskra (postnumer_id);
CREATE INDEX ix_heimilisfang_postnumer ON heimilisfang (postnumer_id);
CREATE INDEX ix_krafa_gjalddagi ON krafa (gjalddagi);
CREATE INDEX ix_krafa_tilvisun ON krafa (tilvisun);
CREATE INDEX ix_krafa_greidandi_id ON krafa (greidandi_id) 
	INCLUDE (samningur_id, astand_id);

ALTER TABLE vidskiptamadur DROP CONSTRAINT vidskiptamadur_thjodskra_fk;
ALTER TABLE thjodskra DROP CONSTRAINT thjodskra_pk;
ALTER TABLE thjodskra ADD CONSTRAINT thjodskra_pk PRIMARY KEY CLUSTERED (kennitala ASC);
ALTER TABLE vidskiptamadur ADD CONSTRAINT vidskiptamadur_thjodskra_fk FOREIGN KEY (kennitala)
	REFERENCES thjodskra (kennitala);