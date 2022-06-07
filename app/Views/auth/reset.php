<?= $this->extend('auth/_templates/main') ?>
<?= $this->section('auth') ?>

<div class="container">
    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-md-6">

            <div class="card border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg">
                            <div class="p-5">
                                <div class="text-center">
                                    <h4 class="h4 text-gray-900 mb-4"><?= $title ?></h4>
                                </div>

                                <?= view('Myth\Auth\Views\_message_block') ?>

                                <p><?= lang('Auth.enterCodeEmailPassword') ?></p>

                                <form method="POST" action="<?= route_to('reset-password') ?>">
                                    <?= csrf_field() ?>

                                    <div class="form-group mb-2">
                                        <label for="token" class="form-label small">Token</label>
                                        <input type="text" class="form-control form-control-sm <?php if (session('errors.token')) : ?>is-invalid<?php endif ?>" name="token" value="<?= old('token', $token ?? '') ?>" placeholder="Masukan token" required>
                                        <div class="invalid-feedback">
                                            <?= session('errors.token') ?>
                                        </div>
                                    </div>

                                    <div class="form-group mb-2">
                                        <label for="email" class="form-label small">Email</label>
                                        <input type="email" class="form-control form-control-sm <?php if (session('errors.email')) : ?>is-invalid<?php endif ?>" name="email" value="<?= old('email') ?>" placeholder="Masukan alamat email" required>
                                        <div class="invalid-feedback">
                                            <?= session('errors.email') ?>
                                        </div>
                                    </div>

                                    <div class="form-group mb-2">
                                        <label for="password" class="form-label small">Password</label>
                                        <input type="password" class="form-control form-control-sm <?php if (session('errors.password')) : ?>is-invalid<?php endif ?>" name="password" placeholder="Masukan password" required>
                                        <div class="invalid-feedback">
                                            <?= session('errors.password') ?>
                                        </div>
                                    </div>

                                    <div class="form-group mb-2">
                                        <label for="pass_confirm" class="form-label small">Konfirmasi Password</label>
                                        <input type="password" class="form-control form-control-sm <?php if (session('errors.pass_confirm')) : ?>is-invalid<?php endif ?>" name="pass_confirm" placeholder="Masukan password kembali" required>
                                        <div class="invalid-feedback">
                                            <?= session('errors.pass_confirm') ?>
                                        </div>
                                    </div>

                                    <button type="submit" class="btn btn-primary btn-sm px-5">Reset Password</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>