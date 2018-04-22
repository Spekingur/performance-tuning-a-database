USE innheimta;

dbcc freeproccache; -- Throw away execution plans, among other things
dbcc dropcleanbuffers; -- Empty the (block) buffer cache

--ALTER TABLE dbo.samningur DROP CONSTRAINT samningur_pk;

--ALTER TABLE dbo.samningur ADD CONSTRAINT samningur_pk PRIMARY KEY CLUSTERED (id ASC);

CREATE INDEX ix_krafa_samn ON krafa (samningur_id, astand_id);
CREATE INDEX ix_hreyfing_krafa ON hreyfing (krafa_id);
CREATE INDEX ix_hreyfing_bokun ON hreyfing (bokunardagur);
CREATE INDEX ix_hreyfing_tegund_h ON hreyfing (tegund_hreyfingar_id);
CREATE INDEX ix_hreyfing_innbdagur ON hreyfing (innborgunardagur);
CREATE INDEX ix_thjodskra_postnumer ON thjodskra (postnumer_id);
CREATE INDEX ix_heimilisfang_postnumer ON heimilisfang (postnumer_id);

ALTER TABLE vidskiptamadur DROP CONSTRAINT vidskiptamadur_thjodskra_fk;
ALTER TABLE thjodskra DROP CONSTRAINT thjodskra_pk;
ALTER TABLE thjodskra ADD CONSTRAINT thjodskra_pk PRIMARY KEY CLUSTERED (kennitala ASC);
ALTER TABLE vidskiptamadur ADD CONSTRAINT vidskiptamadur_thjodskra_fk FOREIGN KEY (kennitala)
	REFERENCES thjodskra (kennitala);

--DROP INDEX ix_krafa_samn ON krafa;
--DROP INDEX ix_hreyfing_krafa ON hreyfing;