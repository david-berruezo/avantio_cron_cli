<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class Template extends BaseController
{
	public function index()
	{
        $data = array();
        return view('template');
	}

    public function about()
    {
        $data = array();
        return view('about');
	} // end function
}
