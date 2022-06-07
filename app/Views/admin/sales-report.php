<?= $this->extend('admin/_templates/main') ?>

<?= $this->section('page') ?>
<div class="container-fluid">
   <div class="row">
      <div class="col">
         <div class="card card-body shadow border-0">
            <div class="table-responsive">
               <table class="table table-striped table-hover table-sm" id="tableSalesReport">
                  <thead class="thead-dark">
                     <tr>
                        <th>#</th>
                        <th>Produk</th>
                        <th>Stok</th>
                        <th>Terjual</th>
                        <th>Tanggal Transaksi</th>
                     </tr>
                  </thead>
                  <tbody></tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
</div>
<?= $this->endSection() ?>