<?= $this->extend('layouts/layout_one') ?>
<?=$this->section("content")?>
    <h1>Welcome to template page</h1>
    <p>This is a sample page of our website</p>
<?= $this->endSection(); ?>

<?=$this->section("content_description")?>
<p>Description template page</p>
<?= $this->endSection(); ?>
