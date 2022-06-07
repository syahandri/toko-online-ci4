<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
</head>

<body>
    <?php use CodeIgniter\I18n\Time; ?>
    <div class="alert alert-warning" role="alert">
        <h5 class="alert-heading text-center">Anda bisa melakukan pembayaran melalui salah satu bank di
            bawah ini.</h6>
            <hr>
            <p class="my-0 text-center">Jika anda sudah melakukan pembayaran, segera konfirmasi di menu
                <a href="<?= base_url('order/confirm') ?>" class="alert-link">Konfirmasi Pembayaran</a> agar pesanan segera diproses.
            </p>
    </div>
    <div class="alert alert-danger" role="alert">
        <p class="my-0 text-center">Harap melakukan konfirmasi pembayaran sebelum tanggal <strong><?= $deadline_date ?></strong> pukul <strong><?= $deadline_time ?></strong>. Jika
            melewati batas waktu, pesanan akan dibatalkan.
        </p>
    </div>

    <table class="table">
        <tr>
            <td>
                <div class="card card-body mb-2">
                    <h5 class="card-title">BRI</h5>
                    <p class="card-text mb-0">No. Rekening : 0393884384293939239</p>
                    <p class="card-text mb-0">Atas Nama : Ndog</p>

                </div>
            </td>
            <td>
                <div class="card card-body mb-2">
                    <h5 class="card-title">BCA</h5>
                    <p class="card-text mb-0">No. Rekening : 0393884384293939239</p>
                    <p class="card-text mb-0">Atas Nama : Ndog</p>
                </div>
            </td>
            <td>
                <div class="card card-body mb-2">
                    <h5 class="card-title">Mandiri</h5>
                    <p class="card-text mb-0">No. Rekening : 0393884384293939239</p>
                    <p class="card-text mb-0">Atas Nama : Ndog</p>
                </div>
            </td>
        </tr>
    </table>

    <table class="table">
        <tr>
            <td>
                <span class="fw-bold">Tanggal: <?= Time::parse($data[0]['created_at'], 'Asia/Jakarta', 'id-ID')->toLocalizedString('dd MMMM yyyy') ?></span>
            </td>
            <td class="text-right">
                <span class="fw-bold">No. Invoice: <?= $data[0]['invoice'] ?></span>
            </td>
        </tr>
    </table>

    <table class="table">
        <tr>
            <td>
                <h6 class="fw-bold">Dikirim ke:</h6>
                <h6><?= $data[0]['fullname'] ?></h6>
                <h6><?= $data[0]['jalan'] ?></h6>
                <h6><?= $data[0]['kecamatan'] ?></h6>
                <h6><?= $data[0]['kabupaten'] ?></h6>
                <h6><?= $data[0]['provinsi'] ?></h6>
                <h6><?= $data[0]['kode_pos'] ?></h6>
            </td>
            <td class="text-right">
                <span class="fw-bold">Ekspedisi:</span>
                <p class="mb-0">Kurir: <?= strtoupper($data[0]['courier']) ?></p>
                <p class="mb-0">Layanan: <?= $data[0]['shipping_type'] ?></p>
                <p class="mb-0">Estimasi: <?= $data[0]['estimate_date'] ?> (Hari)</p>
            </td>
        </tr>
    </table>

    <table class="table table-sm table-bordered">
        <thead class="table-secondary">
            <tr>
                <th>#</th>
                <th>Produk</th>
                <th>Ukuran</th>
                <th>Warna</th>
                <th>Harga</th>
                <th>Jumlah</th>
                <th>Grand Total</th>
                <th>Catatan</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($data as $i => $product) : ?>
                <tr>
                    <td><?= $i + 1 ?></td>
                    <td><?= $product['product'] ?></td>
                    <td><?= $product['size'] ?></td>
                    <td><?= $product['color'] ?></td>
                    <td>Rp. <?= number_format($product['price']) ?></td>
                    <td><?= $product['quantity'] ?></td>
                    <td>Rp. <?= number_format($product['grand_total']) ?></td>
                    <td><?= $product['note'] ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <div class="text-right">
        <h5 class="fw-bold mb-3">Ongkir: Rp. <?= number_format($data[0]['cost']) ?></h5>
        <h4 class="fw-bold">Total: Rp. <?= number_format($data[0]['total']) ?></h4>
    </div>

</body>

</html>