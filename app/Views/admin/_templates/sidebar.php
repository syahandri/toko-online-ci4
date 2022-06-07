<!-- Sidebar -->
<ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar">

   <!-- Sidebar - Brand -->
   <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/web-admin">
      <div class="sidebar-brand-icon">
         <i class="fas fa-store-alt fa-2x"></i>
      </div>
      <div class="sidebar-brand-text mx-2">Web Store</div>
   </a>

   <!-- Divider -->
   <hr class="sidebar-divider my-0">

   <!-- Nav Item - Dashboard -->
   <li class="nav-item <?= url_is('/web-admin') ? 'active' : '' ?>">
      <a class="nav-link" href="/web-admin">
         <i class="fas fa-fw fa-tachometer-alt"></i>
         <span>Dashboard</span>
      </a>
   </li>

   <!-- Divider -->
   <hr class="sidebar-divider">

   <!-- Heading -->
   <div class="sidebar-heading">
      Manage Produk
   </div>

   <!-- Nav Item - Produk -->
   <li class="nav-item <?= url_is('/web-admin/products*') ? 'active' : '' ?>">
      <a class="nav-link" href="/web-admin/products">
         <i class="fas fa-fw fa-box"></i>
         <span>Produk</span>
      </a>
   </li>

   <!-- Nav Item - Kategori -->
   <li class="nav-item <?= url_is('/web-admin/categories*') ? 'active' : '' ?>">
      <a class="nav-link" href="/web-admin/categories">
         <i class="fas fa-fw fa-th-large"></i>
         <span>Kategori</span>
      </a>
   </li>

   <!-- Divider -->
   <hr class="sidebar-divider">

   <!-- Heading -->
   <div class="sidebar-heading">
      Manage Event
   </div>

   <!-- Nav Item - Event -->
   <li class="nav-item <?= url_is('/web-admin/events*') ? 'active' : '' ?>">
      <a class="nav-link" href="/web-admin/events">
         <i class="fas fa-fw fa-calendar-check"></i>
         <span>Event</span>
      </a>
   </li>

   <!-- Divider -->
   <hr class="sidebar-divider">

   <!-- Heading -->
   <div class="sidebar-heading">
      Manage Pesanan
   </div>

   <!-- Nav Item - Pages Collapse Menu -->
   <li class="nav-item <?= url_is('/web-admin/orders*') ? 'active' : '' ?>">
      <a class="nav-link" href="#collapsePesanan" data-toggle="collapse" data-bs-toggle="collapse">
         <i class="fas fa-fw fa-file-alt"></i>
         <span>Pesanan</span>
      </a>
      <div id="collapsePesanan" class="collapse show">
         <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Status Pesanan :</h6>
            <a class="collapse-item" href="/web-admin/orders/verify">Menunggu Verifikasi</a>
            <a class="collapse-item" href="/web-admin/orders/proccess">Diproses</a>
            <a class="collapse-item" href="/web-admin/orders/sent">Dikirim</a>
            <div class="collapse-divider"></div>
         </div>
      </div>
   </li>

   <!-- Divider -->
   <hr class="sidebar-divider d-none d-md-block">

   <div class="sidebar-heading">
      Manage Laporan
   </div>

   <!-- Report -->
   <li class="nav-item <?= url_is('/web-admin/report/sales') ? 'active' : '' ?>">
      <a class="nav-link" href="/web-admin/report/sales">
         <i class="fas fa-file-pdf"></i>
         <span>Penjualan</span>
      </a>
   </li>

   <li class="nav-item <?= url_is('/web-admin/report/users') ? 'active' : '' ?>">
      <a class="nav-link" href="/web-admin/report/users">
         <i class="fas fa-file-pdf"></i>
         <span>Rekap User dan Member</span>
      </a>
   </li>

   <!-- Divider -->
   <hr class="sidebar-divider d-none d-md-block">

   <!-- Sidebar Toggler (Sidebar) -->
   <div class="text-center d-none d-md-inline">
      <button class="rounded-circle border-0" id="sidebarToggle"></button>
   </div>

</ul>
<!-- End of Sidebar -->