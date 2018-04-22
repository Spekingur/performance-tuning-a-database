USE innheimta;

dbcc freeproccache WITH NO_INFOMSGS; -- Throw away execution plans, among other things
dbcc dropcleanbuffers WITH NO_INFOMSGS; -- Empty the (block) buffer cache

-- Statistics set
SET STATISTICS TIME, IO ON;

GO
-- Summa greiddra krafna einstaklinga, per �tib�, eftir p�stn�meri kr�fuhafa
-- (skr�ning � heimilisfang hefur forgang umfram �j��skr�) og grei�slut�mabili.
-- Fyrir sv��i utan 1xx p�stn�meraser�unnar.
SELECT
 k.banki, ph.postnumer as P�stn�mer, YEAR( h.bokunardagur ) as �r, sum( k.upphaed_til_greidslu ) as Heildarupph�� 
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
	k.annar_kostnadur is null
	AND k.annar_vanskilakostnadur is null
	AND k.fyrri_afslattur is null
	AND k.seinni_afslattur is null
	AND s.id = k.samningur_id
	AND k.astand_id = 2
	AND v.id = s.vidskiptamadur_id
	AND v.kennitala = t.kennitala
	AND t.tegund_logadila_id = 1
	AND pt.postnumer not like '1%' 
	AND ph.postnumer not like '1%' 
	AND h.krafa_id = k.id
	AND h.tegund_hreyfingar_id = 5
GROUP BY
	k.banki, ph.postnumer, YEAR( h.bokunardagur )
HAVING 
	YEAR( h.bokunardagur ) > 2007
ORDER BY 
	k.banki, ph.postnumer, YEAR( h.bokunardagur )

SET STATISTICS TIME, IO OFF;