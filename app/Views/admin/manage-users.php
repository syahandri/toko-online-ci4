<?= $this->extend('admin/_templates/main') ?>

<?= $this->section('page') ?>

<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <?php if (session()->getFlashdata('info')) : ?>
                <div class="alert alert-success alert-dismissible fade show mb-2" role="alert">
                    <?= session()->getFlashdata('info') ?>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <?php endif ?>
        </div>
        <?php foreach ($users as $user) : ?>
            <div class="col-sm-6 col-md-4 mb-3">
                <div class="card card-body shadow border-0 h-100">
                    <div class="row m-0 p-0">
                        <div class="col d-flex justify-content-end align-items-baseline">
                            <div class="dropdown no-arrow">
                                <a href="" data-bs-toggle="collapse" role="button" class="dropdown-toggle text-decoration-none link-dark options-user"><i class="fas fa-ellipsis-v"></i></a>

                                <div class="dropdown-list dropdown-menu shadow animated--grow-in">
                                    <h6 class="dropdown-header text-dark">
                                        Opsi User
                                    </h6>
                                    <?php if ($user->role == 'member') : ?>
                                        <a class="dropdown-item disabled text-danger" href="#">
                                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                            <?= $user->fullname ?> sudah menjadi member
                                        </a>
                                    <?php else : ?>
                                        <form action="/web-admin/users/manage/<?= $user->id ?>" method="post">
                                            <button type="submit" class="dropdown-item text-success">
                                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-700"></i>
                                                Jadikan <?= $user->fullname ?> sebagai member
                                            </button>
                                        </form>
                                    <?php endif ?>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col-12 col-lg-4 mb-3 mb-lg-0">
                            <img src="/img/foto-profile/<?= $user->picture ?>" alt="<?= $user->fullname ?>" class="img-fluid mx-auto d-block">
                        </div>
                        <div class="col-12 col-lg-8 text-center text-lg-left">
                            <p class="my-0"><?= $user->fullname ?></p>
                            <p class="my-0"><?= $user->phone ?></p>
                            <p class="my-0 fw-bolder"><?= strtoupper($user->role) ?></p>
                        </div>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>

<?= $this->endSection() ?>