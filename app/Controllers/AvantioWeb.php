<?php
/**
 * Created by PhpStorm.
 * User: DAVID01
 * Date: 31/07/2021
 * Time: 6:46
 */

namespace App\Controllers;

// php libraries
use ZipArchive;

// app models avantio
use App\Models\Accomodation;
use App\Models\Availability;
use App\Models\Description;
use App\Models\GeographicArea;
use App\Models\Kind;
use App\Models\OcuppationRule;
use App\Models\Picture;
use App\Models\PriceModify;
use App\Models\Rate;
use App\Models\Service;

// app models
use App\Models\Language;

// app libraries
use App\Libraries\CurlRequest;

// model automatization
use App\Models\Dynamic;

// controller
use CodeIgniter\Controller;

class AvantioWeb extends BaseController{

    // avantio
    private $avantio_credentials;
    private $avantio_files;

    // Files Downloaded
    private $files_downloaded      = array();
    private $files_downloaded_temp = array();


    // report
    private $last_insert_id_report = 0;

    // environment group connection
    // private $environmentGroup = "tests";
    // private $environmentGroup = "home";
    // envirenment database test
    private $environmentGroup = "production";


    /**
     * @param null $param
     * @return string
     */
    public function index($param = null , $param2 = null)
    {
        echo "parametro: " . $param . " paramaetro 2 :" . $param2;
        $this->initialize($param2);
        //return view('welcome_message');
    }




    /**
     * @param null $param
     */
    private function initialize($param = null)
    {

        // load helpers
        helper(['funciones','url']);

        show_errors();

        // default
        $this->setAvantioCredentials(null, "test");
        $this->setAvantioFiles();

        // download files
        //$param = "all";
        $this->updateParameters($param);
        $this->deleteXmlFiles();
        $this->downloadXmlFiles();

        // update
        // $this->setFilesDownloadedTemp(null , "windows");
        $this->update();

    } // end function



    /**
     * @param string $tipo
     */
    private function updateParameters($tipo = "all")
    {
        if($tipo == 'all'){
            foreach($this->avantio_files as $kind => $elementos){
                foreach($elementos as $k => $data){
                    $this->avantio_files[$kind][$k]['update'] = 1;
                }
            }
        }elseif($tipo == 'static'){
            foreach($this->avantio_files['static'] as $k => $data){
                $this->avantio_files['static'][$k]['update']=1;
            }
        }elseif($tipo == 'dynamic'){
            foreach($this->avantio_files['dynamic'] as $k => $data){
                $this->avantio_files['dynamic'][$k]['update'] = 1;
            }
        }elseif($tipo == 'prices'){
            foreach($this->avantio_files['prices'] as $k => $data){
                $this->avantio_files['prices'][$k]['update'] = 1;
            }
        }elseif(isset($this->avantio_files['static'][$tipo])){
            $this->avantio_files['static'][$tipo]['update']=1;
        }elseif(isset($this->avantio_files['dynamic'][$tipo])){
            $this->avantio_files['static'][$tipo]['update']=1;
        }elseif(isset($this->avantio_files['prices'][$tipo])){
            $this->avantio_files['static'][$tipo]['update']=1;
        }

        if($tipo=='view_xml')
            $view_xml=true;

        $this->write_report($tipo);


    } // end function



    private function deleteXmlFiles()
    {
        $ts_referencia = intval(date("YmdHis",time() - $this->avantio_credentials['DELETE_TIME']));
        foreach(scandir(__DIR__.'/../xmldata/') as $file){
            if(strpos($file,'.xml') === FALSE) continue;
            list($name,$ts) = explode(".",$file);
            //if($ts_referencia > intval($ts))
            unlink(__DIR__.'/../xmldata/'.$file);
        }
    } // end function


    private function downloadXmlFiles()
    {

        // Load class
        $ch = new CurlRequest();

        foreach($this->avantio_files as $tipo => $elementos){

            foreach($elementos as $k => $data){
                if(!$data['update']) continue;
                $url = $this->avantio_credentials['URL_FEEDS'] . $k . '/' . $this->avantio_credentials['PARTNER_CODE'];
                echo "DOWNLOAD:".$url."\n";
                $ts=date("YmdHis");
                $fdata_zip = $ch->get($url);
                $file_unzip=__DIR__.'/../xmldata/'.$k.'.'.$ts.'.xml';
                $file_zip=$file_unzip.'.zip';
                $fw=fopen($file_zip,'w');
                fwrite($fw,$fdata_zip);
                fclose($fw);
                $zip = new ZipArchive;
                if($zip->open($file_zip)===true){
                    $filename = $zip->getNameIndex(0);
                    copy("zip://".$file_zip."#".$filename, $file_unzip);
                    $zip->close();
                    unlink($file_zip);
                    $this->files_downloaded[$tipo][$k] = $file_unzip;
                }
            }// end foreach
        }// end foreach


        //p_($this->files_downloaded);


    } // end function



    private function update()
    {

        $ts = time();
        $view_xml = false;
        $ts_referencia = intval(date("YmdHis",time() - $this->avantio_credentials['DELETE_TIME']));

        # actived languages
        $languages = new Language();
        $languages->setDBGroup($this->getEnvironmentGroup());
        $languages->connect();
        $actived_languages = $languages->getAll();

        foreach($this->files_downloaded as $tipo => $elementos) {
            foreach ($elementos as $k => $file) {
                echo "PROCESS:" . $tipo . ">>" . $k . ">>" . $file . "\n";
                $xml = simplexml_load_file($file);
                switch ($k) {
                    # SERVICES
                    case 'services':
                        $this->print_xml_avantio($view_xml,$xml);
                        $this->updateServices($xml,$ts,$ts_referencia);
                        break;
                    # GEOGRAPHICAREAS
                    case 'geographicareas':
                        $this->print_xml_avantio($view_xml,$xml);
                        $this->updateGeographicAreas($xml,$ts,$ts_referencia);
                        break;
                    # KINDS
                    case 'kinds':
                        $this->print_xml_avantio($view_xml,$xml);
                        $this->updateKinds($xml,$ts,$ts_referencia);
                        break;
                    # OCCUPATION RULES
                    case 'occupationalrules':
                        $this->print_xml_avantio($view_xml,$xml);
                        $this->updateOcupationRules($xml,$ts,$ts_referencia);
                        break;
                    # AVAILABILITIES
                    case 'availabilities':
                        $this->print_xml_avantio($view_xml,$xml);
                        $this->updateAvalability($xml,$ts,$ts_referencia);
                        break;
                    # RATES
                    case 'rates':
                        $this->print_xml_avantio($view_xml,$xml);
                        $this->updateRates($xml,$ts,$ts_referencia);
                        break;
                    # PRICEMODIFIERS
                    case 'pricemodifiers':
                        $this->print_xml_avantio($view_xml,$xml);
                        $this->updatePriceModify($xml,$ts,$ts_referencia);
                        break;
                    # ACCOMODATIONS
                    case 'accommodations':
                        $this->print_xml_avantio($view_xml,$xml);
                        $this->updateAccomodation($xml,$ts,$ts_referencia,$actived_languages);
                        break;
                    # DESCRIPTIONS # PICTURES
                    case 'descriptions':
                        $this->print_xml_avantio($view_xml,$xml);
                        $this->updateDescription($xml,$ts,$ts_referencia);
                        $this->updatePicture($xml,$ts,$ts_referencia);
                        break;

                }// end switch
            }// end foreach
        }// end foreach
    } // end function


    private function print_xml_avantio($view_xml,$xml)
    {
        if ($view_xml)
            print_r($xml);

    } // end function



    /**
     * @param $xml
     */
    private function updateServices($xml,$ts,$ts_referencia)
    {
        $service = new Service();
        $service->setDBGroup($this->getEnvironmentGroup());
        $service->insertServices($xml,$this->getAvantioCredentials(),$ts,$ts_referencia);
        $this->write_report_historico("services");
    } // end function


    private function updateGeographicAreas($xml,$ts,$ts_referencia)
    {
        $geographicArea = new GeographicArea();
        $geographicArea->setDBGroup($this->getEnvironmentGroup());
        $geographicArea->insertGeographicAreas($xml,$this->getAvantioCredentials(),$ts,$ts_referencia);
        $this->write_report_historico("geographicareas");
    } // end function

    private function updateKinds($xml,$ts,$ts_referencia)
    {
        $kinds = new Kind();
        $kinds->setDBGroup($this->getEnvironmentGroup());
        $kinds->insertKinds($xml,$this->getAvantioCredentials(),$ts,$ts_referencia);
        $this->write_report_historico("kinds");
    } // end function


    private function updateOcupationRules($xml,$ts,$ts_referencia)
    {
        $ocupationRules = new OcuppationRule();
        $ocupationRules->setDBGroup($this->getEnvironmentGroup());
        $ocupationRules->insertOcuppationRules($xml,$this->getAvantioCredentials(),$ts,$ts_referencia);
        $this->write_report_historico("occupationalrules");
    } // end function


    private function updateAvalability($xml,$ts,$ts_referencia)
    {
        $availability = new Availability();
        $availability->setDBGroup($this->getEnvironmentGroup());
        $availability->insertAvailabilities($xml,$this->getAvantioCredentials(),$ts,$ts_referencia);
        $this->write_report_historico("availabilities");
    } // end function


    private function updateRates($xml,$ts,$ts_referencia)
    {
        $rate = new Rate();
        $rate->setDBGroup($this->getEnvironmentGroup());
        $rate->insertRates($xml,$this->getAvantioCredentials(),$ts,$ts_referencia);
        $this->write_report_historico("rates");
    } // end function


    private function updatePriceModify($xml,$ts,$ts_referencia)
    {
        $priceModify = new PriceModify();
        $priceModify->setDBGroup($this->getEnvironmentGroup());
        $priceModify->insertPricesModify($xml,$this->getAvantioCredentials(),$ts,$ts_referencia);
        $this->write_report_historico("pricemodifiers");
    } // end function


    private function updateAccomodation($xml,$ts,$ts_referencia,$actived_languages)
    {
        $accomodation = new Accomodation();
        $accomodation->setDBGroup($this->getEnvironmentGroup());
        $accomodation->insertAccomodations($xml,$this->getAvantioCredentials(),$ts,$ts_referencia,$actived_languages);
        $this->write_report_historico("accommodations");
    } // end function


    private function updateDescription($xml,$ts,$ts_referencia)
    {
        $description = new Description();
        $description->setDBGroup($this->getEnvironmentGroup());
        $description->insertDescriptions($xml,$this->getAvantioCredentials(),$ts,$ts_referencia);
        $this->write_report_historico("descriptions");
    } // end function

    private function updatePicture($xml,$ts,$ts_referencia)
    {
        $picture = new Picture();
        $picture->setDBGroup($this->getEnvironmentGroup());
        $picture->insertPictures($xml,$this->getAvantioCredentials(),$ts,$ts_referencia);
        $this->write_report_historico("descriptions");
    } // end function


    /**
     * @param $tipo_report
     */
    private function write_report($tipo_report)
    {
        $db = \Config\Database::connect('tests');

        /*
        $id = null;
        $fecha = date('Y-m-d H:i:s');
        $sql="INSERT INTO avantio_report (id,parametro_report,fecha) VALUES ('".$id."' , '".$db->escapeString($tipo_report)."' ,'" . $fecha . "' ) ;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if
        $this->setLastInsertIdReport($db->insertID());
        */

    } // end function


    /**
     * @param $fichero_key
     */
    private function write_report_historico($fichero_key)
    {

        /*
        $ficheros = array(
            "geographicareas"   => "geographicareas.xml",
            "services"          => "services.xml",
            "kinds"             => "kinds.xml",
            "accommodations"    => "accommodations.xml",
            "descriptions"      => "descriptions.xml",
            "availabilities"    => "availabilities.xml",
            "rates"             => "rates.xml",
            "occupationalrules" => "occupationalrules.xml",
            "pricemodifiers"    => "pricemodifiers.xml"
        );

        $db = \Config\Database::connect('tests');

        $id = null;
        $fichero = $ficheros[$fichero_key];
        $id_avantio_report = $this->getLastInsertIdReport();
        $sql="INSERT INTO avantio_report_historico (id,id_avantio_report,fichero) VALUES ('".$id."' , '" . $id_avantio_report . "', '".$db->escapeString($fichero)."'  ) ;";
        if (!$db->query($sql)){
            $error = $db->error();
            echo "Error " . $error["code"] . " con la descripción " . $error["message"];
            die();
        }// end if
        */

    } // end function



    /**
     * @return array
     */
    public function getFilesDownloadedTemp()
    {
        return $this->files_downloaded_temp;
    }


    /**
     * @param array $files_downloaded_temp
     */
    public function setFilesDownloadedTemp($files_downloaded_temp , $system)
    {
        if (!$files_downloaded_temp){
            if ($system == "linux"){

            }else if($system == "windows"){
                $this->files_downloaded = array(
                    "static" => Array(
                        //"geographicareas" => "C:\htdocs\avantio_cron_cli\app\Controllers/../xmldata/geographicareas.20210715044106.xml",
                        //"services"        => "C:\htdocs\avantio_cron_cli\app\Controllers/../xmldata/services.20210715044106.xml",
                        //"kinds"           => "C:\htdocs\avantio_cron_cli\app\Controllers/../xmldata/kinds.20210715044106.xml"
                    ),
                    "dynamic" => array(
                        //"accommodations" => "C:\htdocs\avantio_cron_cli\app\Controllers/../xmldata/accommodations.20210715044106.xml",
                        //"descriptions"   => "C:\htdocs\avantio_cron_cli\app\Controllers/../xmldata/descriptions.20210711122105.xml"
                        "descriptions"   => "C:\htdocs\avantio_cron_cli\app\Controllers/../xmldata/descriptions.20210711205936.xml"
                    ),
                    "prices" => array(
                        //"availabilities"    => "C:\htdocs\avantio_cron_cli\app\Controllers/../xmldata/availabilities.20210715044107.xml",
                        //"rates"             => "C:\htdocs\avantio_cron_cli\app\Controllers/../xmldata/rates.20210715044107.xml",
                        //"occupationalrules" => "C:\htdocs\avantio_cron_cli\app\Controllers/../xmldata/occupationalrules.20210715044107.xml",
                        //"pricemodifiers"    => "C:\htdocs\avantio_cron_cli\app\Controllers/../xmldata/pricemodifiers.20210715044107.xml",
                    )
                );
            }// end if

        }// end if

        $this->files_downloaded_temp = $files_downloaded_temp;

    }// end function



    /**
     * @return mixed
     */
    public function getAvantioCredentials()
    {
        return $this->avantio_credentials;
    }


    /**
     * @param mixed $avantio_credentials
     */
    public function setAvantioCredentials($avantio_credentials = null, $mode)
    {


        # active languanges
        $language = new Language();
        $language->setDBGroup($this->getEnvironmentGroup());
        $language->connect();

        # data
        if(empty($avantio_credentials))
            


        $this->avantio_credentials = $avantio_credentials;

        //p_($this->avantio_credentials);
        //die();

    }


    /**
     * @return mixed
     */
    public function getAvantioFiles()
    {
        return $this->avantio_files;
    }

    /**
     * @param mixed $avantio_files
     */
    public function setAvantioFiles($avantio_files = null)
    {
        if(empty($avantio_files))
            $avantio_files = array(
                'static'=>array(
                    'geographicareas' => array('update'=>0),
                    'services' => array('update'=>0),
                    'kinds' => array('update'=>0),
                ),
                'dynamic'=>array(
                    'accommodations' => array('update'=>1),
                    'descriptions' 	=> array('update'=>1),
                ),
                'prices'=>array(
                    'availabilities' => array('update'=>1),
                    'rates' => array('update'=>1),
                    'occupationalrules' => array('update'=>1),
                    'pricemodifiers' => array('update'=>1),
                )
            );

        $this->avantio_files = $avantio_files;

    } // end function


    /**
     * @return int
     */
    public function getLastInsertIdReport()
    {
        return $this->last_insert_id_report;
    }

    /**
     * @param int $last_insert_id_report
     */
    public function setLastInsertIdReport($last_insert_id_report)
    {
        $this->last_insert_id_report = $last_insert_id_report;
    }

    private function getActivedLanguages()
    {

    } // end function

    /**
     * @return string
     */
    public function getEnvironmentGroup(): string
    {
        return $this->environmentGroup;
    }


    /**
     * @param string $environmentGroup
     */
    public function setEnvironmentGroup(string $environmentGroup): void
    {
        $this->environmentGroup = $environmentGroup;
    }


    /**
     * @param null $param
     * @return string
     */
    /*
    public function index_test($param = null)
    {
        echo "parametro: " . $param;
        //$this->initialize($param);
        //return view('welcome_message');
        if ($param == "one"){
            $this->one();
        }elseif($param == "two"){
            $this->two();
        }
    }


    public function one()
    {
        // load helpers
        helper(['funciones','url']);

        $dynamic = new Dynamic();
        $dynamic->setTable("dynamic_one");
        $resultados = $dynamic->get_all_data();
        p_($resultados);

    } // end function


    public function two()
    {
        // load helpers
        helper(['funciones','url']);

        $dynamic = new Dynamic();
        $dynamic->setTable("dynamic_two");

        $resultados = $dynamic->get_all_data();
        p_($resultados);

    } // end function
    */


}// end class
?>
