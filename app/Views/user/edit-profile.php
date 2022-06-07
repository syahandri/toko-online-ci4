<?= $this->extend('pages/_templates/main') ?>

<?= $this->section('page') ?>

<div class="row mt-5">
    <h1 class="fw-bold"><?= $title; ?></h1>
    <div class="col-12">
        <div class="card card-body shadow border-0">
            <form action="" method="post" enctype="multipart/form-data" id="formProfile">
                <div class="row">
                    <?= csrf_field(); ?>
                    <div class="col-sm-6">
                        <div class="mb-2">
                            <label for="fullname" class="form-label">Nama Lengkap</label>
                            <input type="text" class="form-control text-capitalize" id="fullname" name="fullname" placeholder="Nama lengkap" value="<?= user()->fullname ?>" required>
                            <div class="invalid-feedback invalid-fullname"></div>
                        </div>
                        <div class="mb-2">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="Username" value="<?= user()->username ?>" required>
                            <div class="invalid-feedback invalid-username"></div>
                        </div>
                        <div class="mb-2">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="<?= user()->email ?>" required>
                            <div class="invalid-feedback invalid-email"></div>
                        </div>
                        <div class="mb-2">
                            <label for="phone" class="form-label">Telepon</label>
                            <input type="number" class="form-control" id="phone" name="phone" placeholder="Telepon" value="<?= user()->phone ?>" required>
                            <div class="invalid-feedback invalid-phone"></div>
                        </div>
                        <div class="mb-2">
                            <label for="picture" class="form-label">Foto Profil</label>
                            <input class="form-control" type="file" id="picture" name="picture">
                            <span class="small text-muted">Upload foto maks. 1 MB tipe PNG, JPG, JPEG</span>
                            <div class="invalid-feedback invalid-picture"></div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <input type="hidden" name="id" value="<?= $address ? $address['id'] : '' ?>">
                        <div class="mb-2">
                            <label for="jalan" class="form-label">Alamat</label>
                            <input type="text" class="form-control" id="jalan" name="jalan" placeholder="Alamat" value="<?= $address ? $address['jalan'] : ''?>" required>
                            <div class="invalid-feedback invalid-jalan"></div>
                        </div>
                        <div class="mb-2">
                            <label for="provinsi" class="form-label">Provinsi</label>
                            <input type="hidden" name="kode_provinsi" value="<?= $address ? $address['kode_provinsi'] : '' ?>">
                            <select class="form-select" id="provinsi" name="provinsi" required>
                                <option value="">-- Pilih Provinsi --</option>
                                <?php foreach (json_decode($province, true)['rajaongkir']['results'] as $result) : ?>
                                    <option data-id="<?= $result['province_id'] ?>" value="<?= $result['province'] ?>" <?= $address ? ($address['kode_provinsi'] == $result['province_id'] ? 'selected' : '') : '' ?>><?= $result['province'] ?></option>
                                <?php endforeach; ?>
                            </select>
                            <div class="invalid-feedback invalid-provinsi"></div>
                        </div>
                        <div class="mb-2">
                            <label for="kabupaten" class="form-label">Kabupaten / Kota<span class="spinner-border-sm load-kabupaten" role="status"></span></label>
                            <input type="hidden" name="kode_kabupaten" value="<?= $address ? $address['kode_kabupaten'] : '' ?>">
                            <select class="form-select" id="kabupaten" name="kabupaten" required>
                                <option value="">-- Pilih Kabupaten --</option>
                                <?php foreach (json_decode($city, true)['rajaongkir']['results'] as $result) : ?>
                                    <option data-id="<?= $result['city_id'] ?>" value="<?= $result['city_name'] ?>" <?= $address ? ($address['kode_kabupaten'] == $result['city_id'] ? 'selected' : '') : '' ?>><?= $result['city_name'] . ' - ' . $result['type'] ?></option>
                                <?php endforeach; ?>
                            </select>
                            <div class="invalid-feedback invalid-kabupaten"></div>
                        </div>
                        <div for="kecamatan" class="mb-2">
                            <label class="form-label">Kecamatan</label>
                            <input type="text" class="form-control" id="kecamatan" name="kecamatan" placeholder="Kecamatan" value="<?= $address ? $address['kecamatan'] : '' ?>" required>
                            <div class="invalid-feedback invalid-kecamatan"></div>
                        </div>
                        <div class="mb-2">
                            <label for="kode_pos" class="form-label">Kode Pos</label>
                            <input type="text" class="form-control" id="kode_pos" name="kode_pos" placeholder="Kode Pos" value="<?= $address ? $address['kode_pos'] : '' ?>" required>
                            <div class="invalid-feedback invalid-kode_pos"></div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-sm px-5 mt-2">
                    <i class="fas fa-save"></i> Simpan
                </button>
            </form>
        </div>
    </div>
</div>
<?= $this->endSection() ?>