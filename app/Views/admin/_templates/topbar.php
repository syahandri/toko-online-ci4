<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>

    <h1 class="h3 text-gray-800"><?= $title; ?></h1>

    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">

        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#userCollapse" role="button" data-bs-toggle="collapse">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><?= user()->username ?></span>
                <img class="img-profile rounded-circle" src="/img/foto-profile/<?= user()->picture ?>">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" id="userCollapse">
                <a class="dropdown-item" href="/web-admin/users/manage">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    Manage User
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="/logout">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    Logout
                </a>
            </div>
        </li>

    </ul>

</nav>
<!-- End of Topbar -->