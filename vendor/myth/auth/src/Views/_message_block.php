<?php if (session()->has('message')) : ?>
	<div class="alert alert-success text-center">
		<?= session('message') ?>
	</div>
<?php endif ?>

<?php if (session()->has('error')) : ?>
	<div class="alert alert-danger text-center">
		<?= session('error') ?>
	</div>
<?php endif ?>