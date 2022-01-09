<?php
namespace App\Models;

/**
 * Created by PhpStorm.
 * User: DAVID01
 * Date: 11/07/2021
 * Time: 12:10
 */

use CodeIgniter\Model;

class Picture extends Model{

    protected $DBGroup              = 'tests';

    protected $table                = 'avantio_accomodations_pictures';
    protected $primaryKey           = 'id';
    protected $useAutoIncrement     = true;
    protected $insertID             = 0;
    protected $returnType           = 'array';
    protected $useSoftDeletes       = false;
    protected $protectFields        = true;
    protected $allowedFields        = [];

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



    public function insertPictures($xml,$avantio_credentials,$ts,$ts_referencia)
    {

        $db = \Config\Database::connect($this->getDBGroup());

        $sql="DROP TABLE IF EXISTS avantio_accomodations_pictures_tmp;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $sql="CREATE TABLE avantio_accomodations_pictures_tmp LIKE avantio_accomodations_pictures;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $inserts               = array();
        $inserts_gallery_title = array("id","language","zip_status","text_title");
        $inserts_gallery_value = array(null,"es",0);
        foreach($xml->Accommodation as $accommodation){
            $avantio_accomodations = intval($accommodation->AccommodationId);
            $count = 0;
            $text_title = "galeria id aocommodations " . $avantio_accomodations;
            array_push($inserts_gallery_value , $text_title);
            foreach($accommodation->Pictures->Picture as $picture){
                $count++;
                $uri_900x600 = (string)$picture->OriginalURI;
                $uri_650x450 = (string)$picture->AdaptedURI;
                $uri_99x66 = (string)$picture->ThumbnailURI;
                # insert avantio acommodations pictures
                $inserts[] = "('".$count."','".$avantio_accomodations."','".addslashes($uri_900x600)."','".addslashes($uri_650x450)."','".addslashes($uri_99x66)."' , '1')" ;
                # insert dynamic gallery
                $image = "image_".$count;
                $text_title = "text_title_image_".$count;
                $text_alt = "text_alt_image_".$count;
                $image_value = addslashes($uri_900x600);
                $text_title_value = addslashes($uri_900x600);
                $text_alt_value = addslashes($uri_900x600);
                # title
                array_push($inserts_gallery_title , $image);
                array_push($inserts_gallery_title , $text_title);
                array_push($inserts_gallery_title , $text_alt);
                # value
                array_push($inserts_gallery_value , $image_value);
                array_push($inserts_gallery_value , $text_title_value);
                array_push($inserts_gallery_value , $text_alt_value);
                if(count($inserts) >= $avantio_credentials['INSERT_COUNT_IMAGES']){
                    # insert avantio_accomodations_pictures_tmp
                    $sql = "INSERT INTO avantio_accomodations_pictures_tmp 
                            (id,avantio_accomodations,uri_900x600,uri_650x450,uri_99x66,id_avantio)
                             VALUES ".implode(",",$inserts).";";
                    if (!$db->query($sql)){
                        $error = $db->error();
                        echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                        die();
                    }// end if
                    # insert dynamic_gallery_inmo
                    /*
                    $sql = " INSERT INTO dynamic_gallery_inmo (".implode(',',$inserts_gallery_title).") VALUES ".implode(',' ,$inserts_gallery_value)."; ";
                    if (!$db->query($sql)){
                        $error = $db->error();
                        echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                        die();
                    }// end if
                    */
                    # clean vectors and initialize vectors
                    $inserts = array();
                    $inserts_gallery_title = array("id","language","zip_status","text_title");
                    $inserts_gallery_value = array(null,"es",0);
                }// end if
            }// end foreach

        }// end foreach
        if(!empty($inserts)){
            $sql = "INSERT INTO avantio_accomodations_pictures_tmp 
                    (id,avantio_accomodations,uri_900x600,uri_650x450,uri_99x66, id_avantio)
                     VALUES ".implode(",",$inserts).";";
            if (!$db->query($sql)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            $inserts = array();
        }// end if
        if (count($inserts_gallery_title) > 4){
            /*
            $sql = " INSERT INTO dynamic_gallery_inmo (".implode(',',$inserts_gallery_title).") VALUES ".implode(',' ,$inserts_gallery_value)."; ";
            if (!$db->query($sql)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            */
        }// end if
        # rename tables
        $sql = "RENAME TABLE avantio_accomodations_pictures TO avantio_accomodations_pictures_back, avantio_accomodations_pictures_tmp TO avantio_accomodations_pictures, avantio_accomodations_pictures_back TO avantio_accomodations_pictures_tmp;";
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