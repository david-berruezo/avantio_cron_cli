<?php
/**
 * Created by PhpStorm.
 * User: DAVID01
 * Date: 09/07/2021
 * Time: 17:07
 */
?>

<h2><?= esc($title) ?></h2>

<?= \Config\Services::validation()->listErrors() ?>

<form action="/news/create" method="post">

    <?= csrf_field() ?>

    <label for="title">Title</label>
    <input type="input" name="title" /><br />

    <label for="body">Text</label>
    <textarea name="body"></textarea><br />

    <input type="submit" name="submit" value="Create news item" />

</form>
