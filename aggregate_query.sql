USE innheimta;

dbcc freeproccache; -- Throw away execution plans, among other things
dbcc dropcleanbuffers; -- Empty the (block) buffer cache

-- Statistics set
SET STATISTICS TIME, IO ON;

-- Summa greiddra krafna einstaklinga, per útibú, eftir póstnúmeri kröfuhafa (skráning í heimilisfang hefur forgang umfram þjóðskrá) og greiðslutímabili. Fyrir svæði utan 1xx póstnúmeraseríunnar.
SELECT
 distinct k.banki, isnull( ph.postnumer, pt.postnumer ) as Póstnúmer, YEAR( h.bokunardagur ) as Ár, sum( k.upphaed_til_greidslu ) as Heildarupphæð 
FROM
	krafa k,
	samningur s,
	hreyfing h,
	thjodskra t
	LEFT OUTER JOIN postnumer pt ON ( t.postnumer_id = pt.postnumer ),
	vidskiptamadur v
	LEFT OUTER JOIN heimilisfang hf ON ( v.heimilisfang_id = hf.id )
	LEFT OUTER JOIN postnumer ph ON ( hf.postnumer_id = ph.postnumer )
WHERE
	s.id = k.samningur_id
	AND k.astand_id = 2
	AND v.id = s.vidskiptamadur_id
	AND v.kennitala = t.kennitala
	AND t.tegund_logadila_id = 1
	AND pt.postnumer not like '1%' 
	AND ph.postnumer not like '1%' 
	AND h.krafa_id = k.id
	AND h.tegund_hreyfingar_id = 5
	AND k.annar_kostnadur is null
	AND k.annar_vanskilakostnadur is null
	AND k.fyrri_afslattur is null
	AND k.seinni_afslattur is null
	AND YEAR( h.bokunardagur ) > 2007
GROUP BY
	k.banki, isnull( ph.postnumer, pt.postnumer ), YEAR( h.bokunardagur )
ORDER BY 
	k.banki, isnull( ph.postnumer, pt.postnumer ), YEAR( h.bokunardagur )

SET STATISTICS TIME, IO OFF;