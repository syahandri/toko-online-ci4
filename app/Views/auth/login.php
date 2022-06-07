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

                                <form method="POST" action="<?= route_to('login') ?>">
                                    <?= csrf_field() ?>
                                    <?php if ($config->validFields === ['email']) : ?>
                                        <div class="form-group mb-2">
                                            <label for="login" class="form-label small">Email</label>
                                            <input type="email" class="form-control form-control-sm <?php if (session('errors.login')) : ?>is-invalid<?php endif ?>" name="login" placeholder="Masukan alamat email" required>
                                            <div class="invalid-feedback">
                                                <?= session('errors.login') ?>
                                            </div>
                                        </div>
                                    <?php else : ?>
                                        <div class="form-group mb-2">
                                            <label for="login" class="form-label small">Email atau Username</label>
                                            <input type="text" class="form-control form-control-sm <?php if (session('errors.login')) : ?>is-invalid<?php endif ?>" name="login" placeholder="Masukan alamat email atau username" required>
                                            <div class="invalid-feedback">
                                                <?= session('errors.login') ?>
                                            </div>
                                        </div>
                                    <?php endif; ?>

                                    <div class="form-group mb-2">
                                        <label for="password" class="form-label small">Password</label>
                                        <input type="password" class="form-control form-control-sm <?php if (session('errors.password')) : ?>is-invalid<?php endif ?>" name="password" placeholder="Masukan password" required>
                                        <div class="invalid-feedback">
                                            <?= session('errors.password') ?>
                                        </div>
                                    </div>

                                    <?php if ($config->allowRemembering) : ?>
                                        <div class="form-group mb-2">
                                            <div class="form-check small">
                                                <input type="checkbox" name="remember" class="form-check-input" <?php if (old('remember')) : ?> checked <?php endif ?>>
                                                <label class="form-label" for="remember">Remember Me</label>
                                            </div>
                                        </div>
                                    <?php endif; ?>

                                    <div class="d-flex justify-content-center">
                                        <button type="submit" class="btn btn-primary btn-sm px-5">Login</button>
                                    </div>

                                </form>
                                <hr>
                                <?php if ($config->activeResetter) : ?>
                                    <div class="text-center">
                                        <a class="small text-decoration-none text-secondary" href="<?= route_to('forgot') ?>">Lupa password?</a>
                                    </div>
                                <?php endif; ?>
                                <?php if ($config->allowRegistration) : ?>
                                    <div class="text-center">
                                        <a class="small text-decoration-none text-secondary" href="<?= route_to('register') ?>">Buat akun baru</a>
                                    </div>
                                <?php endif; ?>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>