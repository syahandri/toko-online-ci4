<nav class="navbar navbar-expand d-none d-md-block navbar-dark bg-dark-purple">
   <div class="container-fluid">
      <div class="navbar-nav small me-auto">
         <span class="nav-link">
            <i class="fas fa-phone-alt text-warning me-1"></i> +62 812-2559-2522
         </span>
         <span class="nav-link">
            <i class="fas fa-envelope text-warning me-1"></i> kawanbikers@gmail.com
         </span>
         <span class="nav-link">
            <i class="fas fa-clock text-warning me-1"></i> Senin - Sabtu, 08:00 - 17:00 WIB
         </span>
      </div>
      <div class="navbar-nav">
         <span class="nav-link small">Social link</span>
         <a href="https://www.instagram.com/kawanbaikers_indonesia/" target="_blank" class="nav-link"><i class="fab fa-instagram"></i></a>
         <a href="https://www.facebook.com/groups/210458490163366/" target="_blank" class="nav-link"><i class="fab fa-facebook"></i></a>
      </div>
   </div>
</nav>
<nav class="navbar navbar-expand-lg navbar-dark bg-purples py-2 shadow sticky-top">
   <div class="container-fluid">
      <a class="navbar-brand text-warning fs-2 fw-bold" href="/">Web Store</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse small" id="navbarCollapse">
         <div class="navbar-nav">
            <a class="nav-link <?= url_is('/') ? 'active' : ''; ?>" href="/">Beranda</a>
            <a class="nav-link <?= url_is('/product/newest') ? 'active' : ''; ?>" href="<?= !url_is('/') ? '/product/newest' : '#terbaru'; ?>">Terbaru</a>
            <a class="nav-link <?= url_is('/product/bestseller') ? 'active' : ''; ?>" href="<?= !url_is('/') ? '/product/bestseller' : '#terlaris'; ?>">Terlaris</a>
            <a class="nav-link <?= url_is('/product/cheapest') ? 'active' : ''; ?>" href="<?= !url_is('/') ? '/product/cheapest' : '#termurah'; ?>">Termurah</a>
            <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Kategori
               </a>
               <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdownMenuLink">
                  <?php foreach ($categories as $category) : ?>
                     <li><a class="dropdown-item" href="/product/category/<?= $category['slug']; ?>"><?= $category['name']; ?></a></li>
                  <?php endforeach; ?>
               </ul>
            </li>
            <a class="nav-link <?= url_is('/order/confirm') ? 'active' : ''; ?>" href="/order/confirm">Konfirmasi Pembayaran</a>
         </div>

         <?php if (logged_in()) : ?>
            <div class="navbar-nav ms-auto">
               <a href="/cart" class="nav-link position-relative me-lg-2 mt-lg-2">
                  <i class="fas fa-shopping-cart fa-lg d-none d-lg-inline"></i>
                  <span class="position-absolute top-2 start-75 translate-middle badge rounded-pill bg-danger d-none d-lg-inline count-cart">
                     0
                  </span>
                  <span class="d-lg-none d-inline">Keranjang</span>
               </a>
            </div>
            <div class="navbar-nav dropdown">
               <a class="nav-link" href="/profile" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  <img class="rounded-circle d-none d-lg-inline me-lg-2 mt-lg-1" src="/img/foto-profile/<?= user()->picture ?>" alt="profile">
                  <span class="d-lg-none d-inline"><?= user()->fullname ?></span>
               </a>
               <ul class="dropdown-menu dropdown-menu-dark">
                  <li><a class="dropdown-item" href="/profile"><?= user()->fullname ?></a></li>
                  <li><a class="dropdown-item" href="/logout">Logout</a></li>
               </ul>
            </div>
         <?php else : ?>
            <a href="/login" type="button" class="ms-auto btn btn-danger btn-sm rounded-pill px-3"><i class="fas fa-sign-in-alt"></i> Login</a>
         <?php endif; ?>

         <form class="mt-2 mt-lg-0 ms-lg-2" action="/product/search" method="get">
            <div class="input-group">
               <input class="form-control form-control-sm" type="search" name="keyword" placeholder="Search" value="<?= $keyword; ?>">
               <button class="btn bg-light-purple btn-sm" type="submit"><i class="fas fa-search text-light"></i></button>
            </div>
         </form>
      </div>
   </div>
</nav>