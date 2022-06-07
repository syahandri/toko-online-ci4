<?= $this->extend('auth/_templates/main') ?>
<?= $this->section('auth') ?>

<div class="container">
    <div class="row">
        <div class="col-md-8 m-auto my-5">
            <div class="card border-0 p-2 bg-light shadow">
                <div class="card-body">
                    <h4 class="h4 text-gray-900 mb-4 text-center"><?= $title . '?' ?></h4>
                    <h6 class="card-text text-center">
                        <?= lang('Auth.enterEmailForInstructions') ?>
                    </h6>

                    <?= view('Myth\Auth\Views\_message_block') ?>

                    <form method="POST" action="<?= route_to('forgot') ?>">
                        <?= csrf_field() ?>

                        <div class="form-group mb-2">
                            <label for="email" class="form-label small">Email</label>
                            <input type="email" class="form-control form-control-sm <?php if (session('errors.email')) : ?>is-invalid<?php endif ?>" name="email" placeholder="Masukan alamat email" required>
                            <div class="invalid-feedback">
                                <?= session('errors.email') ?>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary btn-sm px-5">Reset password</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>