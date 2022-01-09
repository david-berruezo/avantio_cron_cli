<?php
namespace App\Models;

/**
 * Created by PhpStorm.
 * User: DAVID01
 * Date: 11/07/2021
 * Time: 12:10
 */

use CodeIgniter\Model;

class Description extends Model{

    protected $DBGroup              = 'tests';

    protected $table                = 'avantio_accomodations_descriptions';
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



    /**
     * @param $xml
     * @param $avantio_credentials
     * @param $ts
     * @param $ts_referencia
     */
    public function insertDescriptions($xml,$avantio_credentials,$ts,$ts_referencia)
    {

        $db = \Config\Database::connect($this->getDBGroup());

        $sql="DROP TABLE IF EXISTS avantio_accomodations_descriptions_tmp;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $sql="CREATE TABLE avantio_accomodations_descriptions_tmp LIKE avantio_accomodations_descriptions;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $inserts = array(); $services = array(); $update = array();
        foreach($xml->Accommodation as $accommodation){
            $avantio_accomodations = intval($accommodation->AccommodationId);
            foreach($accommodation->InternationalizedItem as $international){
                $language = (string)$international->Language;
                if (in_array($language , $avantio_credentials["ACTIVED_LANGUAGES"])){
                    $description = (string)$international->Description;
                    $description = trim(strip_tags($description));
                    $booking_url = (string)$international->BookingURL;
                    # insert and update
                    $inserts[] = "('".$avantio_accomodations."','".addslashes($language)."','".addslashes($description)."','".addslashes($booking_url)."')";
                    $temp_update = array(
                          "id"            => $avantio_accomodations,
                          "language"      => addslashes($language),
                          "description"   => addslashes($description)
                    );
                    array_push($update , $temp_update);
                    if(count($inserts) >= $avantio_credentials['INSERT_COUNT']){
                        //p_(implode(",",$inserts)) . "<br>";
                        # avantio_accomodations_descriptions_tmp
                        $sql = "INSERT INTO avantio_accomodations_descriptions_tmp 
                            (avantio_accomodations,language,description,booking_url)
                             VALUES ".implode(",",$inserts).";";
                        if (!$db->query($sql)){
                            $error = $db->error();
                            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                            die();
                        }// end if
                        # dynamic_rooms
                        $sql = "update dynamic_rooms set textarea_description = '".addslashes($description)."' where id = $avantio_accomodations and language = '".addslashes($language)."' ";
                        echo $sql ."<br>";
                        if (!$db->query($sql)){
                            $error = $db->error();
                            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                            die();
                        }// end if
                        # inserts
                        $inserts = array();
                    }
                }// end if
                /*
                foreach($international->ExtrasSummary->ObligatoryOrIncluded->Extra as $extra){
                    $code=intval($extra->Code);
                    $name=(string)$extra->Name;
                    $description=(string)$extra->Description;
                    $services[$code][$language][]=array('name'=>$name,'description'=>$description);
                }

                foreach($international->ExtrasSummary->Optional->Extra as $extra){
                    $code=intval($extra->Code);
                    $name=(string)$extra->Name;
                    $description=(string)$extra->Description;
                    $services[$code][$language][]=array('name'=>$name,'description'=>$description);
                }*/
            }
        }
        if(!empty($inserts)){
            # avantio_accomodations_descriptions
            $sql = "INSERT INTO avantio_accomodations_descriptions_tmp 
                    (avantio_accomodations,language,description,booking_url)
                     VALUES ".implode(",",$inserts).";";
            if (!$db->query($sql)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            # dynamic_rooms
            foreach($update as $update_data){
                $avantio_accomodations = $update_data["id"];
                $language = $update_data["language"];
                $description = $update_data["description"];
                $sql = "update dynamic_rooms set textarea_description = '".$description."' where id = $avantio_accomodations and language = '".$language."' ";
                if (!$db->query($sql)){
                    $error = $db->error();
                    echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                    die();
                }// end if
            }// end foreach
            # inserts
            $inserts = array();
        }
        $sql="RENAME TABLE avantio_accomodations_descriptions TO avantio_accomodations_descriptions_back, avantio_accomodations_descriptions_tmp TO avantio_accomodations_descriptions, avantio_accomodations_descriptions_back TO avantio_accomodations_descriptions_tmp;";
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