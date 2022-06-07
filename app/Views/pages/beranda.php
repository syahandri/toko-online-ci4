<?= $this->extend('pages/_templates/main') ?>

<?= $this->section('page') ?>

<!-- Carousel Event -->
<?= $this->include('pages/carousel-event'); ?>

<!-- Produk terbaru -->
<section id="terbaru">
    <div class="row">
        <h1 class="fw-bold">Produk Terbaru</h1>
        <?php foreach ($newest as $new) : ?>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card border-0 p-3 rounded bg-body shadow h-100">
                    <?php if ($new['discount'] && in_groups('member')) : ?>
                        <div class="position-absolute p-2 text-light bg-danger bg-opacity-75 rounded"><?= 'Diskon ' . $new['discount'] . '%'; ?></div>
                    <?php endif; ?>
                    <img src="/img/foto-produk/<?= $new['image_1'] ?>" class="img-fluid rounded" loading="lazy" alt="<?= $new['name'] ?>">
                    <div class="card-body text-center">
                        <p class="card-text text-muted small"><?= $new['category']; ?></p>
                        <h4 class="card-title text-capitalize fw-bolder"><?= $new['name']; ?></h4>
                        <?php if (in_groups('member')) : ?>
                            <p class="card-text fs-5 me-2"><?= 'Rp. ' . number_format($new['price'] - ($new['discount'] / 100 * $new['price'])); ?></p>
                            <p class="text-muted text-decoration-line-through small"><?= $new['discount'] ? 'Rp. ' . number_format($new['price']) : ''; ?></p>
                        <?php else : ?>
                            <p class="card-text fs-5 me-2"><?= 'Rp. ' . number_format($new['price']); ?></p>
                        <?php endif; ?>
                    </div>
                    <div class="card-footer border-0 bg-body d-flex justify-content-center">
                        <a href="" data-slug="<?= $new['slug']; ?>" type="button" class="btn btn-yellow stretched-link rounded-pill fw-bold py-2 px-5 btn-order-product"><i class="fas fa-cart-plus"></i> Pesan</a>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
    <div class="d-flex justify-content-center pt-3 pb-5">
        <a href="product/newest" type="button" class="btn btn-yellow rounded-pill fw-bold py-3 px-5"><i class="fas fa-eye"></i> Lihat Semua Produk</a>
    </div>
</section>

<!-- Produk terlaris -->
<section id="terlaris">
    <div class="row">
        <h1 class="fw-bold">Produk Terlaris</h1>
        <?php foreach ($bestselling as $bestsell) : ?>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card border-0 shadow p-3 rounded bg-body h-100">
                    <?php if ($bestsell['discount'] && in_groups('member')) : ?>
                        <div class="position-absolute p-2 text-light bg-danger bg-opacity-75 rounded"><?= 'Diskon ' . $bestsell['discount'] . '%'; ?></div>
                    <?php endif; ?>
                    <img src="/img/foto-produk/<?= $bestsell['image_1'] ?>" class="img-fluid rounded" loading="lazy" alt="<?= $bestsell['name'] ?>">
                    <div class="card-body text-center">
                        <p class="card-text text-muted small"><?= $bestsell['category']; ?></p>
                        <h4 class="card-title text-capitalize fw-bolder"><?= $bestsell['name']; ?></h4>
                        <?php if (in_groups('member')) : ?>
                            <p class="card-text fs-5 me-2"><?= 'Rp. ' . number_format($bestsell['price'] - ($bestsell['discount'] / 100 * $bestsell['price'])); ?></p>
                            <p class="text-muted text-decoration-line-through small"><?= $bestsell['discount'] ? 'Rp. ' . number_format($bestsell['price']) : ''; ?></p>
                        <?php else : ?>
                            <p class="card-text fs-5 me-2"><?= 'Rp. ' . number_format($bestsell['price']); ?></p>
                        <?php endif; ?>
                    </div>
                    <div class="card-footer border-0 bg-body d-flex justify-content-center">
                        <a href="" data-slug="<?= $bestsell['slug']; ?>" type="button" class="btn btn-yellow stretched-link rounded-pill fw-bold py-2 px-5 btn-order-product"><i class="fas fa-cart-plus"></i> Pesan</a>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
    <div class="d-flex justify-content-center pt-3 pb-5">
        <a href="/product/bestseller" type="button" class="btn btn-yellow rounded-pill fw-bold py-3 px-5"><i class="fas fa-eye"></i> Lihat Semua Produk</a>
    </div>
</section>

<!-- Produk termurah -->
<section id="termurah">
    <div class="row">
        <h1 class="fw-bold">Produk Termurah</h1>
        <?php foreach ($cheapest as $cheap) : ?>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card border-0 shadow p-3 rounded bg-body h-100">
                    <?php if ($cheap['discount'] && in_groups('member')) : ?>
                        <div class="position-absolute p-2 text-light bg-danger bg-opacity-75 rounded"><?= 'Diskon ' . $cheap['discount'] . '%'; ?></div>
                    <?php endif; ?>
                    <img src="/img/foto-produk/<?= $cheap['image_1'] ?>" class="img-fluid rounded" loading="lazy" alt="<?= $cheap['name'] ?>">
                    <div class="card-body text-center">
                        <p class="card-text text-muted small"><?= $cheap['category']; ?></p>
                        <h4 class="card-title text-capitalize fw-bolder"><?= $cheap['name']; ?></h4>
                        <?php if (in_groups('member')) : ?>
                            <p class="card-text fs-5 me-2"><?= 'Rp. ' . number_format($cheap['price'] - ($cheap['discount'] / 100 * $cheap['price'])); ?></p>
                            <p class="text-muted text-decoration-line-through small"><?= $cheap['discount'] ? 'Rp. ' . number_format($cheap['price']) : ''; ?></p>
                        <?php else : ?>
                            <p class="card-text fs-5 me-2"><?= 'Rp. ' . number_format($cheap['price']); ?></p>
                        <?php endif; ?>
                    </div>
                    <div class="card-footer border-0 bg-body d-flex justify-content-center">
                        <a href="" data-slug="<?= $cheap['slug']; ?>" type="button" class="btn btn-yellow stretched-link rounded-pill fw-bold py-2 px-5 btn-order-product"><i class="fas fa-cart-plus"></i> Pesan</a>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
    <div class="d-flex justify-content-center pt-3 pb-5">
        <a href="/product/cheapest" type="button" class="btn btn-yellow rounded-pill fw-bold py-3 px-5"><i class="fas fa-eye"></i> Lihat Semua Produk</a>
    </div>
</section>

<?= $this->endSection() ?>