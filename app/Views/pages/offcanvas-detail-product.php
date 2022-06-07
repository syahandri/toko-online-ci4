<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasProductDetail">
    <div class="offcanvas-header">
        <h5>Detail Produk</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
    </div>
    <div class="offcanvas-body placeholder-glow">
        <form action="/cart" method="post" id="formAddCart">
            <?= csrf_field(); ?>
            <input type="hidden" name="id">
            <div class="row">
                <div class="col-6">
                    <div class="card border-0">
                        <div class="position-absolute p-2 text-light bg-danger bg-opacity-75 rounded placeholder" id="productDiscount"></div>
                        <img src="" class="img-fluid img-product rounded placeholder" loading="lazy">
                    </div>
                    <div class="row mt-4">
                        <div class="col-4"><img src="" class="img-fluid img-other rounded placeholder" loading="lazy"></div>
                        <div class="col-4"><img src="" class="img-fluid img-other rounded placeholder" loading="lazy"></div>
                        <div class="col-4"><img src="" class="img-fluid img-other rounded placeholder" loading="lazy"></div>
                    </div>
                </div>
                <div class="col-6">
                    <h4 class="mb-0 fw-bold text-capitalize placeholder" id="productName">Nama Produk</h4>
                    <p class="mt-0 small text-muted placeholder" id="productCategory">Kategori</p>
                    <p class="fs-5 d-inline placeholder" id="productDiscountPrice">Harga Produk Diskon</p>
                    <span class="text-muted text-decoration-line-through small placeholder" id="productPrice">Harga Prorduk</span>
                    <p class="placeholder" id="productColor">Warna :</p>
                    <div class="color">

                    </div>
                    <p class="placeholder" id="productSize">Ukuran :</p>
                    <select class="form-select form-select-sm placeholder" name="size">
                    </select>
                    <p class="placeholder" id="ProductQty">Jumlah :</p>
                    <input type="text" class="form-control form-control-sm placeholder" name="qty" value="1">
                    <?php if (logged_in()) : ?>
                        <button type="submit" class="btn btn-yellow btn-sm mt-3 placeholder disabled"><i class="fas fa-shopping-cart"></i> Tambah ke keranjang</button>
                    <?php else : ?>
                        <a href="/login" class="btn btn-danger btn-sm mt-3 placeholder disabled px-5"><i class="fas fa-sign-in-alt"></i> Login</a>
                    <?php endif; ?>
                </div>
                </label>
            </div>
            <div class="row mt-4">
                <div class="col-12">
                    <h4 class="placeholder">Deskripsi Produk</h4>
                    <p class="placeholder" id="productDesc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nobis facere velit dolore ipsam? Iure eius, unde eligendi exercitationem nobis cumque eos architecto! Quae deserunt vel consectetur provident optio ad eligendi placeat laudantium id aut. Ut enim consequuntur labore. Inventore porro quidem libero laudantium, id asperiores eaque architecto aperiam qui itaque nulla odio! Ipsum excepturi, ipsa laudantium in quibusdam odio fugit eaque totam aspernatur perspiciatis fuga rem modi quo mollitia nemo illum sint distinctio! Doloremque ab error fugiat id? Rerum alias voluptate nam eveniet ea, iure numquam sequi delectus quis ipsa debitis et, ratione temporibus enim, explicabo sit! Deserunt amet asperiores eaque. Eveniet optio ipsum repudiandae aliquam ex eligendi illum iure accusamus nihil fugit, nulla rem? Voluptatem quae, perspiciatis id animi possimus excepturi sequi sed ab nesciunt officia repudiandae quos voluptatibus nemo soluta quisquam a, fugit veritatis mollitia asperiores obcaecati, ipsa sapiente. Dolorem vero modi pariatur, sunt minus quos cupiditate, tenetur, ipsam nostrum quidem adipisci inventore qui eius illum quaerat reiciendis sit debitis perferendis quasi odit eveniet magnam porro. Porro modi laboriosam doloribus aperiam rerum cum aut ipsam necessitatibus alias facere nostrum, officiis, facilis eligendi, illo quam vero. Totam qui modi expedita maxime aut. Fuga asperiores quam, quae sit aperiam debitis.</p>
                </div>
            </div>
        </form>
    </div>
</div>