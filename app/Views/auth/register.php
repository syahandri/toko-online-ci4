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

                                <form method="POST" action="<?= route_to('register') ?>">
                                    <?= csrf_field() ?>

                                    <div class="form-group mb-2">
                                        <label for="fullname" class="form-label small">Nama Lengkap</label>
                                        <input type="text" class="form-control form-control-sm <?php if (session('errors.fullname')) : ?>is-invalid<?php endif ?>" name="fullname" value="<?= old('fullname') ?>" placeholder="Masukan nama lengkap" required>
                                        <div class="invalid-feedback">
                                            <?= session('errors.fullname') ?>
                                        </div>
                                    </div>

                                    <div class="form-group mb-2">
                                        <label for="username" class="form-label small">Username</label>
                                        <input type="text" class="form-control form-control-sm <?php if (session('errors.username')) : ?>is-invalid<?php endif ?>" name="username" value="<?= old('username') ?>" placeholder="Masukan username" required>
                                        <div class="invalid-feedback">
                                            <?= session('errors.username') ?>
                                        </div>
                                    </div>

                                    <div class="form-group mb-2">
                                        <label for="email" class="form-label small">Email</label>
                                        <input type="email" class="form-control form-control-sm <?php if (session('errors.email')) : ?>is-invalid<?php endif ?>" name="email" value="<?= old('email') ?>" placeholder="Masukan alamat email" required>
                                        <div class="invalid-feedback">
                                            <?= session('errors.email') ?>
                                        </div>
                                        <small id="emailHelp" class="form-text text-muted"><?= lang('Auth.weNeverShare') ?></small>
                                    </div>

                                    <div class="form-group mb-2">
                                        <label for="password" class="form-label small">Password</label>
                                        <input type="password" class="form-control form-control-sm <?php if (session('errors.password')) : ?>is-invalid<?php endif ?>" name="password" placeholder="Masukan password" required autocomplete="off">
                                        <div class="invalid-feedback">
                                            <?= session('errors.password') ?>
                                        </div>
                                    </div>

                                    <div class="form-group mb-2">
                                        <label for="pass_confirm" class="form-label small">Konfirmasi Password</label>
                                        <input type="password" class="form-control form-control-sm <?php if (session('errors.pass_confirm')) : ?>is-invalid<?php endif ?>" name="pass_confirm" placeholder="Masukan password kembali" required autocomplete="off">
                                        <div class="invalid-feedback">
                                            <?= session('errors.pass_confirm') ?>
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-center mt-3">
                                        <button type="submit" class="btn btn-primary btn-sm px-5">Register</button>
                                    </div>

                                </form>
                                <hr>
                                <div class="text-center">
                                    <span class="small text-secondary">Sudah punya akun? </span><a class="small text-decoration-none" href="<?= route_to('login') ?>">Login</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>