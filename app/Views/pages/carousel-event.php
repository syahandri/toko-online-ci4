<div class="row mt-3 mb-5">
    <div class="col-12">
        <div id="eventSlider" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <?php for ($i = 0; $i < count($events); $i++) : ?>
                    <button type="button" data-bs-target="#eventSlider" data-bs-slide-to="<?= $i ?>" <?= $i != 0 ?: 'class="active"' ?>></button>
                <?php endfor ?>
            </div>
            <div class="carousel-inner">
                <?php foreach ($events as $i => $event) : ?>
                    <?php
                        $startDate = date_create($event['start_date']);
                        $endDate = date_create($event['end_date']);
                    ?>
                    <div class="carousel-item <?= $i != 0 ?: 'active' ?>">
                        <img src="/img/event/<?= $event['image'] ?>" class="d-block w-100 rounded img-event" alt="<?= $event['name'] ?>">
                        <div class="carousel-caption bg-dark bg-opacity-75 rounded shadow">
                            <h3 class="text-warning"><?= $event['name'] ?></h3>
                            <h6 class="d-none d-sm-block"><?= date_format($startDate, 'd M Y') . ' - ' . date_format($endDate, 'd M Y') ?></h6>
                            <a href="/event/<?= $event['slug'] ?>" class="btn btn-yellow">Lihat Event</a>
                        </div>
                    </div>
                <?php endforeach ?>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#eventSlider" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#eventSlider" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</div>