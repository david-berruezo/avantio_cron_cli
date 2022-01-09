<?php
/**
 * Created by PhpStorm.
 * User: DAVID01
 * Date: 01/09/2021
 * Time: 16:20
 */

namespace App\Models;

/**
 * Created by PhpStorm.
 * User: DAVID01
 * Date: 11/07/2021
 * Time: 12:10
 */

use CodeIgniter\Model;

class Accomodation extends Model{

    protected $table      = 'dynamic_services';
    protected $primaryKey = 'id';
    protected $allowedFields = ['id', 'language','text_title'];


    public function insertAccomodations($xml,$avantio_credentials,$ts,$ts_referencia,$languages)
    {

        $db = \Config\Database::connect('tests');

        $sql="DROP TABLE IF EXISTS avantio_accomodations_tmp;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $sql="DROP TABLE IF EXISTS avantio_inmovilla;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $sql="CREATE TABLE avantio_accomodations_tmp LIKE avantio_accomodations;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $sql="CREATE TABLE avantio_inmovilla LIKE avantio_accomodations;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $inserts=array();
        $anyo_actual=intval(date("Y"));
        foreach($xml->Accommodation as $accommodation){
            $id=intval($accommodation->AccommodationId);
            //if($id=='128056') print_r($accommodation);
            $text_title = (string)$accommodation->AccommodationName;
            $text_title = $accommodation->AccommodationName;
            $text_referencia = $id;
            /*
            $temp = explode(" ",$text_title,2);
            //echo $text_title . "<br>";
            if ($text_title && count($temp) > 1)
                list($text_referencia,$text_title) = explode(" ",$text_title,2);
            */

            $text_userid = (string)$accommodation->UserId;
            $text_company = (string)$accommodation->Company;
            $number_companyid=intval($accommodation->CompanyId);
            $text_numero_registro_turistico=(string)$accommodation->TouristicRegistrationNumber;
            # avantio
            $avantio_occupation_rules=intval($accommodation->OccupationalRuleId);
            $avantio_pricemodifiers=intval($accommodation->PriceModifierId);
            $avantio_gallery=intval($accommodation->IdGallery);
            $dynamic_taxonomy=intval($accommodation->MasterKind->MasterKindCode);
            # geolocalities
            $dynamic_geocountry=intval($accommodation->LocalizationData->Country->CountryCode);
            $dynamic_georegion=intval($accommodation->LocalizationData->Region->RegionCode);
            $dynamic_geocity=intval($accommodation->LocalizationData->City->CityCode);
            $dynamic_geolocality=intval($accommodation->LocalizationData->Locality->LocalityCode);
            $dynamic_geodistrict=intval($accommodation->LocalizationData->District->DistrictCode);
            # calle piso bloque
            $text_geo_tipo_calle=(string)$accommodation->LocalizationData->KindOfWay;
            $text_geo_calle=(string)$accommodation->LocalizationData->Way;
            $text_geo_numero=(string)$accommodation->LocalizationData->Number;
            $text_geo_bloque=(string)$accommodation->LocalizationData->Block;
            $text_geo_puerta=(string)$accommodation->LocalizationData->Door;
            $text_geo_piso=(string)$accommodation->LocalizationData->Floor;
            # geo latitud longitud
            $text_geo_latitud=(string)$accommodation->LocalizationData->GoogleMaps->Latitude;
            $text_geo_longitud=(string)$accommodation->LocalizationData->GoogleMaps->Longitude;
            $number_geo_zoom=intval($accommodation->LocalizationData->GoogleMaps->Zoom);
            $number_unidades=intval($accommodation->AccommodationUnits);
            $number_capacidad_maxima=intval($accommodation->Features->Distribution->PeopleCapacity);
            $number_capacidad_minima=intval($accommodation->Features->Distribution->MinimumOccupation);
            $number_habitaciones=intval($accommodation->Features->Distribution->Bedrooms);
            $number_camas_doble=intval($accommodation->Features->Distribution->DoubleBeds);
            $number_camas_individual=intval($accommodation->Features->Distribution->IndividualBeds);
            $number_sofas_cama=intval($accommodation->Features->Distribution->IndividualSofaBed);
            $number_sofas_cama_doble=intval($accommodation->Features->Distribution->DoubleSofaBed);
            $number_literas=intval($accommodation->Features->Distribution->Berths);
            $number_aseos=intval($accommodation->Features->Distribution->Toilets);
            $number_banyos_banyera=intval($accommodation->Features->Distribution->BathroomWithBathtub);
            $number_banyos_ducha=intval($accommodation->Features->Distribution->BathroomWithShower);
            $number_metros_cuadrados=intval($accommodation->Features->Distribution->AreaHousing->Area);
            $number_cocinas=intval($accommodation->Features->HouseCharacteristics->Kitchen->NumberOfKitchens);
            $checkbox_grups=((string)$accommodation->Features->Distribution->AcceptYoungsters == 'true')?1:0;
            $checkbox_piscina=isset($accommodation->Features->HouseCharacteristics->SwimmingPool)?1:0;
            $checkbox_tv=((string)$accommodation->Features->HouseCharacteristics->TV == 'true')?1:0;
            $checkbox_jardin=((string)$accommodation->Features->HouseCharacteristics->Garden == 'true')?1:0;
            $checkbox_muebles_jardin=((string)$accommodation->Features->HouseCharacteristics->GardenFurniture == 'true')?1:0;
            $checkbox_plancha=((string)$accommodation->Features->HouseCharacteristics->Iron == 'true')?1:0;
            $checkbox_chimenea=((string)$accommodation->Features->HouseCharacteristics->FirePlace == 'true')?1:0;
            $checkbox_barbacoa=((string)$accommodation->Features->HouseCharacteristics->Barbacue == 'true')?1:0;
            $checkbox_radio=((string)$accommodation->Features->HouseCharacteristics->Radio == 'true')?1:0;
            $checkbox_minibar=((string)$accommodation->Features->HouseCharacteristics->MiniBar == 'true')?1:0;
            $checkbox_terraza=((string)$accommodation->Features->HouseCharacteristics->Terrace == 'true')?1:0;
            $checkbox_parcela_vallada=((string)$accommodation->Features->HouseCharacteristics->FencedPlot == 'true')?1:0;
            $checkbox_caja_seguridad=((string)$accommodation->Features->HouseCharacteristics->SecurityBox == 'true')?1:0;
            $checkbox_ascensor=((string)$accommodation->Features->HouseCharacteristics->Elevator == 'true')?1:0;
            $checkbox_dvd=((string)$accommodation->Features->HouseCharacteristics->DVD == 'true')?1:0;
            $checkbox_balcon=((string)$accommodation->Features->HouseCharacteristics->Balcony == 'true')?1:0;
            $checkbox_exprimidor=((string)$accommodation->Features->HouseCharacteristics->JuiceSqueazer == 'true')?1:0;
            $checkbox_hervidor_electrico=((string)$accommodation->Features->HouseCharacteristics->ElectricKettle == 'true')?1:0;
            $checkbox_secador_pelo=((string)$accommodation->Features->HouseCharacteristics->HairDryer == 'true')?1:0;
            $checkbox_zona_ninos=((string)$accommodation->Features->HouseCharacteristics->ChildrenArea == 'true')?1:0;
            $checkbox_gimnasio=((string)$accommodation->Features->HouseCharacteristics->Gym == 'true')?1:0;
            $checkbox_alarma=((string)$accommodation->Features->HouseCharacteristics->Alarm == 'true')?1:0;
            $checkbox_tennis=((string)$accommodation->Features->HouseCharacteristics->Tennis == 'true')?1:0;
            $checkbox_squash=((string)$accommodation->Features->HouseCharacteristics->Squash == 'true')?1:0;
            $checkbox_paddel=((string)$accommodation->Features->HouseCharacteristics->Paddel == 'true')?1:0;
            $checkbox_sauna=((string)$accommodation->Features->HouseCharacteristics->Sauna == 'true')?1:0;
            $checkbox_jacuzzi=((string)$accommodation->Features->HouseCharacteristics->Jacuzzi == 'true')?1:0;
            $checkbox_apta_discapacitados=((string)$accommodation->Features->HouseCharacteristics->HandicappedFacilities == 'apta-discapacitados')?1:0;
            $checkbox_fumadores=((string)$accommodation->Features->HouseCharacteristics->SmokingAllowed == 'true')?1:0;
            $text_cocina_clase=(string)$accommodation->Features->HouseCharacteristics->KitchenClass;
            $text_cocina_tipo=(string)$accommodation->Features->HouseCharacteristics->KitchenType;
            $checkbox_nevera=((string)$accommodation->Features->HouseCharacteristics->Kitchen->Fridge == 'true')?1:0;
            $checkbox_congelador=((string)$accommodation->Features->HouseCharacteristics->Kitchen->Freezer == 'true')?1:0;
            $checkbox_lavavajillas=((string)$accommodation->Features->HouseCharacteristics->Kitchen->Dishwasher == 'true')?1:0;
            $checkbox_lavadora=((string)$accommodation->Features->HouseCharacteristics->Kitchen->WashingMachine == 'true')?1:0;
            $checkbox_secadora=((string)$accommodation->Features->HouseCharacteristics->Kitchen->Dryer == 'true')?1:0;
            $checkbox_cafetera=((string)$accommodation->Features->HouseCharacteristics->Kitchen->CoffeeMachine == 'true')?1:0;
            $checkbox_tostadora=((string)$accommodation->Features->HouseCharacteristics->Kitchen->Toaster == 'true')?1:0;
            $checkbox_microondas=((string)$accommodation->Features->HouseCharacteristics->Kitchen->Microwave == 'true')?1:0;
            $checkbox_horno=((string)$accommodation->Features->HouseCharacteristics->Kitchen->Oven == 'true')?1:0;
            $checkbox_vajilla=((string)$accommodation->Features->HouseCharacteristics->Kitchen->TableWare == 'true')?1:0;
            $checkbox_utensilios_cocina=((string)$accommodation->Features->HouseCharacteristics->Kitchen->KitchenUtensils == 'true')?1:0;
            $text_tipo_piscina=(string)$accommodation->Features->HouseCharacteristics->SwimmingPool->PoolType;
            $text_tipo_piscina=(strlen($text_tipo_piscina)==0)?'comunitaria':$text_tipo_piscina;
            $text_tipo_piscina=($checkbox_piscina) ? $text_tipo_piscina: '';

            $inserts[]="('".$id."','".addslashes($text_title)."','".addslashes($text_referencia)."','".addslashes($text_numero_registro_turistico)."',
                        '".addslashes($avantio_occupation_rules)."','".addslashes($avantio_pricemodifiers)."','".addslashes($avantio_gallery)."','".addslashes($dynamic_taxonomy)."',
                        '".addslashes($dynamic_geocountry)."','".addslashes($dynamic_georegion)."','".addslashes($dynamic_geocity)."','".addslashes($dynamic_geolocality)."',
                        '".addslashes($dynamic_geodistrict)."','".addslashes($text_geo_tipo_calle)."','".addslashes($text_geo_calle)."','".addslashes($text_geo_numero)."',
                        '".addslashes($text_geo_bloque)."','".addslashes($text_geo_puerta)."','".addslashes($text_geo_piso)."','".addslashes($text_geo_latitud)."',
                        '".addslashes($text_geo_longitud)."','".addslashes($number_geo_zoom)."','".addslashes($number_unidades)."','".addslashes($number_capacidad_maxima)."',
                        '".addslashes($number_capacidad_minima)."','".addslashes($number_habitaciones)."','".addslashes($number_camas_doble)."','".addslashes($number_camas_individual)."',
                        '".addslashes($number_sofas_cama)."','".addslashes($number_sofas_cama_doble)."','".addslashes($number_literas)."','".addslashes($number_aseos)."',
                        '".addslashes($number_banyos_banyera)."','".addslashes($number_banyos_ducha)."','".addslashes($number_metros_cuadrados)."','".addslashes($number_cocinas)."',
                        '".addslashes($checkbox_piscina)."','".addslashes($checkbox_grups)."','".addslashes($checkbox_tv)."','".addslashes($checkbox_jardin)."','".addslashes($checkbox_muebles_jardin)."',
                        '".addslashes($checkbox_plancha)."','".addslashes($checkbox_chimenea)."','".addslashes($checkbox_barbacoa)."','".addslashes($checkbox_radio)."',
                        '".addslashes($checkbox_minibar)."','".addslashes($checkbox_terraza)."','".addslashes($checkbox_parcela_vallada)."','".addslashes($checkbox_caja_seguridad)."',
                        '".addslashes($checkbox_ascensor)."','".addslashes($checkbox_dvd)."','".addslashes($checkbox_balcon)."','".addslashes($checkbox_exprimidor)."',
                        '".addslashes($checkbox_hervidor_electrico)."','".addslashes($checkbox_secador_pelo)."','".addslashes($checkbox_zona_ninos)."','".addslashes($checkbox_gimnasio)."',
                        '".addslashes($checkbox_alarma)."','".addslashes($checkbox_tennis)."','".addslashes($checkbox_squash)."','".addslashes($checkbox_paddel)."',
                        '".addslashes($checkbox_sauna)."','".addslashes($checkbox_jacuzzi)."','".addslashes($checkbox_apta_discapacitados)."','".addslashes($checkbox_fumadores)."',
                        '".addslashes($text_cocina_clase)."','".addslashes($text_cocina_tipo)."','".addslashes($checkbox_nevera)."','".addslashes($checkbox_congelador)."',
                        '".addslashes($checkbox_lavavajillas)."','".addslashes($checkbox_lavadora)."','".addslashes($checkbox_secadora)."','".addslashes($checkbox_cafetera)."',
                        '".addslashes($checkbox_tostadora)."','".addslashes($checkbox_microondas)."','".addslashes($checkbox_horno)."','".addslashes($checkbox_vajilla)."',
                        '".addslashes($checkbox_utensilios_cocina)."','".addslashes($text_userid)."','".addslashes($text_company)."','".addslashes($number_companyid)."',
                        '".addslashes($text_tipo_piscina)."' , '1' )";
            if(count($inserts)>=$avantio_credentials['INSERT_COUNT']){
                $sql="INSERT INTO avantio_accomodations_tmp 
                        (id,text_title,text_referencia,text_numero_registro_turistico,
                        avantio_occupation_rules,avantio_pricemodifiers,avantio_gallery,dynamic_taxonomy,
                        dynamic_geocountry,dynamic_georegion,dynamic_geocity,dynamic_geolocality,
                        dynamic_geodistrict,text_geo_tipo_calle,text_geo_calle,text_geo_numero,
                        text_geo_bloque,text_geo_puerta,text_geo_piso,text_geo_latitud,
                        text_geo_longitud,number_geo_zoom,number_unidades,number_capacidad_maxima,
                        number_capacidad_minima,number_habitaciones,number_camas_doble,number_camas_individual,
                        number_sofas_cama,number_sofas_cama_doble,number_literas,number_aseos,
                        number_banyos_banyera,number_banyos_ducha,number_metros_cuadrados,number_cocinas,
                        checkbox_piscina,checkbox_grups,checkbox_tv,checkbox_jardin,checkbox_muebles_jardin,
                        checkbox_plancha,checkbox_chimenea,checkbox_barbacoa,checkbox_radio,
                        checkbox_minibar,checkbox_terraza,checkbox_parcela_vallada,checkbox_caja_seguridad,
                        checkbox_ascensor,checkbox_dvd,checkbox_balcon,checkbox_exprimidor,
                        checkbox_hervidor_electrico,checkbox_secador_pelo,checkbox_zona_ninos,checkbox_gimnasio,
                        checkbox_alarma,checkbox_tennis,checkbox_squash,checkbox_paddel,
                        checkbox_sauna,checkbox_jacuzzi,checkbox_apta_discapacitados,checkbox_fumadores,
                        text_cocina_clase,text_cocina_tipo,checkbox_nevera,checkbox_congelador,
                        checkbox_lavavajillas,checkbox_lavadora,checkbox_secadora,checkbox_cafetera,
                        checkbox_tostadora,checkbox_microondas,checkbox_horno,checkbox_vajilla,
                        checkbox_utensilios_cocina,text_userid,text_company,number_companyid,
                        text_tipo_piscina,id_avantio)
                        VALUES ".implode(",",$inserts).";";
                if (!$db->query($sql)){
                    $error = $db->error();
                    echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                    die();
                }// end if

                $sql="INSERT INTO avantio_inmovilla 
                        (id,text_title,text_referencia,text_numero_registro_turistico,
                        avantio_occupation_rules,avantio_pricemodifiers,avantio_gallery,dynamic_taxonomy,
                        dynamic_geocountry,dynamic_georegion,dynamic_geocity,dynamic_geolocality,
                        dynamic_geodistrict,text_geo_tipo_calle,text_geo_calle,text_geo_numero,
                        text_geo_bloque,text_geo_puerta,text_geo_piso,text_geo_latitud,
                        text_geo_longitud,number_geo_zoom,number_unidades,number_capacidad_maxima,
                        number_capacidad_minima,number_habitaciones,number_camas_doble,number_camas_individual,
                        number_sofas_cama,number_sofas_cama_doble,number_literas,number_aseos,
                        number_banyos_banyera,number_banyos_ducha,number_metros_cuadrados,number_cocinas,
                        checkbox_piscina,checkbox_grups,checkbox_tv,checkbox_jardin,checkbox_muebles_jardin,
                        checkbox_plancha,checkbox_chimenea,checkbox_barbacoa,checkbox_radio,
                        checkbox_minibar,checkbox_terraza,checkbox_parcela_vallada,checkbox_caja_seguridad,
                        checkbox_ascensor,checkbox_dvd,checkbox_balcon,checkbox_exprimidor,
                        checkbox_hervidor_electrico,checkbox_secador_pelo,checkbox_zona_ninos,checkbox_gimnasio,
                        checkbox_alarma,checkbox_tennis,checkbox_squash,checkbox_paddel,
                        checkbox_sauna,checkbox_jacuzzi,checkbox_apta_discapacitados,checkbox_fumadores,
                        text_cocina_clase,text_cocina_tipo,checkbox_nevera,checkbox_congelador,
                        checkbox_lavavajillas,checkbox_lavadora,checkbox_secadora,checkbox_cafetera,
                        checkbox_tostadora,checkbox_microondas,checkbox_horno,checkbox_vajilla,
                        checkbox_utensilios_cocina,text_userid,text_company,number_companyid,
                        text_tipo_piscina,id_avantio)
                        VALUES ".implode(",",$inserts).";";
                if (!$db->query($sql)){
                    $error = $db->error();
                    echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                    die();
                }// end if
                $inserts=array();
            }
        }
        if(!empty($inserts)){
            $sql="INSERT INTO avantio_accomodations_tmp 
                    (id,text_title,text_referencia,text_numero_registro_turistico,
                    avantio_occupation_rules,avantio_pricemodifiers,avantio_gallery,dynamic_taxonomy,
                    dynamic_geocountry,dynamic_georegion,dynamic_geocity,dynamic_geolocality,
                    dynamic_geodistrict,text_geo_tipo_calle,text_geo_calle,text_geo_numero,
                    text_geo_bloque,text_geo_puerta,text_geo_piso,text_geo_latitud,
                    text_geo_longitud,number_geo_zoom,number_unidades,number_capacidad_maxima,
                    number_capacidad_minima,number_habitaciones,number_camas_doble,number_camas_individual,
                    number_sofas_cama,number_sofas_cama_doble,number_literas,number_aseos,
                    number_banyos_banyera,number_banyos_ducha,number_metros_cuadrados,number_cocinas,
                    checkbox_piscina,checkbox_grups,checkbox_tv,checkbox_jardin,checkbox_muebles_jardin,
                    checkbox_plancha,checkbox_chimenea,checkbox_barbacoa,checkbox_radio,
                    checkbox_minibar,checkbox_terraza,checkbox_parcela_vallada,checkbox_caja_seguridad,
                    checkbox_ascensor,checkbox_dvd,checkbox_balcon,checkbox_exprimidor,
                    checkbox_hervidor_electrico,checkbox_secador_pelo,checkbox_zona_ninos,checkbox_gimnasio,
                    checkbox_alarma,checkbox_tennis,checkbox_squash,checkbox_paddel,
                    checkbox_sauna,checkbox_jacuzzi,checkbox_apta_discapacitados,checkbox_fumadores,
                    text_cocina_clase,text_cocina_tipo,checkbox_nevera,checkbox_congelador,
                    checkbox_lavavajillas,checkbox_lavadora,checkbox_secadora,checkbox_cafetera,
                    checkbox_tostadora,checkbox_microondas,checkbox_horno,checkbox_vajilla,
                    checkbox_utensilios_cocina,text_userid,text_company,number_companyid,
                    text_tipo_piscina,id_avantio)
                    VALUES ".implode(",",$inserts).";";
            if (!$db->query($sql)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            $sql="INSERT INTO avantio_inmovilla 
                    (id,text_title,text_referencia,text_numero_registro_turistico,
                    avantio_occupation_rules,avantio_pricemodifiers,avantio_gallery,dynamic_taxonomy,
                    dynamic_geocountry,dynamic_georegion,dynamic_geocity,dynamic_geolocality,
                    dynamic_geodistrict,text_geo_tipo_calle,text_geo_calle,text_geo_numero,
                    text_geo_bloque,text_geo_puerta,text_geo_piso,text_geo_latitud,
                    text_geo_longitud,number_geo_zoom,number_unidades,number_capacidad_maxima,
                    number_capacidad_minima,number_habitaciones,number_camas_doble,number_camas_individual,
                    number_sofas_cama,number_sofas_cama_doble,number_literas,number_aseos,
                    number_banyos_banyera,number_banyos_ducha,number_metros_cuadrados,number_cocinas,
                    checkbox_piscina,checkbox_grups,checkbox_tv,checkbox_jardin,checkbox_muebles_jardin,
                    checkbox_plancha,checkbox_chimenea,checkbox_barbacoa,checkbox_radio,
                    checkbox_minibar,checkbox_terraza,checkbox_parcela_vallada,checkbox_caja_seguridad,
                    checkbox_ascensor,checkbox_dvd,checkbox_balcon,checkbox_exprimidor,
                    checkbox_hervidor_electrico,checkbox_secador_pelo,checkbox_zona_ninos,checkbox_gimnasio,
                    checkbox_alarma,checkbox_tennis,checkbox_squash,checkbox_paddel,
                    checkbox_sauna,checkbox_jacuzzi,checkbox_apta_discapacitados,checkbox_fumadores,
                    text_cocina_clase,text_cocina_tipo,checkbox_nevera,checkbox_congelador,
                    checkbox_lavavajillas,checkbox_lavadora,checkbox_secadora,checkbox_cafetera,
                    checkbox_tostadora,checkbox_microondas,checkbox_horno,checkbox_vajilla,
                    checkbox_utensilios_cocina,text_userid,text_company,number_companyid,
                    text_tipo_piscina,id_avantio)
                    VALUES ".implode(",",$inserts).";";
            if (!$db->query($sql)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            $inserts=array();
        }
        $sql = "RENAME TABLE avantio_accomodations TO avantio_accomodations_back, avantio_accomodations_tmp TO avantio_accomodations, avantio_accomodations_back TO avantio_accomodations_tmp;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        # ACCOMODATIONS TO DYNAMIC_ROOMS
        $sql="DROP TABLE IF EXISTS tmp_dynamic_rooms;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $sql="CREATE TABLE tmp_dynamic_rooms LIKE dynamic_rooms;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if
        /*
        $sql="INSERT INTO tmp_dynamic_rooms SELECT * FROM dynamic_rooms;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if
        */
        $sql="UPDATE tmp_dynamic_rooms SET status='PAUSED';";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        foreach($xml->Accommodation as $accommodation){
            # id and reference
            $id = intval($accommodation->AccommodationId);

            $text_title = (string)$accommodation->AccommodationName;
            $text_title = $accommodation->AccommodationName;
            $text_ref = $id;
            /*
            $text_title=(string)$accommodation->AccommodationName;
            $temp = explode(" ",$text_title,2);
            //echo $text_title . "<br>";
            $text_referencia = "";

            if ($text_title && count($temp) > 1)
                list($text_referencia,$text_title) = explode(" ",$text_title,2);

            $text_ref = $text_referencia;
            */
            $text_subtitle = $text_title . " " . $text_referencia;
            $dynamic_agencia = intval($accommodation->CompanyId);
            $dynamic_usuario = -1;
            # taxonomy
            $dynamic_taxonomy       = intval($accommodation->MasterKind->MasterKindCode);
            $dynamic_taxonomy_group = intval($accommodation->MasterKind->MasterKindCode);
            # gegraphic area
            $dynamic_geocountry=intval($accommodation->LocalizationData->Country->CountryCode);
            $dynamic_georegion=intval($accommodation->LocalizationData->Region->RegionCode);
            $dynamic_geocity=intval($accommodation->LocalizationData->City->CityCode);
            $dynamic_geolocality=intval($accommodation->LocalizationData->Locality->LocalityCode);
            $dynamic_geodistrict=intval($accommodation->LocalizationData->District->DistrictCode);
            # accion
            $dynamic_accion = 2;
            # gallery
            $dynamic_gallery_inmo = intval($accommodation->IdGallery);
            # calle piso bloque
            $text_geo_tipo_calle=(string)$accommodation->LocalizationData->KindOfWay;
            $text_calle=(string)$accommodation->LocalizationData->Way;
            $text_numero_calle=(string)$accommodation->LocalizationData->Number;
            $text_bloque_propiedad=(string)$accommodation->LocalizationData->Block;
            $text_puerta_propiedad=(string)$accommodation->LocalizationData->Door;
            $text_planta_propiedad=(string)$accommodation->LocalizationData->Floor;
            # latitud y longitud
            $text_latitud=(string)$accommodation->LocalizationData->GoogleMaps->Latitude;
            $text_altitud=(string)$accommodation->LocalizationData->GoogleMaps->Longitude;
            $text_geo_zoom=intval($accommodation->LocalizationData->GoogleMaps->Zoom);
            # meta keys
            $text_page_title = $text_title;
            $auto_slug = url_semantica($text_title);
            $text_slug = "";
            $text_meta_keywords = $text_title;
            $text_meta_robots = "INDEX,FOLLOW";
            $text_meta_description = $text_title;
            $textarea_scripts_header = "";
            $textarea_scripts_body = "";
            $status = "ACTIVED";
            $position = 0;
            # insert_rooms
            //foreach($GLOBALS['avantio']["ACTIVED_LANGUAGES"] as $language){
            /*
            $language = 'es';
            $inserts_rooms = array();
            $inserts_rooms[] = "('".$id."','".addslashes($language)."','".addslashes($text_title)."' ,'".addslashes($text_subtitle)."',
                        '".addslashes($text_ref)."' ,'".addslashes($dynamic_agencia)."','".addslashes($dynamic_usuario)."' ,'".addslashes($dynamic_taxonomy)."',
                        '".addslashes($dynamic_taxonomy_group)."' , '".addslashes($dynamic_geocountry)."' , '".addslashes($dynamic_georegion)."' ,
                        '".addslashes($dynamic_geocity)."' , '".addslashes($dynamic_geolocality)."' , '".addslashes($dynamic_geodistrict)."' ,
                        '".addslashes($dynamic_accion)."' , '".addslashes($dynamic_gallery_inmo)."' , '".addslashes($text_calle)."' , '".addslashes($text_numero_calle)."' ,
                        '".addslashes($text_bloque_propiedad)."' , '".addslashes($text_planta_propiedad)."' ,
                        '".addslashes($text_puerta_propiedad)."' , '".addslashes($text_latitud)."' , '".addslashes($text_altitud)."' , '".addslashes($text_geo_zoom)."',
                        '".addslashes($text_page_title)."' , '".addslashes($auto_slug)."' , '".addslashes($text_slug)."' , '".addslashes($text_meta_keywords)."',
                        '".addslashes($text_meta_robots)."' , '".addslashes($text_meta_description)."' , '".addslashes($textarea_scripts_header)."' ,
                        '".addslashes($textarea_scripts_body)."' , '".addslashes($status)."' , '".addslashes($position)."'
                        )";
            $sql = "INSERT INTO tmp_dynamic_rooms
(id,language,text_title,text_subtitle,text_ref,dynamic_agencia,dynamic_usuario,dynamic_taxonomy,dynamic_taxonomy_group,dynamic_geocountry,dynamic_georegion,dynamic_geocity,
dynamic_geolocality,dynamic_geodistrict,dynamic_accion,dynamic_gallery_inmo,text_calle,text_numero_calle,text_bloque_propiedad,text_puerta_propiedad,text_planta_propiedad,
text_latitud,text_altitud,text_geo_zoom,text_page_title,auto_slug,text_slug,text_meta_keywords,text_meta_robots,text_meta_description,textarea_scripts_header,textarea_scripts_body,
status,position) VALUES ".implode(",",$inserts_rooms).";";
            //echo $sql ."<br>";
            if (!$db->query($sql)){
                $error = $db->error();
                //p_($error);
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if

            $language = 'fr';
            $inserts_rooms = array();
            $inserts_rooms[] = "('".$id."','".addslashes($language)."','".addslashes($text_title)."' ,'".addslashes($text_subtitle)."',
                        '".addslashes($text_ref)."' ,'".addslashes($dynamic_agencia)."','".addslashes($dynamic_usuario)."' ,'".addslashes($dynamic_taxonomy)."',
                        '".addslashes($dynamic_taxonomy_group)."' , '".addslashes($dynamic_geocountry)."' , '".addslashes($dynamic_georegion)."' ,
                        '".addslashes($dynamic_geocity)."' , '".addslashes($dynamic_geolocality)."' , '".addslashes($dynamic_geodistrict)."' ,
                        '".addslashes($dynamic_accion)."' , '".addslashes($dynamic_gallery_inmo)."' , '".addslashes($text_calle)."' , '".addslashes($text_numero_calle)."' ,
                        '".addslashes($text_bloque_propiedad)."' , '".addslashes($text_planta_propiedad)."' ,
                        '".addslashes($text_puerta_propiedad)."' , '".addslashes($text_latitud)."' , '".addslashes($text_altitud)."' , '".addslashes($text_geo_zoom)."',
                        '".addslashes($text_page_title)."' , '".addslashes($auto_slug)."' , '".addslashes($text_slug)."' , '".addslashes($text_meta_keywords)."',
                        '".addslashes($text_meta_robots)."' , '".addslashes($text_meta_description)."' , '".addslashes($textarea_scripts_header)."' ,
                        '".addslashes($textarea_scripts_body)."' , '".addslashes($status)."' , '".addslashes($position)."'
                        )";
            $sql = "INSERT INTO tmp_dynamic_rooms
(id,language,text_title,text_subtitle,text_ref,dynamic_agencia,dynamic_usuario,dynamic_taxonomy,dynamic_taxonomy_group,dynamic_geocountry,dynamic_georegion,dynamic_geocity,
dynamic_geolocality,dynamic_geodistrict,dynamic_accion,dynamic_gallery_inmo,text_calle,text_numero_calle,text_bloque_propiedad,text_puerta_propiedad,text_planta_propiedad,
text_latitud,text_altitud,text_geo_zoom,text_page_title,auto_slug,text_slug,text_meta_keywords,text_meta_robots,text_meta_description,textarea_scripts_header,textarea_scripts_body,
status,position) VALUES ".implode(",",$inserts_rooms).";";
            if (!$db->query($sql)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            $language = 'en';
            $inserts_rooms = array();
            $inserts_rooms[] = "('".$id."','".addslashes($language)."','".addslashes($text_title)."' ,'".addslashes($text_subtitle)."',
                        '".addslashes($text_ref)."' ,'".addslashes($dynamic_agencia)."','".addslashes($dynamic_usuario)."' ,'".addslashes($dynamic_taxonomy)."',
                        '".addslashes($dynamic_taxonomy_group)."' , '".addslashes($dynamic_geocountry)."' , '".addslashes($dynamic_georegion)."' ,
                        '".addslashes($dynamic_geocity)."' , '".addslashes($dynamic_geolocality)."' , '".addslashes($dynamic_geodistrict)."' ,
                        '".addslashes($dynamic_accion)."' , '".addslashes($dynamic_gallery_inmo)."' , '".addslashes($text_calle)."' , '".addslashes($text_numero_calle)."' ,
                        '".addslashes($text_bloque_propiedad)."' , '".addslashes($text_planta_propiedad)."' ,
                        '".addslashes($text_puerta_propiedad)."' , '".addslashes($text_latitud)."' , '".addslashes($text_altitud)."' , '".addslashes($text_geo_zoom)."',
                        '".addslashes($text_page_title)."' , '".addslashes($auto_slug)."' , '".addslashes($text_slug)."' , '".addslashes($text_meta_keywords)."',
                        '".addslashes($text_meta_robots)."' , '".addslashes($text_meta_description)."' , '".addslashes($textarea_scripts_header)."' ,
                        '".addslashes($textarea_scripts_body)."' , '".addslashes($status)."' , '".addslashes($position)."'
                        )";
            $sql = "INSERT INTO tmp_dynamic_rooms
(id,language,text_title,text_subtitle,text_ref,dynamic_agencia,dynamic_usuario,dynamic_taxonomy,dynamic_taxonomy_group,dynamic_geocountry,dynamic_georegion,dynamic_geocity,
dynamic_geolocality,dynamic_geodistrict,dynamic_accion,dynamic_gallery_inmo,text_calle,text_numero_calle,text_bloque_propiedad,text_puerta_propiedad,text_planta_propiedad,
text_latitud,text_altitud,text_geo_zoom,text_page_title,auto_slug,text_slug,text_meta_keywords,text_meta_robots,text_meta_description,textarea_scripts_header,textarea_scripts_body,
status,position) VALUES ".implode(",",$inserts_rooms).";";
            if (!$db->query($sql)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if

            $language = 'ru';
            $inserts_rooms = array();
            $inserts_rooms[] = "('".$id."','".addslashes($language)."','".addslashes($text_title)."' ,'".addslashes($text_subtitle)."',
                        '".addslashes($text_ref)."' ,'".addslashes($dynamic_agencia)."','".addslashes($dynamic_usuario)."' ,'".addslashes($dynamic_taxonomy)."',
                        '".addslashes($dynamic_taxonomy_group)."' , '".addslashes($dynamic_geocountry)."' , '".addslashes($dynamic_georegion)."' ,
                        '".addslashes($dynamic_geocity)."' , '".addslashes($dynamic_geolocality)."' , '".addslashes($dynamic_geodistrict)."' ,
                        '".addslashes($dynamic_accion)."' , '".addslashes($dynamic_gallery_inmo)."' , '".addslashes($text_calle)."' , '".addslashes($text_numero_calle)."' ,
                        '".addslashes($text_bloque_propiedad)."' , '".addslashes($text_planta_propiedad)."' ,
                        '".addslashes($text_puerta_propiedad)."' , '".addslashes($text_latitud)."' , '".addslashes($text_altitud)."' , '".addslashes($text_geo_zoom)."',
                        '".addslashes($text_page_title)."' , '".addslashes($auto_slug)."' , '".addslashes($text_slug)."' , '".addslashes($text_meta_keywords)."',
                        '".addslashes($text_meta_robots)."' , '".addslashes($text_meta_description)."' , '".addslashes($textarea_scripts_header)."' ,
                        '".addslashes($textarea_scripts_body)."' , '".addslashes($status)."' , '".addslashes($position)."'
                        )";
            $sql = "INSERT INTO tmp_dynamic_rooms
(id,language,text_title,text_subtitle,text_ref,dynamic_agencia,dynamic_usuario,dynamic_taxonomy,dynamic_taxonomy_group,dynamic_geocountry,dynamic_georegion,dynamic_geocity,
dynamic_geolocality,dynamic_geodistrict,dynamic_accion,dynamic_gallery_inmo,text_calle,text_numero_calle,text_bloque_propiedad,text_puerta_propiedad,text_planta_propiedad,
text_latitud,text_altitud,text_geo_zoom,text_page_title,auto_slug,text_slug,text_meta_keywords,text_meta_robots,text_meta_description,textarea_scripts_header,textarea_scripts_body,
status,position) VALUES ".implode(",",$inserts_rooms).";";
            if (!$db->query($sql)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            */
            //}// end foreach

            //p_($languages);
            foreach($languages as $language){
                $sql="INSERT INTO tmp_dynamic_rooms (id,language,text_title,auto_slug,status,id_avantio) VALUES (".$id.",'".$language."','".addslashes($text_title)."','".url_semantica($text_title)."','ACTIVED',1) ON DUPLICATE KEY UPDATE text_title='".addslashes($text_title)."', auto_slug='".url_semantica($text_title)."',status='ACTIVED',id_avantio = 1 ;";
                if (!$db->query($sql)){
                    $error = $db->error();
                    echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                    die();
                }// end if
            }// end foreach

            /*
            $sql="INSERT INTO tmp_dynamic_rooms (id,language,text_title,auto_slug,status,id_avantio) VALUES (".$id.",'en','".addslashes($text_title)."','".url_semantica($text_title)."','ACTIVED',1) ON DUPLICATE KEY UPDATE text_title='".addslashes($text_title)."', auto_slug='".url_semantica($text_title)."',status='ACTIVED',id_avantio = 1 ;";
            if (!$db->query($sql)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            */

            /*
            $sql="INSERT INTO tmp_dynamic_rooms (id,language,text_title,auto_slug,status) VALUES (".$id.",'es','".addslashes($text_title)."','".url_semantica($text_title)."','ACTIVED') ON DUPLICATE KEY UPDATE text_title='".addslashes($text_title)."', auto_slug='".url_semantica($text_title)."',status='ACTIVED' ;";
            $db->set_db($sql);
            if(!empty($db->errores))    die("## ACCOMODATIONS TO DYNAMIC_ROOMS ## ERROR DE BASE DE DATOS ##\n[".$sql."]\n".print_r($db->errores,1)."\n");
            $sql="INSERT INTO tmp_dynamic_rooms (id,language,text_title,auto_slug,status) VALUES (".$id.",'fr','".addslashes($text_title)."','".url_semantica($text_title)."','ACTIVED') ON DUPLICATE KEY UPDATE text_title='".addslashes($text_title)."', auto_slug='".url_semantica($text_title)."',status='ACTIVED' ;";
            $db->set_db($sql);
            if(!empty($db->errores))    die("## ACCOMODATIONS TO DYNAMIC_ROOMS ## ERROR DE BASE DE DATOS ##\n[".$sql."]\n".print_r($db->errores,1)."\n");
            $sql="INSERT INTO tmp_dynamic_rooms (id,language,text_title,auto_slug,status) VALUES (".$id.",'en','".addslashes($text_title)."','".url_semantica($text_title)."','ACTIVED') ON DUPLICATE KEY UPDATE text_title='".addslashes($text_title)."', auto_slug='".url_semantica($text_title)."',status='ACTIVED' ;";
            $db->set_db($sql);
            if(!empty($db->errores))    die("## ACCOMODATIONS TO DYNAMIC_ROOMS ## ERROR DE BASE DE DATOS ##\n[".$sql."]\n".print_r($db->errores,1)."\n");
            $sql="INSERT INTO tmp_dynamic_rooms (id,language,text_title,auto_slug,status) VALUES (".$id.",'ru','".addslashes($text_title)."','".url_semantica($text_title)."','ACTIVED') ON DUPLICATE KEY UPDATE text_title='".addslashes($text_title)."', auto_slug='".url_semantica($text_title)."',status='ACTIVED' ;";
            $db->set_db($sql);
            if(!empty($db->errores))    die("## ACCOMODATIONS TO DYNAMIC_ROOMS ## ERROR DE BASE DE DATOS ##\n[".$sql."]\n".print_r($db->errores,1)."\n");
            */

        }
        $sql="RENAME TABLE dynamic_rooms TO dynamic_rooms_back, tmp_dynamic_rooms TO dynamic_rooms, dynamic_rooms_back TO tmp_dynamic_rooms;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if


        #ACCOMODATIONS EXTRAS
        $sql="DROP TABLE IF EXISTS avantio_accomodations_extras_tmp;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $sql="CREATE TABLE avantio_accomodations_extras_tmp LIKE avantio_accomodations_extras;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        /*
        foreach($xml->Accommodation as $accommodation){
            # id and reference
            $id = intval($accommodation->AccommodationId);
            $text_title=(string)$accommodation->AccommodationName;
            $temp = explode(" ",$text_title,2);
        */

        $inserts=array();
        $anyo_actual=intval(date("Y"));
        foreach($xml->Accommodation as $accommodation){
            $avantio_accomodations=intval($accommodation->AccommodationId);
            //p_($accommodation->Features->ExtrasAndServices->SpecialServices->SpecialService);
            if (!$accommodation->Features->ExtrasAndServices->SpecialServices->SpecialService) continue;
            foreach($accommodation->Features->ExtrasAndServices->SpecialServices->SpecialService as $service){
                $dynamic_services=intval($service->Code);
                $checkbox_included=((string)$service->IncludedInPrice == 'true')?1:0;
                $price=intval($service->AdditionalPrice->Quantity);
                $price_unit=(string)$service->AdditionalPrice->Unit;
                $price_children=intval($service->AdditionalPriceChildren->Quantity);
                $price_children_unit=($price_children > 0) ? (string)$service->AdditionalPriceChildren->Unit : 'RESERVA';
                $checkbox_pago_en_reserva=((string)$service->PayTime=='LLEGADA')?0:1;
                $checkbox_opcional=((string)$service->Application=='OPCIONAL')?1:0;
                $text_type=(string)$service->Type;
                $text_parking_location=(string)$service->ParkingLocation;
                $number_limit_weight=(string)$service->LimitWeight;
                $inserts[]="('".$avantio_accomodations."','".addslashes($dynamic_services)."','".addslashes($checkbox_included)."','".addslashes($price)."',
                        '".$price_unit."','".addslashes($price_children)."','".addslashes($price_children_unit)."','".addslashes($checkbox_pago_en_reserva)."',
                        '".$checkbox_opcional."','".addslashes($text_type)."','".addslashes($text_parking_location)."','".intval($number_limit_weight)."')";
                if(count($inserts)>=$avantio_credentials['INSERT_COUNT']){
                    $sql="INSERT INTO avantio_accomodations_extras_tmp 
                            (avantio_accomodations,dynamic_services,checkbox_included,price,
                            price_unit,price_children,price_children_unit,checkbox_pago_en_reserva,
                            checkbox_opcional,text_type,text_parking_location,number_limit_weight)
                             VALUES ".implode(",",$inserts).";";
                    if (!$db->query($sql)){
                        $error = $db->error();
                        echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                        die();
                    }// end if
                    $inserts=array();
                }
            }

            if (!$accommodation->Features->ExtrasAndServices->CommonServices->CommonService) continue;
            foreach($accommodation->Features->ExtrasAndServices->CommonServices->CommonService as $service){
                $dynamic_services=intval($service->Code);
                $checkbox_included=((string)$service->IncludedInPrice == 'true')?1:0;
                $price=intval($service->AdditionalPrice->Quantity);
                $price_unit=(string)$service->AdditionalPrice->Unit;
                $price_children=intval($service->AdditionalPriceChildren->Quantity);
                $price_children_unit=($price_children > 0) ? (string)$service->AdditionalPriceChildren->Unit : 'RESERVA';
                $checkbox_pago_en_reserva=((string)$service->PayTime=='LLEGADA')?0:1;
                $checkbox_opcional=((string)$service->Application=='OPCIONAL')?1:0;
                $text_type=(string)$service->Type;
                $text_parking_location=(string)$service->ParkingLocation;
                $number_limit_weight=(string)$service->LimitWeight;
                $inserts[]="('".$avantio_accomodations."','".addslashes($dynamic_services)."','".addslashes($checkbox_included)."','".addslashes($price)."',
                        '".$price_unit."','".addslashes($price_children)."','".addslashes($price_children_unit)."','".addslashes($checkbox_pago_en_reserva)."',
                        '".$checkbox_opcional."','".addslashes($text_type)."','".addslashes($text_parking_location)."','".intval($number_limit_weight)."')";
                if(count($inserts)>=$avantio_credentials['INSERT_COUNT']){
                    $sql="INSERT INTO avantio_accomodations_extras_tmp 
                            (avantio_accomodations,dynamic_services,checkbox_included,price,
                            price_unit,price_children,price_children_unit,checkbox_pago_en_reserva,
                            checkbox_opcional,text_type,text_parking_location,number_limit_weight)
                             VALUES ".implode(",",$inserts).";";
                    if (!$db->query($sql)){
                        $error = $db->error();
                        echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                        die();
                    }// end if
                    $inserts=array();
                }
            }
        }

        if(!empty($inserts)){
            $sql="INSERT INTO avantio_accomodations_extras_tmp 
                    (avantio_accomodations,dynamic_services,checkbox_included,price,
                    price_unit,price_children,price_children_unit,checkbox_pago_en_reserva,
                    checkbox_opcional,text_type,text_parking_location,number_limit_weight)
                     VALUES ".implode(",",$inserts).";";
            if (!$db->query($sql)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            $inserts=array();
        }
        $sql="RENAME TABLE avantio_accomodations_extras TO avantio_accomodations_extras_back, avantio_accomodations_extras_tmp TO avantio_accomodations_extras, avantio_accomodations_extras_back TO avantio_accomodations_extras_tmp;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        # ACCOMODATIONS LOCATIONS
        $sql="DROP TABLE IF EXISTS avantio_accomodations_locations_tmp;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $sql="CREATE TABLE avantio_accomodations_locations_tmp LIKE avantio_accomodations_locations;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $inserts=array();
        $anyo_actual=intval(date("Y"));
        foreach($xml->Accommodation as $accommodation){
            $avantio_accomodations=intval($accommodation->AccommodationId);
            $loc_where=(string)$accommodation->Features->Location->LocationDescription->Where;
            $loc_howto=(string)$accommodation->Features->Location->LocationDescription->Howto;
            $loc_desc1=(string)$accommodation->Features->Location->LocationDescription->Description1;
            $loc_desc2=(string)$accommodation->Features->Location->LocationDescription->Description2;

            $beach_name=(string)$accommodation->Features->Location->LocationDistances->BeachDistance->Name;
            $beach_dist=floatval($accommodation->Features->Location->LocationDistances->BeachDistance->Value);
            $beach_unit=(string)$accommodation->Features->Location->LocationDistances->BeachDistance->Unit;
            $beach_dist=(strtoupper($beach_unit)=='KM')? intval( 1000*$beach_dist ) : intval($beach_dist);

            $golf_name=(string)$accommodation->Features->Location->LocationDistances->GolfDistance->Name;
            $golf_dist=floatval($accommodation->Features->Location->LocationDistances->GolfDistance->Value);
            $golf_unit=(string)$accommodation->Features->Location->LocationDistances->GolfDistance->Unit;
            $golf_dist=(strtoupper($golf_unit)=='KM')? intval( 1000*$golf_dist ) : intval($golf_dist);

            $city_name=(string)$accommodation->Features->Location->LocationDistances->CityDistance->Name;
            $city_dist=floatval($accommodation->Features->Location->LocationDistances->CityDistance->Value);
            $city_unit=(string)$accommodation->Features->Location->LocationDistances->CityDistance->Unit;
            $city_dist=(strtoupper($city_unit)=='KM')? intval( 1000*$city_dist ) : intval($city_dist);

            $super_name=(string)$accommodation->Features->Location->LocationDistances->SuperMarketDistance->Name;
            $super_dist=floatval($accommodation->Features->Location->LocationDistances->SuperMarketDistance->Value);
            $super_unit=(string)$accommodation->Features->Location->LocationDistances->SuperMarketDistance->Unit;
            $super_dist=(strtoupper($super_unit)=='KM')? intval( 1000*$super_dist ) : intval($super_dist);

            $airport_name=(string)$accommodation->Features->Location->LocationDistances->AirportDistance->Name;
            $airport_dist=floatval($accommodation->Features->Location->LocationDistances->AirportDistance->Value);
            $airport_unit=(string)$accommodation->Features->Location->LocationDistances->AirportDistance->Unit;
            $airport_dist=(strtoupper($airport_unit)=='KM')? intval( 1000*$airport_dist ) : intval($airport_dist);

            $train_name=(string)$accommodation->Features->Location->LocationDistances->TrainStationDistance->Name;
            $train_dist=floatval($accommodation->Features->Location->LocationDistances->TrainStationDistance->Value);
            $train_unit=(string)$accommodation->Features->Location->LocationDistances->TrainStationDistance->Unit;
            $train_dist=(strtoupper($train_unit)=='KM')? intval( 1000*$train_dist ) : intval($train_dist);

            $bus_name=(string)$accommodation->Features->Location->LocationDistances->StopBusDistance->Name;
            $bus_dist=floatval($accommodation->Features->Location->LocationDistances->StopBusDistance->Value);
            $bus_unit=(string)$accommodation->Features->Location->LocationDistances->StopBusDistance->Unit;
            $bus_dist=(strtoupper($bus_unit)=='KM')? intval( 1000*$bus_dist ) : intval($bus_dist);

            $view_to_beach=( (string)$accommodation->Features->Location->LocationViews->ViewToBeach == 'true' ) ? 1:0;
            $view_to_swimming_pool=( (string)$accommodation->Features->Location->LocationViews->ViewToSwimmingPool == 'true' ) ? 1:0;
            $view_to_golf=( (string)$accommodation->Features->Location->LocationViews->ViewToGolf == 'true' ) ? 1:0;
            $view_to_garden=( (string)$accommodation->Features->Location->LocationViews->ViewToGarden == 'true' ) ? 1:0;
            $view_to_river=( (string)$accommodation->Features->Location->LocationViews->ViewToRiver == 'true' ) ? 1:0;
            $view_to_mountain=( (string)$accommodation->Features->Location->LocationViews->ViewToMountain == 'true' ) ? 1:0;
            $view_to_lake=( (string)$accommodation->Features->Location->LocationViews->ViewToLake == 'true' ) ? 1:0;
            $first_line_beach=( (string)$accommodation->Features->Location->FirstBeachLine == 'true' ) ? 1:0;
            $first_line_golf=( (string)$accommodation->Features->Location->FirstGolfLine == 'true' ) ? 1:0;

            $inserts[]="('".$avantio_accomodations."','".addslashes($loc_where)."','".addslashes($loc_howto)."','".addslashes($loc_desc1)."','".addslashes($loc_desc2)."',
                    '".addslashes($beach_name)."','".addslashes($beach_dist)."','".addslashes($golf_name)."','".addslashes($golf_dist)."',
                    '".addslashes($city_name)."','".addslashes($city_dist)."','".addslashes($super_name)."','".addslashes($super_dist)."',
                    '".addslashes($airport_name)."','".addslashes($airport_dist)."','".addslashes($train_name)."','".addslashes($train_dist)."',
                    '".addslashes($bus_name)."','".addslashes($bus_dist)."','".intval($view_to_beach)."','".intval($view_to_swimming_pool)."',
                    '".intval($view_to_golf)."','".intval($view_to_garden)."','".intval($view_to_river)."','".intval($view_to_mountain)."',
                    '".intval($view_to_lake)."','".intval($first_line_beach)."','".intval($first_line_golf)."')";
            if(count($inserts)>=$avantio_credentials['INSERT_COUNT']){
                $sql="INSERT INTO avantio_accomodations_locations_tmp 
                        (avantio_accomodations,loc_where,loc_howto,loc_desc1,loc_desc2,
                        beach_name,beach_dist,golf_name,golf_dist,
                        city_name,city_dist,super_name,super_dist,
                        airport_name,airport_dist,train_name,train_dist,
                        bus_name,bus_dist,view_to_beach,view_to_swimming_pool,
                        view_to_golf,view_to_garden,view_to_river,view_to_mountain,
                        view_to_lake,first_line_beach,first_line_golf)
                         VALUES ".implode(",",$inserts).";";
                if (!$db->query($sql)){
                    $error = $db->error();
                    echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                    die();
                }// end if
                $inserts=array();
            }

        }
        if(!empty($inserts)){
            $sql="INSERT INTO avantio_accomodations_locations_tmp 
                    (avantio_accomodations,loc_where,loc_howto,loc_desc1,loc_desc2,
                    beach_name,beach_dist,golf_name,golf_dist,
                    city_name,city_dist,super_name,super_dist,
                    airport_name,airport_dist,train_name,train_dist,
                    bus_name,bus_dist,view_to_beach,view_to_swimming_pool,
                    view_to_golf,view_to_garden,view_to_river,view_to_mountain,
                    view_to_lake,first_line_beach,first_line_golf)
                     VALUES ".implode(",",$inserts).";";
            if (!$db->query($sql)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            $inserts=array();
        }
        $sql="RENAME TABLE avantio_accomodations_locations TO avantio_accomodations_locations_back, avantio_accomodations_locations_tmp TO avantio_accomodations_locations, avantio_accomodations_locations_back TO avantio_accomodations_locations_tmp;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        #ACCOMODATIONS NEAREST
        $sql="DROP TABLE IF EXISTS avantio_accomodations_nearest_places_tmp;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $sql="CREATE TABLE avantio_accomodations_nearest_places_tmp LIKE avantio_accomodations_nearest_places;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $inserts = array();
        $anyo_actual=intval(date("Y"));
        foreach($xml->Accommodation as $accommodation){
            $avantio_accomodations=intval($accommodation->AccommodationId);
            if (!$accommodation->Features->Location->NearestPlaces->NearestPlace) continue;
            foreach($accommodation->Features->Location->NearestPlaces->NearestPlace as $place){
                $place_type=(string)$place->PlaceType;
                $place_name=(string)$place->Name;
                $distance=floatval($place->Value);
                $place_unit=(string)$place->Unit;
                $distance=(strtoupper($place_unit)=='KM')? intval( 1000*$distance ) : intval($distance);
                $inserts[]="('".$avantio_accomodations."','".addslashes($place_type)."','".addslashes($place_name)."','".intval($distance)."')";
                if(count($inserts)>=$avantio_credentials['INSERT_COUNT']){
                    $sql="INSERT INTO avantio_accomodations_nearest_places_tmp 
                            (avantio_accomodations,place_type,place_name,distance)
                             VALUES ".implode(",",$inserts).";";
                    if (!$db->query($sql)){
                        $error = $db->error();
                        echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                        die();
                    }// end if
                    $inserts=array();
                }
            }

        }
        if(!empty($inserts)){
            $sql="INSERT INTO avantio_accomodations_nearest_places_tmp 
                    (avantio_accomodations,place_type,place_name,distance)
                     VALUES ".implode(",",$inserts).";";
            if (!$db->query($sql)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            $inserts=array();
        }
        $sql="RENAME TABLE avantio_accomodations_nearest_places TO avantio_accomodations_nearest_places_back, avantio_accomodations_nearest_places_tmp TO avantio_accomodations_nearest_places, avantio_accomodations_nearest_places_back TO avantio_accomodations_nearest_places_tmp;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

    } // end function



    private function add_two_primary_keys()
    {

        $forge = \Config\Database::forge();
        $forge->addKey('id', TRUE);
        $forge->addKey('language', TRUE);

    } // end function



    private function insertar_actualizar()
    {

        $data = [
            'id'            => "",
            'language'      => "",
            'text_title'    => ""
        ];
        $this->save($data);

    } // end function

}// end class
?>