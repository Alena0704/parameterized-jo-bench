WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(cn.name) AS from_company,
       MIN(lt.link) AS movie_link_type,
       MIN(t.title) AS sequel_movie
FROM company_name AS cn,
     company_type AS ct,
     keyword AS k,
     link_type AS lt,
     movie_companies AS mc,
     movie_keyword AS mk,
     movie_link AS ml,
     title AS t
WHERE cn.country_code !=(select country_code from company_name order by random() limit 1)  AND (cn.name LIKE '%Film%'
       OR cn.name LIKE '%Warner%')
  AND ct.kind =(select kind from company_type order by random() limit 1)  AND k.keyword =(select keyword from keyword order by random() limit 1)  AND lt.link LIKE '%follows%'
  AND mc.note IS NULL
  AND t.production_year =(select production_year from title order by random() limit 1)  AND t.title LIKE '%Money%'
  AND lt.id = ml.link_type_id
  AND ml.movie_id = t.id
  AND t.id = mk.movie_id
  AND mk.keyword_id = k.id
  AND t.id = mc.movie_id
  AND mc.company_type_id = ct.id
  AND mc.company_id = cn.id
  AND ml.movie_id = mk.movie_id
  AND ml.movie_id = mc.movie_id
  AND mk.movie_id = mc.movie_id;

