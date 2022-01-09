<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class Dynamic extends BaseController
{

    private $table_template = array (

        'table_open'          => '<table class="table table-striped table-bordered table-hover" id="menu">',
        'heading_row_start'   => '<tr>',
        'heading_row_end'     => '</tr>',
        'heading_cell_start'  => '<th>',
        'heading_cell_end'    => '</th>',

        'row_start'           => '<tr>',
        'row_end'             => '</tr>',
        'cell_start'          => '<td>',
        'cell_end'            => '</td>',

        'row_alt_start'       => '<tr>',
        'row_alt_end'         => '</tr>',
        'cell_alt_start'      => '<td>',
        'cell_alt_end'        => '</td>',

        'table_close'         => '</table>'
    );


    public function index()
	{
		//
	}// end function


    public function dlist($slug)
    {

    } // end function

    public function dedit($slug,$idioma,$id)
    {

    } // end function


    public function dorder($slug,$idioma)
    {

    } // end function

    public function dupdate($slug)
    {

    } // end function

    public function ddelete($slug,$id)
    {

    } // end function

    public function dpause($slug, $id)
    {
        
    } // end function


    public function dthumbnail()
    {

    } // end function

    public function dresume($slug, $id)
    {
        
    } // end function

    public function dorder_update($slug)
    {

    } // end function

    public function generate_thumbnails($res_high,$res_low,$res_mob)
    {

    } // end function



}// end class
