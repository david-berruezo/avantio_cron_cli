<?php

namespace App\Controllers;

class Home extends BaseController
{
	public function index()
	{
		return view('welcome_message');
	}

    public function construir_url()
    {
        $model = new NewsModel();
        $news = $model->getNews();


        $data[] = '<?php';
        $data[] = 'namespace Config;';
        $data[] = '$routes = Services::routes();';

        foreach ($news as $route) {
            $data[] = '$routes->get(\'/' . $route['slug'] . '\', \'Home::localidades\');';
            $data[] = '$routes->get(\'/' . $route['slug'] . '/(:any)\', \'Home::localidades/$1\');';
            $data[] = '$routes->get(\'/' . $route['slug'] . '/(:any)/(:any)\', \'Home::localidades/$1/$2\');';
        }// end foreach
        $output = implode("\n",$data);
        $this->write_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php',$output);

    } // end function


    public function write_file($file,$output){
        $fp = fopen($file, 'w');
        fwrite($fp, $output);
        fclose($fp);
    }// end function


    public function metodo($param1,$param2)
    {
        echo "param1: " .$param1. " param2: " . $param2 . "<br>";
        return view('welcome_message');
    } // end function


    public function localidades($language = null,$localidad = null)
    {
        echo "language: ".$language. "<br>";
        echo "localidad: ".$localidad. "<br>";

        return view('welcome_message');

    } // end function

}
