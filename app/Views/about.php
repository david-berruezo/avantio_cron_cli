<?= $this->extend('/layouts/layout_one') ?>
<?=$this->section("content")?>
<h1>Welcome to about page</h1>
<p>This is a sample about us page</p>
<?= $this->endSection(); ?>

<?=$this->section("content_description")?>
<p>Description about page</p>
<?= $this->endSection(); ?>

