<div class="modal fade" id="modalCheckout" tabindex="-1">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Detail Pesanan</h5>
            </div>
            <div class="modal-body">
                <div class="alert alert-warning" role="alert">
                    <h5 class="alert-heading text-center">Anda bisa melakukan pembayaran melalui salah satu bank di
                        bawah ini.</h6>
                        <hr>
                        <p class="my-0 text-center">Jika anda sudah melakukan pembayaran, segera konfirmasi di menu
                            <a href="/order/confirm" class="alert-link">Konfirmasi Pembayaran</a> agar pesanan segera diproses.
                        </p>
                </div>
                <div class="alert alert-danger" role="alert">
                    <p class="my-0 text-center">Harap melakukan konfirmasi pembayaran sebelum tanggal <strong id="deadline-tgl">tanggal</strong> pukul <strong id="deadline-jam">Jam</strong>. Jika
                        melewati batas waktu, pesanan akan dibatalkan.
                    </p>
                </div>
                <div class="row">
                    <div class="col-md-4 mb-2">
                        <div class="card card-body">
                            <h5 class="card-title"><img src="img/bri-logo.png" class="rounded img-thumbnail bank-logo" alt=""> BRI</h5>
                            <p class="card-text mb-0">No. Rekening : 0393884384293939239</p>
                            <p class="card-text mb-0">Atas Nama : Ndog</p>

                        </div>
                    </div>
                    <div class="col-md-4 mb-2">
                        <div class="card card-body">
                            <h5 class="card-title"><img src="img/bca-logo.png" class="rounded img-thumbnail bank-logo" alt=""> BCA</h5>
                            <p class="card-text mb-0">No. Rekening : 0393884384293939239</p>
                            <p class="card-text mb-0">Atas Nama : Ndog</p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-2">
                        <div class="card card-body">
                            <h5 class="card-title"><img src="img/mandiri-logo.png" class="rounded img-thumbnail bank-logo" alt=""> Mandiri</h5>
                            <p class="card-text mb-0">No. Rekening : 0393884384293939239</p>
                            <p class="card-text mb-0">Atas Nama : Ndog</p>
                        </div>
                    </div>
                </div>
                <hr>

                <div class="info-order">

                </div>

                <div class="row">
                    <div class="col-md table-responsive">
                        <table class="table table-sm table-bordered">
                            <thead class="table-secondary">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Produk</th>
                                    <th scope="col">Ukuran</th>
                                    <th scope="col">Warna</th>
                                    <th scope="col">Harga</th>
                                    <th scope="col">Jumlah</th>
                                    <th scope="col">Grand Total</th>
                                    <th scope="col">Catatan</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>

                    <div class="info-total">

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary px-4">OK</button>
                <a href="" role="button" class="btn btn-success px-4">Cetak PDF</a>
            </div>
        </div>
    </div>
</div>