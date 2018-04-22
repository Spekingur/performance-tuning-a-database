USE innheimta;
-- Scenario 2
-- The following is a single operation, and should ALL be run each time
-- The measurements (time, pages, etc.) for this operation includes the time it takes to create the temporary table!

dbcc freeproccache; -- Throw away execution plans, among other things
dbcc dropcleanbuffers; -- Empty the (block) buffer cache

-- Statistics set
SET STATISTICS TIME, IO ON;

-- Payee with a registered home in the greidandi table has precedence to the one in thjodskra.  
SELECT
	k.id
	,ka.lysing as �stand
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
	,ds.lysing as dr�ttarvaxtastofnk��i
	,dr.lysing as dr�ttarvaxtaregla
	,k.mynt_id
	,m.gjaldmidill
	,gk.lysing as gengisk��i
	,grk.lysing as grei�sluk��i
	,ak.lysing as afsl�ttark��i
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
	,t.kennitala as kennitala_grei�anda
	,t.nafn as nafn_grei�anda
	,g.skilabod_a_greidslusedla
	,ISNULL(h.heimili_1, t.heimili) as heimili_grei�anda
	,ISNULL(ph.postnumer, pt.postnumer) as p�stn�mer_grei�anda
	,ISNULL(ph.stadur, pt.stadur) as sta�ur_grei�anda
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
	,greidandi g
	LEFT OUTER JOIN heimilisfang h ON ( g.heimilisfang_id = h.id )
	LEFT OUTER JOIN postnumer ph ON ( h.postnumer_id = ph.postnumer )
	,thjodskra t
	LEFT OUTER JOIN postnumer pt ON ( t.postnumer_id = pt.postnumer )
	,krafa_astand ka
	,vidskiptamadur v
WHERE
	g.id = k.greidandi_id
	AND s.id = k.samningur_id
	AND ka.id = k.astand_id
	AND s.vidskiptamadur_id = '1' /*{1,10,40,200}*/
	AND k.samningur_id = ( select top 1 id from samningur where vidskiptamadur_id = '1' order by id ) /*{1,10,40,200}*/ -- Keep this in synch with with the customer filtering above!
	AND k.gjalddagi between cast('1/1/2010' as date ) and cast('1/1/2013' as date )
	AND k.tilvisun IS NOT NULL
	AND v.id = g.vidskiptamadur_id
	AND t.kennitala = v.kennitala
;
SET STATISTICS TIME, IO OFF;