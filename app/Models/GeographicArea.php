<?php
namespace App\Models;

/**
 * Created by PhpStorm.
 * User: DAVID01
 * Date: 11/07/2021
 * Time: 12:10
 */

use CodeIgniter\Model;

class GeographicArea extends Model{


    protected $DBGroup              = 'tests';

    protected $table                = 'dynamic_geocountry';
    protected $primaryKey           = 'id';
    protected $useAutoIncrement     = true;
    protected $insertID             = 0;
    protected $returnType           = 'array';
    protected $useSoftDeletes       = false;
    protected $protectFields        = true;
    protected $allowedFields = ['accommodation_id', 'occupation_rule_id' , 'fecha' , 'status'];


    // Dates
    protected $useTimestamps        = false;
    protected $dateFormat           = 'datetime';
    protected $createdField         = 'created_at';
    protected $updatedField         = 'updated_at';
    protected $deletedField         = 'deleted_at';

    // Validation
    protected $validationRules      = [];
    protected $validationMessages   = [];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks       = true;
    protected $beforeInsert         = [];
    protected $afterInsert          = [];
    protected $beforeUpdate         = [];
    protected $afterUpdate          = [];
    protected $beforeFind           = [];
    protected $afterFind            = [];
    protected $beforeDelete         = [];
    protected $afterDelete          = [];

    # others
    private $vector_found = array(
        "Not s",
        "Non s",
        "Sin e",
        "Not specified",
        "Sin especificar",
    );



    /**
     * @param $xml
     * @param $avantio_credentials
     * @param $ts
     * @param $ts_referencia
     */
    public function insertGeographicAreas($xml,$avantio_credentials,$ts,$ts_referencia)
    {

        $db = \Config\Database::connect($this->getDBGroup());

        foreach($xml->InternationalizedItem as $country){
            $lang = (string)$country->Language;
            if(!in_array($lang,$avantio_credentials['ACTIVED_LANGUAGES'])) continue;
            $country_name=(string)$country->Countries->Country->Name;
            $country_id=intval($country->Countries->Country->CountryCode);
            # geocountry
            $sql="INSERT INTO dynamic_geocountry (id,language,text_title,status) VALUES ('".$country_id."','".$lang."','".$db->escapeString($country_name)."', 'ACTIVED') ON DUPLICATE KEY UPDATE text_title='".$db->escapeString($country_name)."' ;";
            if (!$db->query($sql)){
               $error = $db->error();
               echo "Error " . $error["code"] . " con la descripción " . $error["message"];
               die();
            }// end if

            foreach($country->Countries->Country->Regions->Region as $region){
                $region_name=(string)$region->Name;
                $region_id=intval($region->RegionCode);
                $sql="INSERT INTO dynamic_georegion (id,language,text_title,dynamic_geocountry,status) VALUES ('".$region_id."','".$lang."','".$db->escapeString($region_name)."','".$country_id."', 'ACTIVED') ON DUPLICATE KEY UPDATE text_title='".$db->escapeString($region_name)."' ;";
                if (!$db->query($sql)){
                    $error = $db->error();
                    echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                    die();
                }// end if
                foreach($region->Cities->City as $city){
                    $city_name=(string)$city->Name;
                    $city_id=intval($city->CityCode);
                    $sql="INSERT INTO dynamic_geocity (id,language,text_title,dynamic_georegion,status) VALUES ('".$city_id."','".$lang."','".$db->escapeString($city_name)."','".$region_id."', 'ACTIVED') ON DUPLICATE KEY UPDATE text_title='".$db->escapeString($city_name)."' ;";
                    if (!$db->query($sql)){
                        $error = $db->error();
                        echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                        die();
                    }// end if
                    foreach($city->Localities->Locality as $locality){
                        $locality_name=(string)$locality->Name;
                        $locality_id=intval($locality->LocalityCode);
                        $sql="INSERT INTO dynamic_geolocality (id,language,text_title,dynamic_geocity,status) VALUES ('".$locality_id."','".$lang."','".$db->escapeString($locality_name)."','".$city_id."', 'ACTIVED') ON DUPLICATE KEY UPDATE text_title='".$db->escapeString($locality_name)."' ;";
                        if (!$db->query($sql)){
                            $error = $db->error();
                            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                            die();
                        }// end if
                        foreach($locality->Districts->District as $district){
                            //echo "distrito: " .(string)$district->Name. "<br>";
                            if(!in_array($district->Name, $this->vector_found)){
                                //echo "distrito correcto: " .(string)$district->Name. "<br>";
                                if(strpos((string)$district->Name,"Sin especificar") !== true && strpos((string)$district->Name,"Not specified") !== true && strpos((string)$district->Name,"Not specified") !== true){
                                //if ((string)$district->Name != "Sin especificar" && (string)$district->Name != "Not specified"){
                                    $district_name = $district->Name;
                                    $district_id=intval($district->DistrictCode);
                                    $district_postal_code=intval($district->PostalCode);
                                    $sql="INSERT INTO dynamic_geodistrict (id,language,text_title,dynamic_geolocality,text_postalcode,status) VALUES ('".$district_id."','".$lang."','".$db->escapeString($district_name)."','".$locality_id."','".$db->escapeString($district_postal_code)."', 'ACTIVED') ON DUPLICATE KEY UPDATE text_title='".$db->escapeString($district_name)."', text_postalcode='".$db->escapeString($district_postal_code)."' ;";
                                    if (!$db->query($sql)){
                                        $error = $db->error();
                                        echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                                        die();
                                    }// end if
                                }// end if
                            } // end if
                        }// end foreach
                    }// end foreach
                }// end foreach
            }// end foreach
        }// end foreach
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




    /**
     * @return string
     */
    public function getDBGroup()
    {
        return $this->DBGroup;
    }


    /**
     * @param string $DBGroup
     */
    public function setDBGroup($DBGroup)
    {
        $this->DBGroup = $DBGroup;
    }


    public function connect()
    {
        $this->db = \Config\Database::connect($this->getDBGroup());
    } // end function



}// end class
?>