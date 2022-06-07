<?= $this->extend('pages/_templates/main') ?>

<?= $this->section('page') ?>

<?php if (!$event) : ?>
    <div class="alert alert-danger text-center mt-5" role="alert">
        Maaf, Event tidak ditemukan!
    </div>
<?php else : ?>
    <div class="row mt-5">
        <h1 class="fw-bold text-capitalize"><?= $title; ?></h1>
        <?php
        $startDate = date_create($event['start_date']);
        $endDate = date_create($event['end_date']);
        ?>
        <div class="col-12">
            <div class="card card-body shadow border-0">
                <img src="/img/event/<?= $event['image'] ?>" alt="<?= $event['name'] ?>" class="rounded img-fluid">
                <h2 class="mt-3 text-center fw-bold text-capitalize"><?= $event['name'] ?></h2>
                <h6 class="my-0 text-center fw-bold"><?= date_format($startDate, 'd M Y') . ' - ' . date_format($endDate, 'd M Y') ?></h6>
                <p class="mt-4"><?= $event['detail'] ?></p>
            </div>
        </div>

    </div>

    <div class="row mt-5 justify-content-center">
        <h1 class="fw-bold text-capitalize">Event lainnya</h1>
        <?php foreach ($events as $event) : ?>

            <?php
            $startDate = date_create($event['start_date']);
            $endDate = date_create($event['end_date']);
            ?>
            <div class="col-sm-4 col-md-3">
                <div class="card card-body shadow border-0 mb-3 card-event">
                    <img src="/img/event/<?= $event['image'] ?>" alt="" class="rounded img-fluid">
                    <p class="fw-bold text-capitalize text-center mt-3 mb-0"><?= $event['name'] ?></p>
                    <span class="text-center small"><?= date_format($startDate, 'd M Y') . ' - ' . date_format($endDate, 'd M Y') ?></span>
                    <a href="/event/<?= $event['slug'] ?>" class="stretched-link"></a>
                </div>
            </div>
        <?php endforeach ?>
    </div>
<?php endif ?>
<?= $this->endSection() ?>