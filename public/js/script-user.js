// Offcanvas detail produk
const offcanvasProductDetail = document.getElementById('offcanvasProductDetail')
const detailProduct = new bootstrap.Offcanvas(offcanvasProductDetail)

/**
 * Tombol Pesan
 * Tampilkan detail produk di offcanvas
 */
const formAddToCart = document.getElementById('formAddCart')
const btnOrderProduct = document.querySelectorAll('.btn-order-product')
btnOrderProduct.forEach(order => order.addEventListener('click', async function (e) {
    e.preventDefault()
    formAddToCart.reset() // reset form
    detailProduct.show()
    const slug = this.dataset.slug
    const url = `/product/${slug}`

    // ambil detail produk dan tampilkan ke offcanvas
    addPlaceholder() // tambahkan loading saat proses request
    const detailProduk = await requestData(url, 'GET')
    showDetail(detailProduk)
    removePlaceholder() // hilangkan loading setelah selesai request
}))

/**
 * Tampilkan foto produk 1, 2, 3 ke foto utama
 * Saat diklik
 */
const productImg = document.querySelector('#offcanvasProductDetail .img-product')
const otherImg = document.querySelectorAll('#offcanvasProductDetail .img-other')
otherImg.forEach(img => img.addEventListener('click', function () {
    productImg.src = this.src
}))

/**
 * Validasi input qty di detail produk
 * qty == 0 => disable tombol tambah ke keranjang
 * qty > stok => value qty = stok
 */
const btnAddToCart = document.querySelector('#offcanvasProductDetail button[type="submit"]')
const qtyOrder = document.querySelector('#offcanvasProductDetail input[name="qty"]')
let stock = 0
qtyOrder.addEventListener('input', function () {
    onlyNumber(this)
    if (this.value == 0 || this.value == '') {
        btnAddToCart.disabled = true
    } else {
        btnAddToCart.disabled = false
    }
    this.value = parseInt(this.value) > stock ? stock : this.value
})

// Tambah produk ke keranjang
formAddToCart.addEventListener('submit', async function (e) {
    e.preventDefault()
    const formData = new FormData(this)
    const url = '/cart'

    try {
        await requestData(url, 'POST', formData)
        alert('success', 'Sukses', 'Produk ditambahkan ke keranjang.')
        countCart();
    } catch (error) {
        alert('error', 'Oops', 'Gagal menambahkan ke keranjang, silahkan coba lagi. \n Jika masalah berlanjut, hubungi kami!')
    }

    detailProduct.hide()
})

/**
 * Tombol pilih item
 * aktif ? isi object selectProduct : hapus isi selectProduct
 */

// element produk di keranjang
const idProductCheckout = document.querySelectorAll('#formCheckout input[name="id"]')
const weightProductCheckout = document.querySelectorAll('#formCheckout input[name="weight"]')
const priceProductCheckout = document.querySelectorAll('#formCheckout input[name="price"]')
const noteProductCheckout = document.querySelectorAll('#formCheckout input[name="note"]')
const colorProductCheckout = document.querySelectorAll('#formCheckout input[name="color"]')
const sizeProductCheckout = document.querySelectorAll('#formCheckout input[name="size"]')
const selectItems = document.querySelectorAll('.select-item-cart')

// variabel untuk menampung
let selectProducts = {}
let jmlSelectItem = selectItems.length
let checkedSelectItem = 0
let beratTotal = 0
let total = 0
selectItems.forEach((selectItem, i) => selectItem.addEventListener('change', async function () {
    // jika selectItem aktif, isi selectProducts dengan produk yang dipilih
    if (this.checked) {
        courier.disabled = false
        checkedSelectItem++
        selectProducts[i] = {
            product_id: idProductCheckout[i].value,
            color: colorProductCheckout[i].value,
            size: sizeProductCheckout[i].value,
            price: parseInt(priceProductCheckout[i].value),
            quantity: parseInt(qtyProductCheckout[i].value),
            weight: weightProductCheckout[i].value * qtyProductCheckout[i].value,
            note: noteProductCheckout[i].value,
            grand_total: priceProductCheckout[i].value * qtyProductCheckout[i].value
        }

        beratTotal += selectProducts[i].weight
        total += selectProducts[i].grand_total

    } else {
        //  jika selectItem non-aktif, hapus produk yang dipilih dari selectProducts
        checkedSelectItem--
        beratTotal -= selectProducts[i].weight
        total -= selectProducts[i].grand_total
        delete selectProducts[i]

        // jika selectProducts = 0, clear detail ongkir
        if (Object.keys(selectProducts).length < 1) {
            clearJenisPengiriman()
            clearOngkir()
            courier.selectedIndex = 0
            courier.disabled = true
            jenisPengiriman.disabled = true
        }
    }

    /**
     * Jika ongkir sudah dihitung, dan selectItem aktif / non-aktif
     * hitung ulang ongkir sesuai produk yang dipilih
     */
    if (jenisPengiriman.value) {
        const formData = new FormData()
        const i = jenisPengiriman.options[jenisPengiriman.selectedIndex].dataset.id

        formData.append('destination', tujuan.value)
        formData.append('weight', beratTotal)
        formData.append('courier', courier.value)

        try {
            clearOngkir()
            const data = await requestData('/cart/ongkir', 'POST', formData)
            detailOngkir(data, i)
        } catch (error) {
            alert('error', 'Oops', error)
        }
    }
}))

/**
 * Validasi qty di checkout
 * qty == 0 => disable tombol checkout
 * qty > stok => value qty = stok
 */
const qtyProductCheckout = document.querySelectorAll('#formCheckout input[name="qty"]')
const stockProductCheckout = document.querySelectorAll('#formCheckout input[name="stock"]')
qtyProductCheckout.forEach((qty, i) => qty.addEventListener('input', async function () {
    onlyNumber(this)
    this.value = parseInt(this.value) > parseInt(stockProductCheckout[i].value) ? stockProductCheckout[i].value : this.value
    this.value = parseInt(this.value) == 0 || !this.value ? 1 : this.value

    /**
     * jika selectItem aktif
     * hitung ulang qty, berat, grand_total, berat_total dan total
     */
    if (selectItems[i].checked) {
        beratTotal -= selectProducts[i].weight
        total -= selectProducts[i].grand_total

        selectProducts[i].quantity = parseInt(this.value)
        selectProducts[i].weight = weightProductCheckout[i].value * this.value
        selectProducts[i].grand_total = priceProductCheckout[i].value * this.value

        beratTotal += selectProducts[i].weight
        total += selectProducts[i].grand_total

        /**
         * Jika ongkir sudah dihitung, dan qty diubah
         * hitung ulang ongkir sesuai produk yang dipilih
         */
        if (jenisPengiriman.value && this.value) {
            this.value ? btnCheckout.disabled = false : btnCheckout.disabled = true
            const formData = new FormData()
            const i = jenisPengiriman.options[jenisPengiriman.selectedIndex].dataset.id

            formData.append('destination', tujuan.value)
            formData.append('weight', beratTotal)
            formData.append('courier', courier.value)

            try {
                clearOngkir()
                const data = await requestData('/cart/ongkir', 'POST', formData)
                detailOngkir(data, i)
            } catch (error) {
                alert('error', 'Oops', error)
            }
        }
    }

}))

/**
 * Element note / catatan
 * isi catatan ke selectProducts
 */
const notes = document.querySelectorAll('#formCheckout input[name="note"]')
notes.forEach((note, i) => note.addEventListener('input', function () {
    if (selectItems[i].checked) {
        selectProducts[i].note = this.value
    }
}))

/**
 * Tombol hapus item
 * hapus produk yang dipilih dari keranjang
 */
const removeItems = document.querySelectorAll('#formCheckout .remove-item-cart')
removeItems.forEach((removeItem, i) => removeItem.addEventListener('click', async function (e) {
    e.preventDefault()
    const formData = new FormData()

    formData.append('product_id', idProductCheckout[i].value)
    formData.append('size', sizeProductCheckout[i].value)
    formData.append('color', colorProductCheckout[i].value)

    try {
        const delItem = await requestData('/cart/deleteItem', 'POST', formData)
        delElement(delItem, i)
        countCart()

        /**
         * hitung ulang ongkir sesuai produk yang dipilih
         */
        if (jenisPengiriman.value) {
            const formData = new FormData()
            const i = jenisPengiriman.options[jenisPengiriman.selectedIndex].dataset.id

            formData.append('destination', tujuan.value)
            formData.append('weight', beratTotal)
            formData.append('courier', courier.value)

            try {
                clearOngkir()
                const data = await requestData('/cart/ongkir', 'POST', formData)
                detailOngkir(data, i)
            } catch (error) {
                alert('error', 'Oops', error)
            }
        }

    } catch (error) {
        alert('error', 'Oops', error)
    }
}))

// Cek ongkir
const btnCheckout = document.querySelector('#formCheckout button[type="submit"]')
const courier = document.querySelector('select[name="courier"]')
if (courier) {
    courier.addEventListener('change', async function () {
        if (!tujuan) {
            return alert('error', 'Oops', 'Atur alamat terlebih dahulu!')
        }

        const formData = new FormData()
        const spinner = document.querySelector('.spinner-border-sm')

        formData.append('destination', tujuan.value)
        formData.append('weight', beratTotal)
        formData.append('courier', this.value)

        jenisPengiriman.selectedIndex = 0
        jenisPengiriman.disabled = true
        clearOngkir()

        try {
            spinner.classList.add('spinner-border') // add loading spinner
            const data = await requestData('/cart/ongkir', 'POST', formData)
            getJenisPengiriman(data)
            spinner.classList.remove('spinner-border') // remove spinner
        } catch (error) {
            alert('error', 'Oops', error)
        }
    })
}

const jenisPengiriman = document.querySelector('select[name="shipping_type"]')
const tujuan = document.querySelector('#formCheckout input[name="tujuan"]')
if (jenisPengiriman) {
    jenisPengiriman.addEventListener('change', async function () {
        const formData = new FormData()
        const i = this.options[this.selectedIndex].dataset.id

        formData.append('destination', tujuan.value)
        formData.append('weight', beratTotal)
        formData.append('courier', courier.value)

        try {
            clearOngkir()
            const data = await requestData('/cart/ongkir', 'POST', formData)
            detailOngkir(data, i)
        } catch (error) {
            alert('error', 'Oops', error)
        }
    })
}

// Checkout
const formCheckout = document.getElementById('formCheckout')
if (formCheckout) {
    formCheckout.addEventListener('submit', async function (e) {
        e.preventDefault()
        const formData = new FormData(this)
        const indexObj = Object.keys(selectProducts)

        // isi formData dengan produk yang dipilih
        indexObj.map(i => {
            formData.append('product_id[]', selectProducts[i].product_id)
            formData.append('size[]', selectProducts[i].size)
            formData.append('color[]', selectProducts[i].color)
            formData.append('quantity[]', selectProducts[i].quantity)
            formData.append('price[]', selectProducts[i].price)
            formData.append('note[]', selectProducts[i].note)
            formData.append('grand_total[]', selectProducts[i].grand_total)
        })

        try {
            const data = await requestData('/checkout/checkout', 'POST', formData)
            checkout(data)
        } catch (error) {
            alert('error', 'Oops', error)
        }
    })
}

// Ambil detail produk by invoice
const invoice = document.querySelector('#formConfirm select[name="invoice"]')
if (invoice) {
    invoice.addEventListener('change', async function () {
        if (!this.value) {
            const ongkir = document.querySelector('.ongkir')
            const total = document.querySelector('.total')
            const table = document.querySelector('#tableDetail tbody')

            ongkir.innerHTML = 'Ongkir'
            total.innerHTML = 'Total'
            table.innerHTML = ''

            return false;
        }

        try {
            const data = await requestData(`/checkout/${this.value}`, 'GET')
            detailConfirm(data)
        } catch (error) {
            alert('error', 'Oops', error)
        }

    })
}

// Konfirmasi pembayaran
const formConfirm = document.getElementById('formConfirm')
const spinner = document.querySelector('#formConfirm .spinner-border-sm')
const btnSubmit = document.querySelector('#formConfirm button[type="submit"]')
if (formConfirm) {
    formConfirm.addEventListener('submit', async function (e) {
        e.preventDefault()
        const formData = new FormData(this)

        try {
            spinner.classList.add('spinner-border')
            btnSubmit.disabled = true
            const confirm = await requestData('/order/confirm', 'POST', formData)
            payConfirm(confirm)
        } catch (error) {
            alert('error', 'Oops', error)
        }
    })
}

// Edit profile
const formProfile = document.getElementById('formProfile')
if (formProfile) {
    formProfile.addEventListener('submit', async function (e) {
        e.preventDefault()
        const formData = new FormData(this)
        const btnSubmit = document.querySelector('#formProfile button[type="submit"]')

        try {
            btnSubmit.disabled = true
            btnSubmit.innerHTML = '<span class="spinner-border spinner-border-sm" role="status"></span> Loading...'
            const data = await requestData('/profile', 'POST', formData)
            editProfile(data)

            if (data.status) {
                return location.href = '/profile'
            }

            btnSubmit.disabled = false
            btnSubmit.innerHTML = '<i class="fas fa-save"></i> Simpan'
        } catch (error) {
            alert('error', 'Oops', error)
        }
    })
}

/**
 * Status Pesanan
 * Detail pesanan pending
 */
const btnDetailPending = document.querySelectorAll('#pendingStatus .btn-detail-pending')
btnDetailPending.forEach(btn => btn.addEventListener('click', async function () {
    const invoice = this.dataset.invoice
    const status = this.dataset.status
    const data = await requestData(`/checkout/status/${invoice}/${status}`, 'GET')

    const modalCheckout = new bootstrap.Modal(document.getElementById('modalCheckout'), {
        keyboard: false,
    })

    const btnOk = document.querySelector('#modalCheckout .modal-footer button')
    const btnPrint = document.querySelector('#modalCheckout .modal-footer a')
    await detailCheckout(data)
    modalCheckout.show()
    btnOk.addEventListener('click', () => {
        modalCheckout.hide()
    })

    btnPrint.href = `/checkout/print/${data.data[0].invoice}`
}))

// Detail pesanan
const btnDetail = document.querySelectorAll('.btn-detail')
btnDetail.forEach(btn => btn.addEventListener('click', async function () {
    const invoice = this.dataset.invoice
    const status = this.dataset.status

    const offCanvasDetailStatus = document.getElementById('offCanvasDetailStatus')
    const detailStatus = new bootstrap.Offcanvas(offCanvasDetailStatus)

    const data = await requestData(`/checkout/status/${invoice}/${status}`, 'GET')
    detailStatus.show()
    showDetailStatus(data)
}))

// ###########################################################################################################################################################

// Hitung jumlah produk di keranjang user
countCart()

// Fungsi hitung produk di keranjang user
async function countCart() {
    const cart = document.querySelector('.count-cart')
    if (cart) {
        const count = await requestData('/cart/count-cart', 'GET')
        cart.innerHTML = count.cart_id > 99 ? '99+' : count.cart_id
    }
}

// Hapus pesanan yang melebihi deadline
deleteCheckout()

// Fungsi hapus pesanan yang melebihi deadline
async function deleteCheckout() {
    await requestData('/checkout/delete', 'DELETE')
}

// Fungsi hanya angka
function onlyNumber(input) {
    input.value = input.value.replace(/[^0-9]/g, '')
}

// Fungsi format rupiah
function formatRupiah(input) {
    return new Intl.NumberFormat('id-ID').format(input)
}

// Fungsi format tanggal
function formatDate(date) {

    const options = {
        day: 'numeric',
        year: 'numeric',
        month: 'long',
    }

    return new Date(date).toLocaleString('id-ID', options)
}

// Fungsi request data (GET, HEAD, PUT, POST, DELETE) Fetch API
function requestData(url, method, body) {
    return fetch(url, {
            method: method,
            headers: {
                "X-Requested-With": "XMLHttpRequest"
            },
            body: body
        })
        .then(res => res.json())
        .then(data => {
            if (data === false) {
                throw new Error(`Error : ${ data }`)
            }

            return data
        })
}

// Fungsi tampil detail produk
function showDetail(data) {
    const id = document.querySelector('#offcanvasProductDetail input[name="id"]')
    const name = document.querySelector('#offcanvasProductDetail #productName')
    const category = document.querySelector('#offcanvasProductDetail #productCategory')
    const discountPrice = document.querySelector('#offcanvasProductDetail #productDiscountPrice')
    const price = document.querySelector('#offcanvasProductDetail #productPrice')
    const discount = document.querySelector('#offcanvasProductDetail #productDiscount')
    const size = document.querySelector('#offcanvasProductDetail select[name="size"]')
    const color = document.querySelector('#offcanvasProductDetail .color')
    const desc = document.querySelector('#offcanvasProductDetail #productDesc')
    size.innerHTML = ''
    color.innerHTML = ''

    productImg.src = `/img/foto-produk/${data.product.image_1}`
    otherImg[0].src = `/img/foto-produk/${data.product.image_1}`
    otherImg[1].src = `/img/foto-produk/${data.product.image_2}`
    otherImg[2].src = `/img/foto-produk/${data.product.image_3}`

    id.value = data.product.id
    name.innerHTML = data.product.name
    category.innerHTML = data.product.category
    if (data.in_groups && data.product.discount > 0) {
        discountPrice.innerHTML = `Rp. ${ formatRupiah(Math.round(data.product.price - (data.product.discount / 100 * data.product.price))) }`
        price.innerHTML = `Rp. ${ formatRupiah(data.product.price) }`
        data.product.discount ? (discount.innerHTML = `Diskon ${ data.product.discount }%`, discount.classList.remove('d-none')) : discount.classList.add('d-none')
    } else {
        discountPrice.innerHTML = `Rp. ${ formatRupiah(data.product.price) }`
        price.innerHTML = ''
        discount.classList.add('d-none')
    }

    data.size.forEach(sizeProduct => size.innerHTML += `<option value=${ sizeProduct.name }>${ sizeProduct.name }</option>`)
    data.color.forEach((colorProduct, i) => {
        color.innerHTML += `<div class="form-check form-check-inline mb-0 me-2 placeholder">
                                <input class="form-check-input color bg-${ colorProduct.name } ${ colorProduct.name == 'white' ? 'color-white' : '' }" type="radio" name="color" value=${ colorProduct.name } title="${ colorProduct.name }" required ${ i == 0 ? 'checked' : '' }>
                            </div>`
    })
    desc.innerHTML = data.product.detail
    stock = data.product.stock

    const radioColor = document.querySelectorAll('#offcanvasProductDetail input[name="color"]')
    radioColor.forEach(color => {
        color.checked ? color.style.backgroundColor = color.value : ''
        color.addEventListener('change', function () {
            this.style.backgroundColor = this.value
        })
    })
}

// Fungsi ambil jenis pengiriman berdasarkan kurir
function getJenisPengiriman(data) {

    if (!courier.value) {
        clearOngkir()
        clearJenisPengiriman()
        jenisPengiriman.disabled = true
        jenisPengiriman.selectedIndex = 0

    } else {
        if (data.rajaongkir.status.code != 200) {
            throw new Error(data.rajaongkir.status.description)
        }

        jenisPengiriman.disabled = false
        clearJenisPengiriman()
        data.rajaongkir.results.forEach(result => {
            result.costs.forEach((jenis, i) => {
                jenisPengiriman.innerHTML += `<option data-id=${i} value="${jenis.description}">${jenis.description} - ${jenis.service}</option>`
            })
        })
    }
}

// Element detail ongkir (ditampilkan ke user)
const elOngkir = document.querySelector('#formCheckout .ongkir')
const elEtd = document.querySelector('#formCheckout .etd')
const elTotal = document.querySelector('#formCheckout .total')

// Element input detail ongkir (dikirim ke form)
const inpOngkir = document.querySelector('#formCheckout input[name="ongkir"]')
const inpEtd = document.querySelector('#formCheckout input[name="etd"]')
const inpTotal = document.querySelector('#formCheckout input[name="total"]')

// Fungsi detail ongkir
function detailOngkir(data, i) {
    if (!jenisPengiriman.value) {
        clearOngkir()
    } else {
        if (data.rajaongkir.status.code != 200) {
            throw new Error(data.rajaongkir.status.description)
        }

        data.rajaongkir.results.forEach(result => {
            let ongkir = result.costs[i].cost[0].value
            let etd = result.costs[i].cost[0].etd
            let totalBayar = total + ongkir

            elOngkir.innerHTML = formatRupiah(ongkir)
            elEtd.innerHTML = etd
            elTotal.innerHTML = formatRupiah(totalBayar)

            inpOngkir.value = ongkir
            inpEtd.value = etd
            inpTotal.value = totalBayar

            btnCheckout.disabled = false
        })
    }

}

// Fungsi hapus produk di keranjang dan hapus element
const cardProducts = document.querySelectorAll('.card-product')

function delElement(data, i) {
    if (data) {
        jmlSelectItem--
        if (selectItems[i].checked) {
            checkedSelectItem--
            beratTotal -= selectProducts[i].weight
            total -= selectProducts[i].grand_total
            delete selectProducts[i]

            if (checkedSelectItem < 1) {
                clearJenisPengiriman()
                clearOngkir()
                courier.selectedIndex = 0
                courier.disabled = true
                jenisPengiriman.disabled = true
            }
        }

        if (jmlSelectItem < 1) {
            location.reload()
        }

        cardProducts[i].remove()
    }
}

// Fungsi checkout produk
async function checkout(data) {
    /**
     * Cek stok produk yang dipilih
     * tampil pesan jika stok = 0 / qty > stok
     */
    const alertStock = document.querySelectorAll('#formCheckout .stock-alert')
    if (!data.status) {
        const indexObj = Object.keys(selectProducts)
        indexObj.map(i => {
            if (alertStock[i].dataset.id == data.id) {
                alertStock[i].innerHTML = data.error
                alertStock[i].classList.remove('text-muted')
                alertStock[i].classList.add('text-danger')
                stockProductCheckout[i].value = data.stock
            }

            if (stockProductCheckout[i].value == 0) {
                qtyProductCheckout[i].value = 0
                qtyProductCheckout[i].disabled = true
                selectItems[i].disabled = true
                selectItems[i].checked = false
                checkedSelectItem--

                beratTotal -= selectProducts[i].weight
                total -= selectProducts[i].grand_total
                delete selectProducts[i]
            }
        })

        /**
         * Jika selectItems yang aktif tidak ada
         * hapus detail ongkir
         */
        if (checkedSelectItem < 1) {
            clearJenisPengiriman()
            clearOngkir()
            courier.selectedIndex = 0
            courier.disabled = true
            jenisPengiriman.disabled = true
        } else {
            /**
             * jika selectItems yang aktif ada
             * hitung ulang ongkir
             */
            const formData = new FormData()
            const i = jenisPengiriman.options[jenisPengiriman.selectedIndex].dataset.id

            formData.append('destination', tujuan.value)
            formData.append('weight', beratTotal)
            formData.append('courier', courier.value)

            try {
                clearOngkir()
                const data = await requestData('/cart/ongkir', 'POST', formData)
                detailOngkir(data, i)
            } catch (error) {
                alert('error', 'Oops', error)
            }
        }

    } else {
        /**
         * Jika stok produk yang dipilih tersedia
         * lakukan checkout
         * tampilkan modal detail checkout
         */

        // Element modal checkout
        const modalCheckout = new bootstrap.Modal(document.getElementById('modalCheckout'), {
            keyboard: false,
            backdrop: 'static'
        })

        const btnOk = document.querySelector('#modalCheckout .modal-footer button')
        const btnPrint = document.querySelector('#modalCheckout .modal-footer a')
        await detailCheckout(data)
        modalCheckout.show()
        btnOk.addEventListener('click', () => {
            location.reload()
        })

        btnPrint.href = `/checkout/print/${data.data[0].invoice}`
    }
}

// Fungsi detailCheckout
function detailCheckout(data) {
    const deadlineDate = document.querySelector('#modalCheckout #deadline-tgl')
    const deadlineTime = document.querySelector('#modalCheckout #deadline-jam')
    const orderInfo = document.querySelector('#modalCheckout .info-order')
    const totalInfo = document.querySelector('#modalCheckout .info-total')
    const table = document.querySelector('#modalCheckout .table tbody')

    deadlineDate.innerHTML = data.deadline_date
    deadlineTime.innerHTML = data.deadline_time

    orderInfo.innerHTML = `
        <div class="row mb-4">
            <div class="col-auto me-auto"><span class="fw-bold">Tanggal: ${formatDate(data.data[0].created_at)} </span></div>
            <div class="col-auto"><span class="fw-bold">No. Invoice: ${data.data[0].invoice} </span></div>
        </div>
        <hr>
        <div class="row">
            <div class="col-auto me-auto">
                <h6 class="fw-bold"><span>Dikirim ke:</span></h6>
                <h6>${data.data[0].fullname}</h6>
                <h6>${data.data[0].jalan}</h6>
                <h6>${data.data[0].kecamatan}</h6>
                <h6>${data.data[0].kabupaten}</h6>
                <h6>${data.data[0].provinsi}</h6>
                <h6>${data.data[0].kode_pos}</h6>
            </div>
            <div class="col-auto text-md-end">
                <span class="fw-bold">Ekspedisi:</span>
                <p class="mb-0">Kurir: ${data.data[0].courier.toUpperCase()}</p>
                <p class="mb-0">Layanan: ${data.data[0].shipping_type}</p>
                <p class="mb-0">Estimasi: ${data.data[0].estimate_date} (hari)</p>
            </div>
        </div>`

    table.innerHTML = ''
    data.data.map((data, i) => {
        table.innerHTML += `
            <tr>
                <td>${i + 1}</td>
                <td>${data.product}</td>
                <td>${data.size}</td>
                <td>${data.color}</td>
                <td>Rp. ${formatRupiah(data.price)}</td>
                <td>${data.quantity}</td>
                <td>Rp. ${formatRupiah(data.grand_total)}</td>
                <td>${data.note}</td>
            </tr>`
    })

    totalInfo.innerHTML = `
    <hr>
    <div class="text-end">
        <h5 class="fw-bold mb-3">Ongkir: Rp. ${formatRupiah(data.data[0].cost)}</h5>
        <h4 class="fw-bold">Total: Rp. ${formatRupiah(data.data[0].total)}</h4>
    </div>`
}

// Fungsi konfirmasi pembayaran
function payConfirm(data) {
    // Cek validasi input
    if (data.invalid) {
        if (data.invalid.invoice) {
            const inputInvoice = document.querySelector('#formConfirm select[name="invoice"]')
            const invalidInvoice = document.querySelector('#formConfirm .invalid-invoice')
            inputInvoice.classList.add('is-invalid')
            invalidInvoice.innerHTML = data.invalid.invoice
        }

        if (data.invalid.bank) {
            const inputBank = document.querySelector('#formConfirm input[name="bank"]')
            const invalidBank = document.querySelector('#formConfirm .invalid-bank')
            inputBank.classList.add('is-invalid')
            invalidBank.innerHTML = data.invalid.bank
        }

        if (data.invalid.name) {
            const inputName = document.querySelector('#formConfirm input[name="name"]')
            const invalidName = document.querySelector('#formConfirm .invalid-name')
            inputName.classList.add('is-invalid')
            invalidName.innerHTML = data.invalid.name
        }

        if (data.invalid.image_transfer) {
            const inputImage = document.querySelector('#formConfirm input[name="image_transfer"]')
            const invalidImage = document.querySelector('#formConfirm .invalid-image')
            inputImage.classList.add('is-invalid')
            invalidImage.innerHTML = data.invalid.image_transfer
        }

        spinner.classList.remove('spinner-border')
        btnSubmit.disabled = false
        return false
    }

    // Cek status konfirmasi
    if (data.status) {
        return alert('success', 'Sukses', data.confirm, true)
    } else {
        return alert('error', 'Oops', data.confirm, true)
    }
}

// Fungsi detail konfirmasi pembayaran
function detailConfirm(data) {
    const ongkir = document.querySelector('.ongkir')
    const total = document.querySelector('.total')
    const table = document.querySelector('#tableDetail tbody')

    table.innerHTML = ''
    data.map((data, i) => {
        table.innerHTML += `
            <tr>
                <td>${i + 1}</td>
                <td>${data.product}</td>
                <td>${data.size}</td>
                <td>${data.color}</td>
                <td>Rp. ${formatRupiah(data.price)}</td>
                <td>${data.quantity}</td>
                <td>Rp. ${formatRupiah(data.grand_total)}</td>
                <td>${data.note}</td>
            </tr>`
    })

    ongkir.innerHTML = `Rp. ${formatRupiah(data[0].cost)}`
    total.innerHTML = `Rp. ${formatRupiah(data[0].total)}`
}
// Fungsi edit profile
function editProfile(data) {
    if (data.invalid) {
        if (data.invalid.fullname) {
            const fullname = document.querySelector('#formProfile #fullname')
            const invalidFullname = document.querySelector('#formProfile .invalid-fullname')
            fullname.classList.add('is-invalid')
            invalidFullname.innerHTML = data.invalid.fullname
        }

        if (data.invalid.username) {
            const username = document.querySelector('#formProfile #username')
            const invalidUsername = document.querySelector('#formProfile .invalid-username')
            username.classList.add('is-invalid')
            invalidUsername.innerHTML = data.invalid.username
        }

        if (data.invalid.email) {
            const email = document.querySelector('#formProfile #email')
            const invalidEmail = document.querySelector('#formProfile .invalid-email')
            email.classList.add('is-invalid')
            invalidEmail.innerHTML = data.invalid.email
        }

        if (data.invalid.phone) {
            const phone = document.querySelector('#formProfile #phone')
            const invalidPhone = document.querySelector('#formProfile .invalid-phone')
            phone.classList.add('is-invalid')
            invalidPhone.innerHTML = data.invalid.phone
        }

        if (data.invalid.picture) {
            const picture = document.querySelector('#formProfile #picture')
            const invalidPicture = document.querySelector('#formProfile .invalid-picture')
            picture.classList.add('is-invalid')
            invalidPicture.innerHTML = data.invalid.picture
        }

        if (data.invalid.jalan) {
            const jalan = document.querySelector('#formProfile #jalan')
            const invalidJalan = document.querySelector('#formProfile .invalid-jalan')
            jalan.classList.add('is-invalid')
            invalidJalan.innerHTML = data.invalid.jalan
        }

        if (data.invalid.provinsi) {
            const provinsi = document.querySelector('#formProfile #provinsi')
            const invalidProvinsi = document.querySelector('#formProfile .invalid-provinsi')
            provinsi.classList.add('is-invalid')
            invalidProvinsi.innerHTML = data.invalid.provinsi
        }

        if (data.invalid.kabupaten) {
            const kabupaten = document.querySelector('#formProfile #kabupaten')
            const invalidKabupatenicture = document.querySelector('#formProfile .invalid-kabupaten')
            kabupaten.classList.add('is-invalid')
            invalidKabupatenicture.innerHTML = data.invalid.kabupaten
        }

        if (data.invalid.kecamatan) {
            const kecamatan = document.querySelector('#formProfile #kecamatan')
            const invalidKecamatan = document.querySelector('#formProfile .invalid-kecamatan')
            kecamatan.classList.add('is-invalid')
            invalidKecamatan.innerHTML = data.invalid.kecamatan
        }

        if (data.invalid.kode_pos) {
            const kodePos = document.querySelector('#formProfile #kode_pos')
            const invalidKodePos = document.querySelector('#formProfile .invalid-kode_pos')
            kodePos.classList.add('is-invalid')
            invalidKodePos.innerHTML = data.invalid.kode_pos
        }

        return false
    }
}

/**
 * Edit profile
 * tampil data kabupaten berdasarkan provinsi dari API raja ongkir
 */
getKabupaten()

/**
 * Fungsi ambil data kabupaten dari API raja ongkir
 * ambil data kabupaten berdasarkan provinsi yang dipilih
 * simpan ke datalist kabupaten
 */
async function getKabupaten() {
    try {
        const provinsi = document.getElementById('provinsi')
        const kabupaten = document.getElementById('kabupaten')
        const kodeProvinsi = document.querySelector('input[name="kode_provinsi"]')
        const kodeKabupaten = document.querySelector('input[name="kode_kabupaten"]')
        if (provinsi) {
            provinsi.addEventListener('change', async function () {
                if (this.value) {
                    kabupaten.disabled = true
                    kodeKabupaten.value = ''
                    kabupaten.innerHTML = '<option value="">-- Pilih Kabupaten --</option>'
                    kodeProvinsi.value = this.options[this.selectedIndex].dataset.id
                    const kab = await requestData(`/kabupaten/${kodeProvinsi.value}`, 'GET')
                    kab.rajaongkir.results.map(kab => kabupaten.innerHTML += `<option data-id="${kab.city_id}" value="${kab.city_name}">${kab.city_name} - ${kab.type}</option>`)
                    kabupaten.disabled = false
                } else {
                    kodeKabupaten.value = ''
                    kabupaten.innerHTML = '<option value="">-- Pilih Kabupaten --</option>'
                    kabupaten.disabled = true
                }
            })

            kabupaten.addEventListener('change', function () {
                if (this.value) {
                    kodeKabupaten.value = this.options[this.selectedIndex].dataset.id
                }
            })
        }

    } catch (error) {
        alert('error', 'Oops', error)
    }

}

// Fungsi detail status pesanan
function showDetailStatus(data) {
    const offcanvasBody = document.querySelector('#offCanvasDetailStatus .offcanvas-body')

    let content = `
        <div class="row mb-2">
            <div class="col-sm-6 me-sm-auto">
                <h6 class="fw-bold">Tanggal Pesanan</h6>
                <p>${formatDate(data.data[0]['created_at'])}</p>
            </div>
            <div class="col-sm-6 text-sm-end">
                <h6 class="fw-bold">Invoice</h6>
                <p>${data.data[0]['invoice']}</p>

                <h6 class="fw-bold">Nomor Resi</h6>
                <p>${data.data[0]['resi_number']}</p>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-sm table-border">
                <thead class="table-secondary">
                    <tr>
                        <th>#</th>
                        <th>Produk</th>
                        <th>Ukuran</th>
                        <th>Warna</th>
                        <th>Harga</th>
                        <th>Quantity</th>
                        <th>Grand Total</th>
                        <th>Catatan</th>
                    </tr>
                </thead>
                <tbody>`

    data.data.map((data, i) => {
        content += `
                <tr>
                    <td>${i + 1}</td>
                    <td>${data.product}</td>
                    <td>${data.size}</td>
                    <td>${data.color}</td>
                    <td>Rp. ${formatRupiah(data.price)}</td>
                    <td>${data.quantity}</td>
                    <td>Rp. ${formatRupiah(data.grand_total)}</td>
                    <td>${data.note}</td>
                </tr>`
    })

    content += `
        </tbody>
            </table>
        </div>
        <h6 class="text-end fw-bold">Ongkir: Rp. ${formatRupiah(data.data[0]['cost'])}</h6>
        <h5 class="text-end fw-bold">Total: Rp. ${formatRupiah(data.data[0]['total'])}</h5>`

    offcanvasBody.innerHTML = content

}

// Fungsi clear jenis pengiriman
function clearJenisPengiriman() {
    jenisPengiriman.innerHTML = ''
    jenisPengiriman.innerHTML = '<option value="">-- Pilih jenis pengiriman --</option>'
}

// Fungsi clear detail ongkir
function clearOngkir() {
    elOngkir.innerHTML = '-'
    elEtd.innerHTML = '-'
    elTotal.innerHTML = '-'
    inpOngkir.value = ''
    inpEtd.value = ''
    inpTotal.value = ''
    btnCheckout.disabled = true
}

// Fungsi tambahkan loading placeholder ke element
function addPlaceholder() {
    document.querySelectorAll('.loading').forEach(loading => {
        loading.classList.add('placeholder')
        loading.classList.remove('loading')
        loading.classList.add('disabled')
    })
}
// Fungsi hapus loading placeholder di element
function removePlaceholder() {
    document.querySelectorAll('.placeholder').forEach(loading => {
        loading.classList.add('loading')
        loading.classList.remove('placeholder')
        loading.classList.remove('disabled')
    })
}

// Fungsi alert dari sweetalert
function alert(icon, title, text, reload) {
    Swal.fire({
        icon,
        title,
        text,
        allowOutsideClick: false,
        allowEscapeKey: false
    }).then(() => {
        if (reload) {
            location.reload()
        }
    })
}

// Fungsi tampil status pesanan
function showOrderStatus(status) {
    const caption = document.querySelector('.table caption')
    caption.innerHTML = status
}

// Tombol Back to top
const buttonTop = document.getElementById("top")
buttonTop.addEventListener('click', () => topFunction())

window.onscroll = function () {
    scrollFunction()
}

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        buttonTop.style.display = "block"
    } else {
        buttonTop.style.display = "none"
    }
}

function topFunction() {
    document.body.scrollTop = 0 // For Safari
    document.documentElement.scrollTop = 0 // For Chrome, Firefox, IE and Opera
}