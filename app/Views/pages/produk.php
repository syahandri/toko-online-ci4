<?= $this->extend('pages/_templates/main') ?>

<?= $this->section('page') ?>

<div class="row mt-5">
    <h1 class="fw-bold text-capitalize"><?= $title; ?></h1>
    <?php foreach ($products as $product) : ?>
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="card border-0 shadow p-3 rounded bg-body h-100">
                <?php if ($product['discount'] && in_groups('member')) : ?>
                    <div class="position-absolute p-2 text-light bg-danger bg-opacity-75 rounded"><?= 'Diskon ' . $product['discount'] . '%'; ?></div>
                <?php endif; ?>
                <img src="/img/foto-produk/<?= $product['image_1'] ?>" class="img-fluid rounded" loading="lazy" alt="<?= $product['name'] ?>">
                <div class="card-body text-center">
                    <p class="card-text text-muted small"><?= $product['category']; ?></p>
                    <h4 class="card-title text-capitalize fw-bolder"><?= $product['name']; ?></h4>
                    <?php if (in_groups('member')) : ?>
                        <p class="card-text fs-5 me-2"><?= 'Rp. ' . number_format($product['price'] - ($product['discount'] / 100 * $product['price'])); ?></p>
                        <p class="text-muted text-decoration-line-through small"><?= $product['discount'] ? 'Rp. ' . number_format($product['price']) : ''; ?></p>
                    <?php else : ?>
                        <p class="card-text fs-5 me-2"><?= 'Rp. ' . number_format($product['price']); ?></p>
                    <?php endif; ?>
                </div>
                <div class="card-footer border-0 bg-body d-flex justify-content-center">
                    <a href="" data-slug="<?= $product['slug']; ?>" type="button" class="btn btn-yellow stretched-link rounded-pill fw-bold py-2 px-5 btn-order-product"><i class="fas fa-cart-plus"></i> Pesan</a>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
    <?= $pager->links() ?>
</div>

<?= $this->endSection() ?>