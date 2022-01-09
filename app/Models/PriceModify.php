<?php
namespace App\Models;

/**
 * Created by PhpStorm.
 * User: DAVID01
 * Date: 11/07/2021
 * Time: 12:10
 */

use CodeIgniter\Model;

class PriceModify extends Model{

        protected $DBGroup              = 'tests';
    
        protected $table                = 'avantio_pricemodifiers';
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


    public function insertPricesModify($xml,$avantio_credentials,$ts,$ts_referencia)
    {

        $db = \Config\Database::connect($this->getDBGroup());

        $sql="DROP TABLE IF EXISTS avantio_pricemodifiers_tmp;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $sql="CREATE TABLE avantio_pricemodifiers_tmp LIKE avantio_pricemodifiers;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if

        $inserts=array();
        $anyo_actual=intval(date("Y"));

        foreach($xml->PriceModifier as $pricemodifier){

            $id=intval($pricemodifier->Id);
            //if($id=='1544049') print_r($pricemodifier);
            $name=(string)$pricemodifier->Name;
            $ts_finish = 0;
            foreach($pricemodifier->Season as $period){
                //print_r($period);
                $date_finish=false;
                $date_start=(string)$period->StartDate;
                $date_end=(string)$period->EndDate;
                if(isset($period->MaxDate)){
                    $date_finish=(string)$period->MaxDate;
                    $ts_finish=strtotime($date_finish);
                }
                $code=(string)$period->Kind->Code;

                $acumulative=( (string)$period->Kind->IsCumulative == 'false' )?0:1;
                $type= ( (string)$period->DiscountSupplementType == 'percent' ) ? 'tpc':'val';
                $min_nights=intval($period->MinNumberOfNights);
                $max_nights=intval($period->MaxNumberOfNights);
                $amount = floatval($period->Amount);
                $num_dias = inteval_days($date_start,$date_end);
                list($iAnyo,$iMes,$iDia)=explode("-",$date_start);
                for($i=0;$i<=$num_dias;$i++){
                    $ts=mktime(0,0,0,$iMes,$iDia+$i,$iAnyo);

                    if(intval(date("Y",$ts)) > $anyo_actual+2) continue;
                    if(isset($date_finish) && $ts > $ts_finish) {
                        //echo $code."\n";
                        //echo $ts."-".$ts_finsh."-".isset($date_finish);
                        $fecha=date("Y-m-d",$ts);
                        $inserts[]="('".$id."','".$name."','".$fecha."','".$code."','".$acumulative."','".$min_nights."','".$max_nights."','".$type."','".$amount."')";
                        if(count($inserts)>=$avantio_credentials['INSERT_COUNT']){
                            $sql="INSERT INTO avantio_pricemodifiers_tmp (id,name,fecha,code,acumulative,min_nights,max_nights,type,amount) VALUES ".implode(",",$inserts).";";
                            if (!$db->query($sql)){
                                $error = $db->error();
                                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                                die();
                            }// end if
                            $inserts=array();
                        }
                    }


                }
            }

        }
        if(!empty($inserts)){
            $sql="INSERT INTO avantio_pricemodifiers_tmp (id,name,fecha,code,acumulative,min_nights,max_nights,type,amount) VALUES ".implode(",",$inserts).";";
            if (!$db->query($sql)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            $inserts=array();
        }

        $sql="RENAME TABLE avantio_pricemodifiers TO avantio_pricemodifiers_back, avantio_pricemodifiers_tmp TO avantio_pricemodifiers, avantio_pricemodifiers_back TO avantio_pricemodifiers_tmp;";
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