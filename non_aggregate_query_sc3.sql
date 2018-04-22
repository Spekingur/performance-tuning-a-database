USE innheimta;
-- Scenario 3
-- The following is a single operation, and should ALL be run each time
-- The measurements (time, pages, etc.) for this operation includes the time it takes to create the temporary table!

dbcc freeproccache; -- Throw away execution plans, among other things
dbcc dropcleanbuffers; -- Empty the (block) buffer cache

-- Statistics set
SET STATISTICS TIME, IO ON;

-- Payee with a registered home in the greidandi table has precedence to the one in thjodskra.  
SELECT
	k.id
	,ka.lysing as ástand
	,k.banki
	,k.hofudbok
	,k.numer
	,k.gjalddagi
	,k.eindagi
	,k.nidurfellingardagur
	,k.upphaed
	,k.tilvisun
	,k.sedilnumer
	,k.vidskiptanumer
	,vk.lysing as vanskilagjaldstegund
	,ds.lysing as dráttarvaxtastofnkóði
	,dr.lysing as dráttarvaxtaregla
	,k.mynt_id
	,m.gjaldmidill
	,gk.lysing as gengiskóði
	,grk.lysing as greiðslukóði
	,ak.lysing as afsláttarkóði
	,k.athugasemd_1
	,k.athugasemd_2
	,k.stada_tilkynningar_og_greidslugjald_1
	,k.stada_tilkynningar_og_greidslugjald_2
	,k.stada_fyrra_vanskilagjald
	,k.stada_seinna_vanskilagjald
	,k.stada_annar_kostnadur
	,k.stada_annar_vanskilakostnadur
	,k.stada_drattarvextir
	,k.stada_afslattur
	,k.upphaed_til_greidslu
	,s.visir
	,t.kennitala as kennitala_greiðanda
	,t.nafn as nafn_greiðanda
	,g.skilabod_a_greidslusedla
	,ISNULL(h.heimili_1, t.heimili) as heimili_greiðanda
	,ISNULL(ph.postnumer, pt.postnumer) as póstnúmer_greiðanda
	,ISNULL(ph.stadur, ph.postnumer) as staður_greiðanda
FROM
	krafa k
	LEFT OUTER JOIN vanskilagjaldskodi vk ON( k.vanskilagjaldskodi_id = vk.id )
	LEFT OUTER JOIN drattarvaxtastofnkodi ds ON( k.drattarvaxtastofnkodi_id = ds.id )
	LEFT OUTER JOIN drattarvaxtaregla dr ON( k.drattarvaxtaregla_id = dr.id )
	LEFT OUTER JOIN mynt m ON( k.mynt_id = m.id )
	LEFT OUTER JOIN gengiskodi gk ON( k.gengiskodi_id = gk.id )
	LEFT OUTER JOIN greidslukodi grk ON( k.greidslukodi_id = grk.id )
	LEFT OUTER JOIN afslattarkodi ak ON( k.afslattarkodi_id = ak.id )
	,samningur s
	,vidskiptamadur v
	,greidandi g
	LEFT OUTER JOIN heimilisfang h ON ( g.heimilisfang_id = h.id )
	LEFT OUTER JOIN postnumer ph ON ( h.postnumer_id = ph.postnumer )
	,thjodskra t
	LEFT OUTER JOIN postnumer pt ON ( t.postnumer_id = pt.postnumer )
	,krafa_astand ka
WHERE
	g.id = k.greidandi_id
	AND s.id = k.samningur_id
	AND ka.id = k.astand_id
	AND v.id = g.vidskiptamadur_id
	AND t.kennitala = v.kennitala
	AND s.vidskiptamadur_id = '1' /*{1,10,40,200}*/
	AND k.astand_id = 1
	AND EXISTS ( SELECT * FROM hreyfing h WHERE h.krafa_id = k.id AND h.innborgunardagur IS NOT NULL AND h.tegund_hreyfingar_id = 4 )
;
SET STATISTICS TIME, IO OFF;