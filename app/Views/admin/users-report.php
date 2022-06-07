<?= $this->extend('admin/_templates/main') ?>

<?= $this->section('page') ?>

<div class="container-fluid">
   <div class="row">
      <div class="col">
         <div class="card card-body shadow border-0">
            <div class="table-responsive">
               <table class="table table-striped table-hover table-sm" id="tableUsersReport">
                  <thead class="thead-dark">
                     <tr>
                        <th>#</th>
                        <th>Nama Lengkap</th>
                        <th>Role User</th>
                        <th>Tanggal Registrasi</th>
                        <th>Tanggal Bergabung Member</th>
                     </tr>
                  </thead>
                  <tbody>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
</div>
<?= $this->endSection() ?>