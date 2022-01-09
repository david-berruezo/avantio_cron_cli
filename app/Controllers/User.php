<?php

namespace App\Controllers;

use App\Controllers\BaseController;

use App\Models\UserModel;
use App\Entities\User as UserEntity;

class User extends BaseController
{

    public function index()
    {
        echo "user index";
    }// end function


    public function insertDataModel()
    {
        $model = new UserModel();

        // Add operation
        $model->insert_data(array(
            "name"      => "David",
            "email"     => "davidberruezo@davidberruezo.com",
            "phone_no"  => "615231533",
        ));

        // Update Operation
        $model->update_data(1, array(
            "name"      => "Dolores",
            "email"     => "doloresbernad@gmail.com",
            "phone_no"  => "6170945181",
        ));

        //...

    } // end function


    public function insertDataEntityFillArray()
    {
        // Creating an instance of modal
        $userModel = new UserModel();

        // Creating an instance of entity
        $user = new UserEntity();

        $data = [
            "name"      => "Antonio",
            "email"     => "toniberruezoalastruey@gmail.com",
            "phone_no"  => "646646316",
        ];

        $user->fill($data);

        $userModel->save($user);

    } // end function


    public function insertDataEntityObject()
    {
        // Creating an instance of modal
        $userModel = new UserModel();

        // Creating an instance of entity
        $user = new UserEntity();

        $user->name = "Josep Maria";
        $user->email = "josepmariaberruezo@gmail.com";
        $user->phone_no = "111111";

        $userModel->save($user);

    } // end function


}// end class
