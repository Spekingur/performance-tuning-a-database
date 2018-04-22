USE innheimta;
GO
CREATE INDEX idx_hreyfing_tegund_hreyfingar_id
ON hreyfing (tegund_hreyfingar_id)
INCLUDE (krafa_id, bokunardagur);