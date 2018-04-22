USE innheimta;

dbcc freeproccache; -- Throw away execution plans, among other things
dbcc dropcleanbuffers; -- Empty the (block) buffer cache

ALTER TABLE dbo.samningur DROP CONSTRAINT samningur_pk;

ALTER TABLE dbo.samningur ADD CONSTRAINT samningur_pk PRIMARY KEY CLUSTERED (id ASC);

CREATE INDEX ix_krafa_samn ON krafa (samningur_id, astand_id);
CREATE INDEX ix_hreyfing_krafa ON hreyfing (krafa_id);
CREATE INDEX ix_hreyfing_bokun ON hreyfing (bokunardagur);

DROP INDEX ix_krafa_samn ON krafa;
DROP INDEX ix_hreyfing_krafa ON hreyfing;