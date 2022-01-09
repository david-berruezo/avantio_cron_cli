/*
use universal_db;

# select * from dynamic_rooms;
# select * from avantio_accomodations;

# pricemodifiers | offers
SELECT a.id, min(p.fecha) as start_date ,max(p.fecha) as end_date, 
min_nights, p.type, p.amount 
FROM avantio_accomodations a, avantio_pricemodifiers p 
WHERE a.avantio_pricemodifiers = p.id 
AND p.id = 677163 
AND p.amount < 0 
GROUP BY 1, p.amount;

# get_info
SELECT a.*, t.text_title as taxomy_title, gc.text_title as geocountry_title, gr.text_title as georegion_title, 
gci.text_title as geocity_title, gl.text_title as geolocality_title, gd.text_title as geodistrict_title
FROM avantio_accomodations a 
LEFT JOIN dynamic_taxonomy t ON t.id=a.dynamic_taxonomy AND t.language= 'es'
LEFT JOIN dynamic_geocountry gc ON gc.id=a.dynamic_geocountry AND gc.language='es'
LEFT JOIN dynamic_georegion gr ON gr.id=a.dynamic_georegion AND gr.language='es'
LEFT JOIN dynamic_geocity gci ON gci.id=a.dynamic_geocity AND gci.language='es'
LEFT JOIN dynamic_geolocality gl ON gl.id=a.dynamic_geolocality AND gl.language='es'
LEFT JOIN dynamic_geodistrict gd ON gd.id=a.dynamic_geodistrict AND gd.language='es'
WHERE a.id IN(127855);

# descriptions
SELECT * 
FROM avantio_accomodations_descriptions 
WHERE language = 'es' 
AND avantio_accomodations_descriptions.avantio_accomodations IN(127855); 

# locations
SELECT * 
FROM avantio_accomodations_locations 
WHERE avantio_accomodations_locations.avantio_accomodations IN(127855);  

# nearest_places
SELECT * 
FROM avantio_accomodations_nearest_places 
WHERE avantio_accomodations_nearest_places.avantio_accomodations IN(127855);

# pictures
SELECT * 
FROM avantio_accomodations_pictures 
WHERE avantio_accomodations_pictures.avantio_accomodations IN(127855);

# extras
SELECT e.*,d.text_title,d.image_icon 
FROM avantio_accomodations_extras e, dynamic_services d 
WHERE d.id = e.dynamic_services 
AND d.language = 'es'
AND e.avantio_accomodations IN(127855);


# get_price_xml
SELECT a.id, a.avantio_occupation_rules, a.avantio_pricemodifiers, g.number_release 
FROM avantio_accomodations a, dynamic_geolocality g 
WHERE a.dynamic_geolocality = g.id 
AND g.language = 'es'
AND a.id IN(127855);


# availabilities
SELECT avantio_availabilities.*, MIN(status) as status 
FROM avantio_availabilities 
WHERE accommodation_id = 127855  
AND occupation_rule_id = 20608 
AND fecha BETWEEN "2018-03-20" AND "2018-03-30" 
GROUP BY id;
*/

# borramos tablas
use pisosenm_inmobiliaria_dos;
set SQL_SAFE_UPDATES = 0;

alter table avantio_accomodations add column id_avantio tinyint(3) comment "pertenece a avantio";
alter table dynamic_rooms add column id_avantio tinyint(3) comment "pertenece a avantio";
alter table hshv_dynamic_rooms add column id_avantio tinyint(3) comment "pertenece a avantio";
alter table hshv_avantio_accomodations add column id_avantio tinyint(3) comment "pertenece a avantio";


/*
update dynamic_taxonomy set status = "ACTIVED" where id <> -1;
update dynamic_taxonomy_group set status = "ACTIVED" where id <> -1;


# image_list
select acp.id,acp.avantio_accomodations,ac.text_title, acp.uri_900x600 
from avantio_accomodations_pictures as acp
inner join avantio_accomodations as ac on ac.id = acp.avantio_accomodations 
group by acp.avantio_accomodations; 

# image_list_by_id
select acp.id,acp.avantio_accomodations,ac.text_title, acp.uri_900x600 
from avantio_accomodations_pictures as acp
inner join avantio_accomodations as ac on ac.id = acp.avantio_accomodations 
group by acp.avantio_accomodations; 


select acp.avantio_accomodations as id,ac.text_title, acp.uri_900x600 
from avantio_accomodations_pictures as acp
inner join avantio_accomodations as ac on ac.id = acp.avantio_accomodations 
where acp.avantio_accomodations = 55213;

select * from avantio_accomodations where id <> -1;
select * from avantio_accomodations_descriptions where avantio_accomodations <> -1;
select * from avantio_accomodations_descriptions_tmp where avantio_accomodations <> -1;
select * from avantio_accomodations_extras where avantio_accomodations <> -1;
select * from avantio_accomodations_extras_tmp where avantio_accomodations <> -1;


select * from avantio_accomodations_locations where avantio_accomodations <> -1;
select * from avantio_accomodations_locations_tmp where avantio_accomodations <> -1;
select * from avantio_accomodations_nearest_places where id <> -1;
select * from avantio_accomodations_nearest_places_tmp where id <> -1;
select * from avantio_accomodations_pictures where id <> -1;
select * from avantio_accomodations_pictures_tmp where id <> -1;
select * from avantio_accomodations_tmp where id <> -1;
select * from avantio_availabilities where accommodation_id <> -1;
select * from avantio_availabilities_tmp where accommodation_id <> -1;
select * from avantio_inmovilla where id <> -1;
select * from avantio_occupation_rules where id <> -1;
select * from avantio_occupation_rules_names where id <> -1;
select * from avantio_occupation_rules_tmp where id <> -1;
select * from avantio_pricemodifiers where id <> -1;
select * from avantio_pricemodifiers_tmp where id <> -1;
select * from avantio_pricemodifiers_tmp_vlad where id <> -1;
select * from avantio_rates where accommodation_id <> -1;
select * from avantio_rates_tmp where accommodation_id <> -1;
select * from avantio_report where id <> -1;
select * from avantio_report_historico where id <> -1;


# avantio
delete from avantio_accomodations where id <> -1;
delete from avantio_accomodations_descriptions where avantio_accomodations <> -1;
delete from avantio_accomodations_descriptions_tmp where avantio_accomodations <> -1;
delete from avantio_accomodations_extras where avantio_accomodations <> -1;
delete from avantio_accomodations_extras_tmp where avantio_accomodations <> -1;
delete from avantio_accomodations_locations where avantio_accomodations <> -1;
delete from avantio_accomodations_locations_tmp where avantio_accomodations <> -1;
delete from avantio_accomodations_nearest_places where id <> -1;
delete from avantio_accomodations_nearest_places_tmp where id <> -1;
delete from avantio_accomodations_pictures where id <> -1;
delete from avantio_accomodations_pictures_tmp where id <> -1;
delete from avantio_accomodations_tmp where id <> -1;
delete from avantio_availabilities where accommodation_id <> -1;
delete from avantio_availabilities_tmp where accommodation_id <> -1;
delete from avantio_inmovilla where id <> -1;
delete from avantio_occupation_rules where id <> -1;
delete from avantio_occupation_rules_names where id <> -1;
delete from avantio_occupation_rules_tmp where id <> -1;
delete from avantio_pricemodifiers where id <> -1;
delete from avantio_pricemodifiers_tmp where id <> -1;
delete from avantio_pricemodifiers_tmp_vlad where id <> -1;
delete from avantio_rates where accommodation_id <> -1;
delete from avantio_rates_tmp where accommodation_id <> -1;
delete from avantio_report where accommodation_id <> -1;
delete from avantio_report_historico where accommodation_id <> -1;


# services
delete from dynamic_services where id <> -1;

# geographic areas
delete from dynamic_geocountry where id <> -1;
delete from dynamic_georegion where id <> -1;
delete from dynamic_geocity where id <> -1;
delete from dynamic_geolocality where id <> -1;
delete from dynamic_geodistrict where id <> -1;
delete from dynamic_rooms where id <> -1;

# taxonomy
delete from dynamic_taxonomy where id <> -1;

# rooms
delete from dynamic_rooms where id <> -1;
delete from tmp_dynamic_rooms where id <> -1;


ALTER TABLE avantio_accomodations AUTO_INCREMENT = 1;
ALTER TABLE avantio_accomodations_descriptions AUTO_INCREMENT = 1;
ALTER TABLE avantio_accomodations_descriptions_tmp AUTO_INCREMENT = 1;
ALTER TABLE avantio_accomodations_extras AUTO_INCREMENT = 1;
ALTER TABLE avantio_accomodations_extras_tmp AUTO_INCREMENT = 1;
ALTER TABLE avantio_accomodations_locations AUTO_INCREMENT = 1;
ALTER TABLE avantio_accomodations_locations_tmp AUTO_INCREMENT = 1;
ALTER TABLE avantio_accomodations_nearest_places AUTO_INCREMENT = 1;
ALTER TABLE avantio_accomodations_nearest_places_tmp AUTO_INCREMENT = 1;
ALTER TABLE avantio_accomodations_pictures AUTO_INCREMENT = 1;
ALTER TABLE avantio_accomodations_pictures_tmp AUTO_INCREMENT = 1;
ALTER TABLE avantio_accomodations_tmp AUTO_INCREMENT = 1;
ALTER TABLE avantio_availabilities AUTO_INCREMENT = 1;
ALTER TABLE avantio_availabilities_tmp AUTO_INCREMENT = 1;
ALTER TABLE avantio_inmovilla AUTO_INCREMENT = 1;
ALTER TABLE avantio_occupation_rules AUTO_INCREMENT = 1;
ALTER TABLE avantio_occupation_rules_names AUTO_INCREMENT = 1;
ALTER TABLE avantio_occupation_rules_tmp AUTO_INCREMENT = 1;
ALTER TABLE avantio_pricemodifiers AUTO_INCREMENT = 1;
ALTER TABLE avantio_pricemodifiers_tmp AUTO_INCREMENT = 1;
ALTER TABLE avantio_pricemodifiers_tmp_vlad AUTO_INCREMENT = 1;
ALTER TABLE avantio_rates AUTO_INCREMENT = 1;
ALTER TABLE avantio_rates_tmp AUTO_INCREMENT = 1;

# services
ALTER TABLE dynamic_services AUTO_INCREMENT = 1;

# geographicareas
ALTER TABLE dynamic_geocountry AUTO_INCREMENT = 1;
ALTER TABLE dynamic_georegion AUTO_INCREMENT = 1;
ALTER TABLE dynamic_geocity AUTO_INCREMENT = 1;
ALTER TABLE dynamic_geolocality AUTO_INCREMENT = 1;
ALTER TABLE dynamic_geodistrict AUTO_INCREMENT = 1;


# taxonomy
ALTER TABLE dynamic_taxonomy AUTO_INCREMENT = 1;
ALTER TABLE dynamic_taxonomy_group AUTO_INCREMENT = 1;

# rooms
ALTER TABLE dynamic_rooms AUTO_INCREMENT = 1;
ALTER TABLE tmp_dynamic_rooms AUTO_INCREMENT = 1;


# select groups
select * from avantio_accomodations where id <> -1;
select * from avantio_accomodations_descriptions where avantio_accomodations <> -1;
select * from avantio_accomodations_descriptions_tmp where avantio_accomodations <> -1;
select * from avantio_accomodations_extras where avantio_accomodations <> -1;
select * from avantio_accomodations_extras_tmp where avantio_accomodations <> -1;
select * from avantio_accomodations_locations where avantio_accomodations <> -1;
select * from avantio_accomodations_locations_tmp where avantio_accomodations <> -1;
select * from avantio_accomodations_nearest_places where avantio_accomodations <> -1;
select * from avantio_accomodations_nearest_places_tmp where avantio_accomodations <> -1;
select * from avantio_accomodations_pictures where avantio_accomodations <> -1;
select * from avantio_accomodations_pictures_tmp where id <> -1;
select * from avantio_accomodations_tmp where id <> -1;
select * from avantio_availabilities where accommodation_id <> -1;
select * from avantio_availabilities_tmp where accommodation_id <> -1;
select * from avantio_inmovilla where id <> -1;
select * from avantio_occupation_rules where id <> -1;
select * from avantio_occupation_rules_names where id <> -1;
select * from avantio_occupation_rules_tmp where id <> -1;
select * from avantio_pricemodifiers where id <> -1;
select * from avantio_pricemodifiers_tmp where id <> -1;
select * from avantio_pricemodifiers_tmp_vlad where id <> -1;
select * from avantio_rates where accommodation_id <> -1;
select * from avantio_rates_tmp where accommodation_id <> -1;

*/