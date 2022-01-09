<?php
/**
 * Created by PhpStorm.
 * User: DAVID01
 * Date: 07/07/2021
 * Time: 17:58
 */

namespace App\Controllers;

class Pages extends BaseController{

    /*
    public function __construct(){
        // construct function
    }// end function
    */

    public function index()
    {

        echo "pages index<br>";
        //$template = new Prueba();
        //$this->load->database();
        return view('welcome_message');
    }


    public function vista($page = 'home')
    {

        echo "Esta llegando aqui<br>";

        if ( ! is_file(APPPATH.'/Views/pages/'.$page.'.php'))
        {
            // Whoops, we don't have a page for that!
            throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
        }

        $data['title'] = ucfirst($page); // Capitalize the first letter

        echo view('templates/header', $data);
        echo view('pages/'.$page, $data);
        echo view('templates/footer', $data);
    }



}// end class
?>