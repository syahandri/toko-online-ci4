<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="/fontawesome/css/all.min.css">

    <!-- Style CSS -->
    <link rel="stylesheet" href="/css/style.css">

    <title><?= $title; ?></title>
</head>

<body>

    <!-- Navbar -->
    <?= $this->include('pages/_templates/navbar') ?>

    <!-- Main page -->
    <main class="container-fluid">
        <?= $this->renderSection('page') ?>
    </main>

    <!-- Footer -->
    <?= $this->include('pages/_templates/footer') ?>

    <!-- Back to Top Button -->
    <button class="btn btn-danger btn-lg shadow" id="top"><i class="fas fa-chevron-up"></i></button>

    <!-- Offcanvas Detail Produk -->
    <?= $this->include('pages/offcanvas-detail-product') ?>

    <!-- Bootstrap JS -->
    <script src="/js/bootstrap.bundle.min.js"></script>

    <!-- Font awesome JS -->
    <script src="/fontawesome/js/all.min.js"></script>

    <!-- SweetAlert JS -->
    <script src="/js/sweetalert2.all.min.js"></script>

    <!-- Script JS -->
    <script src="/js/script-user.js"></script>

</body>

</html>