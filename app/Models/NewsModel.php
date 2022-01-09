<?php
/**
 * Created by PhpStorm.
 * User: DAVID01
 * Date: 07/07/2021
 * Time: 18:21
 */

namespace App\Models;

use CodeIgniter\Model;

class NewsModel extends Model
{

    protected $table = 'news';
    protected $allowedFields = ['title', 'slug', 'body'];

    public function getNews($slug = false)
    {
        if ($slug === false)
        {
            return $this->findAll();
        }

        return $this->asArray()
            ->where(['slug' => $slug])
            ->first();
    }

}

?>