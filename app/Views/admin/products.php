<?= $this->extend('admin/_templates/main') ?>

<?= $this->section('page') ?>

<div class="container-fluid">
   <div class="row">
      <div class="col">
         <div class="card card-body shadow border-0">
            <div class="row mb-2">
               <div class="col-12">
                  <?php if (session()->getFlashdata('info')) : ?>
                     <div class="alert alert-success alert-dismissible fade show mb-2" role="alert">
                        <?= session()->getFlashdata('info') ?>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                     </div>
                  <?php endif ?>
                  <a href="/web-admin/products/add" class="btn btn-primary btn-sm"><i class="fas fa-plus"></i> Tambah produk</a>
               </div>
            </div>
            <div class="table-responsive">
               <table class="table table-striped table-hover table-sm" id="tableProduct">
                  <thead class="thead-dark">
                     <tr>
                        <th>#</th>
                        <th>Nama</th>
                        <th>Kategori</th>
                        <th>Harga</th>
                        <th>Diskon</th>
                        <th>Berat</th>
                        <th>Stok</th>
                        <th>Terjual</th>
                        <th>Opsi</th>
                     </tr>
                  </thead>
                  <tbody></tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
</div>

<!-- Modal detail produk-->
<div class="modal fade" id="modalProduct" tabindex="-1">
   <div class="modal-dialog modal-lg modal-dialog-scrollable">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title"></h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">

         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-success btn-sm px-3" data-bs-dismiss="modal">OK</button>
         </div>
      </div>
   </div>
</div>

<?= $this->endSection() ?>