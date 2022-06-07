<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <!-- Bootstrap CSS -->
   <link href="/css/bootstrap.min.css" rel="stylesheet">

   <!-- Font Awesome -->
   <link rel="stylesheet" href="/fontawesome/css/all.min.css">

   <!-- SB Admin CSS -->
   <link href="/css/sb-admin-2.min.css" rel="stylesheet">

   <!-- Data Tables CSS-->
   <link rel="stylesheet" type="text/css" href="/DataTables/DataTables-1.11.5/css/dataTables.bootstrap5.min.css" />
   <link rel="stylesheet" type="text/css" href="/DataTables/Buttons-2.2.2/css/buttons.bootstrap5.min.css" />
   <link rel="stylesheet" type="text/css" href="/DataTables/FixedColumns-4.0.2/css/fixedColumns.bootstrap5.min.css" />
   <link rel="stylesheet" type="text/css" href="/DataTables/FixedHeader-3.2.2/css/fixedHeader.bootstrap5.min.css" />

   <!-- Date picker jquery CSS -->
   <link rel="stylesheet" href="/css/jquery-ui.min.css">

   <!-- Trix CSS -->
   <link href="/css/trix.css" rel="stylesheet">

   <!-- Style CSS -->
   <link href="/css/style.css" rel="stylesheet">

   <title><?= $title ?></title>
</head>

<body>

   <div id="wrapper">


      <!-- Sidebar -->
      <?= $this->include('admin/_templates/sidebar') ?>

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">

         <!-- Main Content -->
         <div id="content">
            <!-- Topbar -->
            <?= $this->include('admin/_templates/topbar') ?>

            <!-- Main Page -->
            <?= $this->renderSection('page') ?>

         </div>

         <!-- Footer -->
         <?= $this->include('admin/_templates/footer') ?>

      </div>

   </div>


   <!-- Jquery -->
   <script src="/js/jquery.min.js"></script>

   <!-- Bootstrap JS -->
   <script src="/js/bootstrap.bundle.min.js"></script>

   <!-- Jquery easing -->
   <script src="/js/jquery.easing.min.js"></script>

   <!-- Font awesome JS -->
   <script src="/fontawesome/js/all.min.js"></script>

   <!-- SB Admin JS -->
   <script src="/js/sb-admin-2.min.js"></script>

   <!-- Data Tables JS -->
   <script type="text/javascript" src="/DataTables/pdfmake-0.1.36/pdfmake.min.js"></script>
   <script type="text/javascript" src="/DataTables/pdfmake-0.1.36/vfs_fonts.js"></script>
   <script type="text/javascript" src="/DataTables/DataTables-1.11.5/js/jquery.dataTables.min.js"></script>
   <script type="text/javascript" src="/DataTables/DataTables-1.11.5/js/dataTables.bootstrap5.min.js"></script>
   <script type="text/javascript" src="/DataTables/Buttons-2.2.2/js/dataTables.buttons.min.js"></script>
   <script type="text/javascript" src="/DataTables/Buttons-2.2.2/js/buttons.bootstrap5.min.js"></script>
   <script type="text/javascript" src="/DataTables/Buttons-2.2.2/js/buttons.html5.min.js"></script>
   <script type="text/javascript" src="/DataTables/Buttons-2.2.2/js/buttons.print.min.js"></script>
   <script type="text/javascript" src="/DataTables/FixedColumns-4.0.2/js/fixedColumns.bootstrap5.min.js"></script>
   <script type="text/javascript" src="/DataTables/FixedHeader-3.2.2/js/fixedHeader.bootstrap5.min.js"></script>
   
   <!-- Date picker jquery -->
   <script src="/js/jquery-ui.min.js"></script>
   
   <!-- Trix Editor -->
   <script src="/js/trix.js"></script>

   <!-- SweetAlert JS -->
   <script src="/js/sweetalert2.all.min.js"></script>

   <!-- My Script -->
   <script src="/js/script-admin.js"></script>


</body>

</html>