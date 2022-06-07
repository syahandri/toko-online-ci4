<?= $this->extend('pages/_templates/main') ?>

<?= $this->section('page') ?>

<form action="/checkout" method="post" id="formCheckout" class="row mt-5">
    <h1 class="fw-bold"><?= $title ?></h1>
    <?php if (!$carts) : ?>
        <div class="col-md-7 col-lg-8">
            <div class="alert alert-danger text-center" role="alert">
                <p class="my-0">Keranjang kamu kosong!</p>
                <p class="my-0">Silahkan belanja terlebih dahulu.</p>
            </div>
        </div>
    <?php else : ?>
        <div class="col-md-7 col-lg-8">
            <?php foreach ($carts as $cart) : ?>
                <div class="card card-body shadow border-0 mb-2 card-product">
                    <div class="d-flex justify-content-between mb-2">
                        <div class="form-check form-switch">
                            <input class="form-check-input select-item-cart" type="checkbox" role="switch" <?= $cart['stock'] ?: 'disabled' ?>>
                            <label class="form-check-label" for="flexSwitchCheckDefault">Pilih item</label>
                        </div>
                        <a href="" class="text-decoration-none text-muted remove-item-cart"><i class="fas fa-trash-alt"></i></a>
                    </div>
                    <div class="row align-items-center justify-content-between">
                        <div class="col-3 col-lg-2">
                            <img src="/img/foto-produk/<?= $cart['image_1'] ?>" class="img-cart img-fluid rounded" loading="lazy" alt="<?= $cart['name'] ?>">
                        </div>
                        <div class="col-5 col-lg-6">
                            <?= csrf_field() ?>
                            <input type="hidden" name="id" value="<?= $cart['product_id'] ?>">
                            <input type="hidden" name="stock" value="<?= $cart['stock'] ?>">
                            <input type="hidden" name="size" value="<?= $cart['size'] ?>">
                            <input type="hidden" name="color" value="<?= $cart['color'] ?>">
                            <input type="hidden" name="weight" value="<?= $cart['weight'] ?>">
                            <?php if (in_groups('member')) : ?>
                                <input type="hidden" name="price" value="<?= round($cart['price'] - ($cart['discount'] / 100 * $cart['price'])) ?>">
                            <?php else : ?>
                                <input type="hidden" name="price" value="<?= $cart['price'] ?>">
                            <?php endif; ?>

                            <h6 class="card-title fw-bold my-0 text-capitalize"><?= $cart['name'] ?></h6>
                            <p class="my-0 text-muted small"><?= $cart['size'] ?></p>
                            <p class="my-0 text-muted small"><?= $cart['color'] ?></p>
                            <p class="my-0 text-muted small">Catatan (Opsional)</p>
                            <input type="text" name="note" class="form-control form-control-sm" placeholder="Tulis catatan">
                        </div>
                        <div class="col-4 text-end">
                            <h6 class="card-text fw-bold">
                                <?php if (in_groups('member')) : ?>
                                    <?= 'Rp. ' . number_format($cart['price'] - ($cart['discount'] / 100 * $cart['price'])) ?>
                                <?php else : ?>
                                    <?= 'Rp. ' . number_format($cart['price']) ?>
                                <?php endif; ?>
                            </h6>
                            <input type="number" name="qty" class="form-control form-control-sm d-inline text-center w-25" value="<?= $cart['stock'] < $cart['quantity'] ? $cart['stock'] : $cart['quantity'] ?>" <?= $cart['stock'] ?: 'disabled' ?> required>
                            <p class="stock-alert <?= $cart['stock'] ? 'text-muted' : 'text-danger' ?> small" data-id="<?= $cart['product_id'] ?>"><?= $cart['stock'] ? 'Stok tersedia' : 'Stok habis!' ?></p>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
    <div class="col-md-5 col-lg-4">
        <div class="card card-body shadow border-0 mb-2">
            <h6>Dikirim ke :</h6>
            <?php if ($address) : ?>
                <input type="hidden" name="tujuan" value="<?= $address['kode_kabupaten'] ?>">
                <input type="hidden" name="address_id" value="<?= $address['id'] ?>">
                <input type="hidden" name="jalan" value="<?= $address['jalan'] ?>">
                <input type="hidden" name="kecamatan" value="<?= $address['kecamatan'] ?>">
                <input type="hidden" name="kabupaten" value="<?= $address['kabupaten'] ?>">
                <input type="hidden" name="provinsi" value="<?= $address['provinsi'] ?>">
                <input type="hidden" name="kode_pos" value="<?= $address['kode_pos'] ?>">
                <input type="hidden" name="ongkir">
                <input type="hidden" name="etd">
                <input type="hidden" name="total">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><?= user()->fullname ?></li>
                    <li class="list-group-item">
                        <?= $address['jalan'] . ',' ?>
                        <?= $address['kecamatan'] . ',' ?>
                        <?= $address['kabupaten'] . ',' ?>
                        <?= $address['provinsi'] ?>
                        <?= $address['kode_pos'] ?>
                    </li>
                </ul>
            <?php else : ?>
                <h5 class="text-danger">Atur alamat terlebih dahulu!</h5>
            <?php endif; ?>
            <a href="/profile" class="small text-decoration-none">Ubah alamat</a>
        </div>
        <div class="card card-body shadow border-0 mb-1">
            <h6>Ekspedisi</h6>
            <div class="mb-2">
                <label for="kurir">Kurir</label>
                <select class="form-select form-select-sm" name="courier" disabled required>
                    <option value="">-- Pilih kurir --</option>
                    <option value="jne">JNE</option>
                    <option value="pos">POS</option>
                    <option value="tiki">TIKI</option>
                </select>
            </div>
            <div class="mb-2">
                <label for="jenis_pengiriman">Jenis pengiriman <span class="spinner-border-sm text-danger" role="status"></span></label>
                <select class="form-select form-select-sm" name="shipping_type" disabled required>
                    <option value="">-- Pilih jenis pengiriman --</option>
                </select>
            </div>
            <p>Ongkir : Rp. <span class="ongkir"> - </span></p>
            <p>Estimasi (hari) : <span class="etd"> - </span></p>
            <p>Total : Rp. <span class="total"> - </span></p>
            <div class="d-flex justify-content-end">
                <button type="submit" class="btn btn-yellow" disabled>
                    <i class="fas fa-shopping-bag"></i> Checkout
                </button>
            </div>
        </div>
    </div>
</form>


<!-- Modal Checkout -->
<?= $this->include('pages/modal-checkout') ?>

<?= $this->endSection() ?>