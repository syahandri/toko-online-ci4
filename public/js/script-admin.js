// Options data table
const options = {
   'serverSide': true,
   'order': [],
   'pagingType': 'simple_numbers',
   'ajax': {
      'url': '',
      'type': 'GET'
   },
   columnDefs: [{
      orderable: false,
      targets: ''
   }],
   fixedHeader: true,
   fixedColumn: true,
}

// Element dom data table
let dom = "<'row row-length'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
   "<'row'<'col-sm-12'tr>>" +
   "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>"

// Option date picker
const datePickerOptions = {
   dateFormat: "yy-mm-dd",
   changeYear: true,
   showAnim: "slideDown",
   gotoCurrent: true,
   showOn: "button",
   buttonImage: "/img/calender.gif",
   buttonImageOnly: true,
   buttonText: "Select date",
   dateFormat: "yy-mm-dd",
   showAnim: "slideDown",
   gotoCurrent: true,
   showOn: "button",
   buttonImage: "/img/calender.gif",
   buttonImageOnly: true,
   buttonText: "Select date",
}

// url request data
const url = {
   product: {
      list: '/web-admin/getProducts',
      find: '/product/',
      delete: '/web-admin/products/delete/'
   },
   category: {
      list: '/web-admin/listCategories',
      find: '/web-admin/categories/',
      save: '/web-admin/categories/store',
      delete: '/web-admin/categories/delete/',
   },
   event: {
      list: '/web-admin/listEvents',
      find: '/web-admin/events/',
      save: '/web-admin/events/store',
      delete: '/web-admin/events/delete/',
      publish: '/web-admin/events/publish'
   },
   orderVerify: {
      list: '/web-admin/listOrdersVerify',
      find: '/web-admin/orders/verify/',
      verify: '/web-admin/orders/verify/confirm/',
      cancel: '/web-admin/orders/verify/cancel/'
   },
   orderProccess: {
      list: '/web-admin/listOrdersProccess',
      find: '/web-admin/orders/proccess/',
      send: '/web-admin/orders/proccess/send',
   },
   orderSent: {
      list: '/web-admin/listOrdersSent',
      find: '/web-admin/orders/sent/',
   },
   historyUser: {
      list: '/web-admin/history/users'
   },
   historySale: {
      list: '/web-admin/history/sales'
   }
}

// Data table product
options.ajax.url = url.product.list
options.columnDefs[0].targets = [0, 8]
const tableProduct = $('#tableProduct').DataTable(options)

// Data table category
options.ajax.url = url.category.list
options.columnDefs[0].targets = [0, 2]
const tableCategory = $('#tableCategory').DataTable(options)

// Data table event
options.ajax.url = url.event.list
options.columnDefs[0].targets = [0, 5]
options.buttons = [{
   className: 'btn-sm btn-primary btn-add-event',
   text: '<i class="fas fa-plus"></i> Tambah Event',
   action: () => addEvent()
}]
options.dom = "<'row mb-2'<'col-sm-6 d-flex justify-content-center justify-content-sm-start'B><'col-sm-6 d-flex justify-content-center justify-content-sm-end dataTables_filter event-date-search'>>" + dom
const tableEvent = $('#tableEvent').DataTable(options)

// Cari event dengan date picker
$("div.event-date-search").html('<label>Search by date: <input type="hidden" id="event-date-search"></label>')
datePickerOptions.onSelect = () => tableEvent.search($('#event-date-search').val()).draw()
$('#event-date-search').datepicker(datePickerOptions)

// Data table order verify
options.ajax.url = url.orderVerify.list
options.columnDefs[0].targets = [0, 7]
options.dom = "<'row'<'col-sm-12 dataTables_filter verify-date-search'>>" + dom
const tableVerify = $('#tableVerify').DataTable(options)

// Cari order verify dengan date picker
$("div.verify-date-search").html('<label>Search by date: <input type="hidden" id="verify-date-search"></label>')
datePickerOptions.onSelect = () => tableVerify.search($('#verify-date-search').val()).draw()
$('#verify-date-search').datepicker(datePickerOptions)

// Data table order proccess
options.ajax.url = url.orderProccess.list
options.columnDefs[0].targets = [0, 4]
options.dom = "<'row'<'col-sm-12 dataTables_filter proccess-date-search'>>" + dom
const tableProccess = $('#tableProccess').DataTable(options)

// Cari order proccess dengan date picker
$("div.proccess-date-search").html('<label>Search by date: <input type="hidden" id="proccess-date-search"></label>')
datePickerOptions.onSelect = () => tableProccess.search($('#proccess-date-search').val()).draw()
$('#proccess-date-search').datepicker(datePickerOptions)

// Data table order sent
options.ajax.url = url.orderSent.list
options.columnDefs[0].targets = [0, 7]
const tableSent = $('#tableSent').DataTable(options)

// Data table history user
options.ajax.url = url.historyUser.list
options.columnDefs[0].targets = [0]
options.buttons = [{
   className: 'btn-sm btn-primary',
   extend: 'pdf',
   pageSize: 'A4',
   text: '<i class="fas fa-print"></i> Simpan PDF',
   exportOptions: {
      columns: [0, 1, 2, 3, 4]
   }
}]
options.dom = "<'row mb-2'<'col-sm-6 d-flex justify-content-center justify-content-sm-start'B><'col-sm-6 d-flex justify-content-center justify-content-sm-end dataTables_filter event-date-search'>>" + dom
const tableUsersReport = $('#tableUsersReport').DataTable(options)

// Cari user report dengan date picker
$("div.event-date-search").html('<label>Search by date: <input type="hidden" id="event-date-search"></label>')
datePickerOptions.onSelect = () => tableUsersReport.search($('#event-date-search').val()).draw()
$('#event-date-search').datepicker(datePickerOptions)

// Data table history sales
options.ajax.url = url.historySale.list
options.columnDefs[0].targets = [0]
options.buttons = [{
   className: 'btn-sm btn-primary',
   extend: 'pdf',
   pageSize: 'A4',
   text: '<i class="fas fa-print"></i> Simpan PDF',
   exportOptions: {
      columns: [0, 1, 2, 3, 4]
   }
}]
options.dom = "<'row mb-2'<'col-sm-6 d-flex justify-content-center justify-content-sm-start'B><'col-sm-6 d-flex justify-content-center justify-content-sm-end dataTables_filter event-date-search'>>" + dom
const tableSalesReport = $('#tableSalesReport').DataTable(options)

// Cari sale report dengan date picker
$("div.event-date-search").html('<label>Search by date: <input type="hidden" id="event-date-search"></label>')
datePickerOptions.onSelect = () => tableSalesReport.search($('#event-date-search').val()).draw()
$('#event-date-search').datepicker(datePickerOptions)

// hapus pembungkus tombol pdf
$('.dt-buttons').removeClass('dt-buttons btn-group flex-wrap')

// hapus class btn-secondary di tombol
$('.btn-sm').removeClass('btn-secondary')


// Elememt form category
const formCategory = document.querySelector('#formCategory')
const idCategory = document.querySelector('#formCategory input[name="id"]')
const nameCategory = document.querySelector('#formCategory input[name="category"]')

// Element form event
const formEvent = document.querySelector('#formEvent')
const idEvent = document.querySelector('#formEvent input[name="id"]')
const nameEvent = document.querySelector('#formEvent input[name="event"]')
const startDate = document.querySelector('#formEvent input[name="start_date"]')
const endDate = document.querySelector('#formEvent input[name="end_date"]')
const inputDetail = document.querySelector('#formEvent #detail')
const detailEvent = document.querySelector('#formEvent .trix-event')
const imageEvent = document.querySelector('#formEvent input[name="image"]')
const imgLama = document.querySelector('#formEvent input[name="image_lama"]')
const published = document.querySelector('#formEvent input[name="publish"]')

document.addEventListener('click', async function (e) {
   /**
    * Tombol detail
    * Tampilkan detail produk di offcanvas
    */
   if (e.target.classList.contains('btn-detail-product')) {

      // Modal detail produk
      const modalProduct = new bootstrap.Modal(document.getElementById('modalProduct'), {
         keyboard: false
      })
      // ambil detail produk dan tampilkan ke offcanvas
      const slug = e.target.dataset.slug
      const data = await requestData(url.product.find + slug, 'GET')
      showDetailProduct(data)
      modalProduct.show()
   }

   // Tombol hapus produk
   if (e.target.classList.contains('btn-delete-product')) {
      const id = e.target.dataset.id
      alertQuestion('Produk akan dihapus?', 'Hapus', '#d33', () => deleteData(url.product.delete + id, 'Produk', tableProduct))
   }

   // Tampilkan foto lainnya ke foto utama produk
   if (e.target.classList.contains('img-other')) {
      const imgUtama = document.querySelector('.img-product')
      imgUtama.src = e.target.src
   }

   // Tombol edit kategori
   if (e.target.classList.contains('btn-edit-category')) {
      const slug = e.target.dataset.slug
      const category = await requestData(url.category.find + slug, 'GET')
      idCategory.value = category.id
      nameCategory.value = category.name
      isUpdate(true)
   }

   // Tombol hapus kategori
   if (e.target.classList.contains('btn-delete-category')) {
      const id = e.target.dataset.id
      alertQuestion('Kategori akan dihapus?', 'Hapus', '#d33', () => deleteData(url.category.delete + id, 'Kategori', tableCategory))
   }

   // Tombol reset form category
   if (e.target.classList.contains('btn-reset-category')) {
      isUpdate(false)
      formCategory.reset()
      nameCategory.classList.remove('is-invalid')
   }

   // Tombol edit event
   if (e.target.classList.contains('btn-edit-event')) {
      const slug = e.target.dataset.slug
      const data = await requestData(url.event.find + slug, 'GET')
      editEvent(data)
   }

   // Tombol hapus event
   if (e.target.classList.contains('btn-delete-event')) {
      const id = e.target.dataset.id
      alertQuestion('Event akan dihapus?', 'Hapus', '#d33', () => deleteData(url.event.delete + id, 'Event', tableEvent))
   }

   // Tombol detail event
   if (e.target.classList.contains('btn-detail-event')) {
      const slug = e.target.dataset.slug
      const data = await requestData(url.event.find + slug, 'GET')
      showDetailEvent(data)
   }

   // Tombol detail pesanan menunggu verifikasi
   if (e.target.classList.contains('btn-detail-verify')) {
      const invoice = e.target.dataset.invoice
      const data = await requestData(url.orderVerify.find + invoice, 'GET')
      showDetailVerify(data)
   }

   // Tombol konfirmasi pesanan
   if (e.target.classList.contains('btn-confirm-verify')) {
      const invoice = e.target.dataset.invoice
      alertQuestion('Pesanan akan dikonfirmasi?', 'Konfirmasi', '#1CC88A', () => confirmOrder(url.orderVerify.verify + invoice, 'Pesanan', tableVerify))
      e.target.disabled = true
      e.target.innerHTML = '<span class="spinner-border spinner-border-sm" role="status"></span> Loading...'
   }

   // Tombol tolak konfirmasi pesanan
   if (e.target.classList.contains('btn-cancel-verify')) {
      const invoice = e.target.dataset.invoice
      alertQuestion('Pesanan akan dibatalkan?', 'Tolak', '#d33', () => cancelConfirm(url.orderVerify.cancel + invoice, 'Pesanan', tableVerify))
      e.target.disabled = true
      e.target.innerHTML = '<span class="spinner-border spinner-border-sm" role="status"></span> Loading...'
   }

   // Tombol kirim pesanan (tampil detail pesanan)
   if (e.target.classList.contains('btn-send')) {
      const invoice = e.target.dataset.invoice
      const data = await requestData(url.orderProccess.find + invoice, 'GET')
      showFormSend(data)
   }

   // Tombol detail pesanan dikirim
   if (e.target.classList.contains('btn-detail-sent')) {
      const invoice = e.target.dataset.invoice
      const data = await requestData(url.orderSent.find + invoice, 'GET')
      showDetailSending(data)
   }
})

// Submit form category
if (formCategory) {
   formCategory.addEventListener('submit', async function (e) {
      e.preventDefault()
      const formData = new FormData(this)
      const data = await requestData(url.category.save, 'POST', formData)
      saveData(data, 'Kategori')
   })
}

// Submit form event
if (formEvent) {
   formEvent.addEventListener('submit', async function (e) {
      e.preventDefault()
      const formData = new FormData(this)
      const data = await requestData(url.event.save, 'POST', formData)
      saveData(data, 'Event')
   })
}

// Menu option manage users
const optiosUser = document.querySelectorAll('.options-user')
optiosUser.forEach(option => {
   option.addEventListener('click', function (e) {
      e.preventDefault()
      var dropdown = new bootstrap.Dropdown(this)
      dropdown.toggle()
   })
})

// kirim pesanan
const proccessModalEl = document.getElementById('modalProccess')
let modalProccess
if (proccessModalEl) {
   modalProccess = new bootstrap.Modal(proccessModalEl)
}
const formSend = document.querySelector('#modalProccess #formSendOrders')
if (formSend) {
   formSend.addEventListener('submit', async function (e) {
      e.preventDefault()
      const formData = new FormData(this)
      const btnSubmit = document.querySelector('#formSendOrders button[type="submit"]')
      btnSubmit.innerHTML = '<span class="spinner-border spinner-border-sm" role="status"></span> Loading...'
      btnSubmit.disabled = true
      try {
         const data = await requestData(url.orderProccess.send, 'POST', formData)
         if (data) {
            alertInfo('success', 'Sukses', 'Pesanan dikirim', () => reloadTable(tableProccess))
         }
      } catch (error) {
         alertInfo('error', 'Oops...', 'Gagal mengirim pesanan', () => reloadTable(tableProccess))
      }

      modalProccess.hide()
   })
}

// Batasi input harga, diskon, berat, dan stok hanya angka
const inputNumber = document.querySelectorAll('#formAddProduct .only-number')
inputNumber.forEach(input => input.addEventListener('input', function () {
   onlyNumber(this)
}))

// Style checkbox bg color saat checked
const checkboxColor = document.querySelectorAll('input[name="color[][id]"]')
checkboxColor.forEach(color => {
   color.checked ? color.style.backgroundColor = color.dataset.style : ''
   color.addEventListener('change', function () {
      this.style.backgroundColor = this.dataset.style
   })
})

// Drag and Drop foto produk
document.querySelectorAll(".drop-zone__input").forEach((inputElement) => {
   const dropZoneElement = inputElement.closest(".drop-zone")

   dropZoneElement.addEventListener("click", (e) => {
      inputElement.click()
   })

   inputElement.addEventListener("change", (e) => {
      if (inputElement.files.length) {
         updateThumbnail(dropZoneElement, inputElement.files[0])
      }
   })

   dropZoneElement.addEventListener("dragover", (e) => {
      e.preventDefault()
      dropZoneElement.classList.add("drop-zone--over")
   });

   ["dragleave", "dragend"].forEach((type) => {
      dropZoneElement.addEventListener(type, (e) => {
         dropZoneElement.classList.remove("drop-zone--over")
      })
   })

   dropZoneElement.addEventListener("drop", (e) => {
      e.preventDefault()

      if (e.dataTransfer.files.length) {
         inputElement.files = e.dataTransfer.files
         updateThumbnail(dropZoneElement, e.dataTransfer.files[0])
      }

      dropZoneElement.classList.remove("drop-zone--over")
   })
})

/**
 * Fungsi untuk cek apakah mode edit atau tambah kategori
 * @param {true == mode update / false == mode save} update 
 */
function isUpdate (update) {
   const btnSubmit = document.querySelector('#formCategory button[type="submit"]')
   const title = document.querySelector('#formCategory h4')

   if (update) {
      title.innerHTML = 'Edit Kategori'
      btnSubmit.innerHTML = '<i class="fas fa-edit"></i> Edit'
   } else {
      title.innerHTML = 'Tambah Kategori'
      btnSubmit.innerHTML = '<i class="fas fa-plus"></i> Tambah'
   }

   return true
}

// Fungsi hanya angka
function onlyNumber (input) {
   input.value = input.value.replace(/[^0-9]/g, '')
}

// Fungsi format rupiah
function formatRupiah (input) {
   return new Intl.NumberFormat('id-ID').format(input)
}

// Fungsi format tanggal
function formatDate (date) {

   const options = {
      day: 'numeric',
      year: 'numeric',
      month: 'long',
   }

   return new Date(date).toLocaleString('id-ID', options)
}

/**
 * @param {Route url} url 
 * @param {GET, POST, PUT, DELETE} method 
 * @param {Data untuk dikirimkan} body 
 */
function requestData (url, method, body) {
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
            throw new Error(`Error : ${data}`)
         }

         return data
      })
}

/**
 * @param {Data produk} data 
 */
function showDetailProduct (data) {
   const modalBody = document.querySelector('#modalProduct .modal-body')
   let content = `
        <div class="row">
            <div class="col-12 col-sm-6 col-md-5">
                <div class="card border-0">
                    <div class="position-absolute p-2 text-light bg-danger bg-opacity-75 rounded ${data.product.discount > 0 ? '' : 'd-none'}">Off ${data.product.discount}%</div>
                    <img src="/img/foto-produk/${data.product.image_1}" class="img-fluid img-product rounded">
                </div>
                <div class="row mt-4 mb-2">
                    <div class="col-4"><img src="/img/foto-produk/${data.product.image_1}" class="img-fluid img-other rounded"></div>
                    <div class="col-4"><img src="/img/foto-produk/${data.product.image_2}" class="img-fluid img-other rounded"></div>
                    <div class="col-4"><img src="/img/foto-produk/${data.product.image_3}" class="img-fluid img-other rounded"></div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-7">
                <h4 class="mb-0 fw-bold text-capitalize">${data.product.name}</h4>
                <p class="mb-1 mt-0">${data.product.category}</p>
                <p class="mb-1 mt-0 d-inline">Rp. ${formatRupiah(data.product.discount > 0 ? Math.round(data.product.price - (data.product.discount / 100 * data.product.price)) : data.product.price)}</p>
                <span class="text-muted text-decoration-line-through small  ${data.product.discount > 0 ? '' : 'd-none'}">Rp. ${formatRupiah(data.product.price)}</span>
                <p class="my-0">Varian Ukuran</p>`

   data.size.forEach(size => content += `<span class="badge bg-danger shadow py-1 px-2 me-1">${size.name}</span>`)

   content += `<p class="my-0">Varian Warna</p>`

   data.color.forEach(color => content += `<span class="badge py-1 px-2 me-1 shadow bg-${color.name}">${color.name}</span>`)

   content += `
                <p class="mb-1 mt-1">Berat Produk : ${formatRupiah(data.product.weight)} gram</p>
                <p class="mb-1 mt-0">Stok : ${formatRupiah(data.product.stock)}</p>
                <p class="mb-1 mt-0">Terjual : ${formatRupiah(data.product.sold)}</p>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-12">
                <p class="mb-1 mt-0 fw-bold">Detail Produk</p>
                <p class="mb-1 mt-0">${data.product.detail}</p>
            </div>
        </div>`

   modalBody.innerHTML = content
}

/**
 * @param {data yang akan disimpan / diubah} data 
 * @param {jenis data : produk, kategori, event, dll} dataType 
 */
function saveData (data, dataType) {
   if (dataType == 'Kategori') {
      console.log(data)
      // Simpan / ubah kategori
      if (data.status == false) {
         const invalidCategory = document.querySelector('#formCategory .invalid-category')
         nameCategory.classList.add('is-invalid')
         invalidCategory.innerHTML = data.validation
         return false
      }

      let text = data.isSave ? `${dataType} berhasil ditambahkan` : `${dataType} berhasil diubah`

      alertInfo('success', 'Sukses', text, () => reloadTable(tableCategory))
      formCategory.reset()
      isUpdate(false)
      nameCategory.classList.remove('is-invalid')
   } else if (dataType == 'Event') {
      // Simpan / ubah event
      if (data.status == false) {
         const invalidEvent = document.querySelector('#formEvent .invalid-event')
         const invalidDetail = document.querySelector('#formEvent .invalid-detail')
         const invalidStart = document.querySelector('#formEvent .invalid-start')
         const invalidEnd = document.querySelector('#formEvent .invalid-end')
         const invalidImage = document.querySelector('#formEvent .invalid-image')

         if (data.validation.event) {
            nameEvent.classList.add('is-invalid')
            invalidEvent.innerHTML = data.validation.event
         }

         if (data.validation.start_date) {
            startDate.classList.add('is-invalid')
            invalidStart.innerHTML = data.validation.start_date
         }

         if (data.validation.end_date) {
            endDate.classList.add('is-invalid')
            invalidEnd.innerHTML = data.validation.end_date
         }

         if (data.validation.detail) {
            detailEvent.classList.add('is-invalid')
            invalidDetail.innerHTML = data.validation.detail
         }

         if (data.validation.image) {
            imageEvent.classList.add('is-invalid')
            invalidImage.innerHTML = data.validation.image
         }

         return false
      }

      let text = data.isSave ? `${dataType} berhasil ditambahkan` : `${dataType} berhasil diubah`
      alertInfo('success', 'Sukses', text, () => reloadTable(tableEvent))
      formEvent.reset()
      modalEvent.hide()
   }
}

/**
 * @param {Route Url} url 
 * @param {String untuk pesan data yang dihapus, mis: Produk, Kategori} textData 
 * @param {Tabel yang akan direload} table 
 */
async function deleteData (url, textData, table) {
   try {
      const data = await requestData(url, 'DELETE')
      if (data) {
         alertInfo('success', 'Sukses', `${textData} berhasil dihapus`, () => reloadTable(table))
      }
   } catch (error) {
      alertInfo('error', 'Oops...', `Gagal menghapus ${textData}`)
   }
}

// Element modal event
const eventModalEl = document.querySelector('#modalEvent')
const title = document.querySelector('#modalEvent .modal-title')
let modalEvent
if (eventModalEl) {
   modalEvent = new bootstrap.Modal(eventModalEl)

   /**
    * Saat modal event tampil
    * reset form event
    */
   eventModalEl.addEventListener('show.bs.modal', () => {
      nameEvent.classList.remove('is-invalid')
      startDate.classList.remove('is-invalid')
      endDate.classList.remove('is-invalid')
      detailEvent.classList.remove('is-invalid')
      imageEvent.classList.remove('is-invalid')
   })
}

/**
 * Tampil modal tambah event
 */
function addEvent () {
   title.innerHTML = 'Tambah Event'
   id.value = ''
   inputDetail.value = ''
   detailEvent.innerHTML = ''
   imgLama.value = ''
   formEvent.reset()
   modalEvent.show()
}

/**
 * 
 * @param {data event yang akan diubah} event 
 */
function editEvent (event) {
   formEvent.reset()
   title.innerHTML = 'Edit Event'
   idEvent.value = event.id
   imgLama.value = event.image
   nameEvent.value = event.name
   startDate.value = event.start_date
   endDate.value = event.end_date
   inputDetail.value = event.detail
   detailEvent.innerHTML = event.detail
   published.value = event.published
   if (event.published == 1) {
      published.checked = true
   }
   modalEvent.show()
}

/**
 * 
 * @param {data event detail} event 
 */
function showDetailEvent (event) {
   const modalDetailEvent = new bootstrap.Modal(document.querySelector('#modalDetailEvent'))
   const modalBody = document.querySelector('#modalDetailEvent .modal-body')
   const modalFooter = document.querySelector('#modalDetailEvent .modal-footer')

   modalBody.innerHTML = `
        <div class="row">
            <div class="col-12 d-flex justify-content-center mb-2">
                <div class="card card-body shadow border-0">
                    <img src="/img/event/${event.image}" alt="${event.name}" class="img-fluid rounded">
                </div>
            </div>
            <div class="col-12">
                <h6 class="text-center">${formatDate(event.start_date)} - ${formatDate(event.end_date)}</h6>
                <h4 class="text-center text-capitalize">${event.name}</h4>
                <p class="mt-2">${event.detail}</p>
            </div>
        </div>`

   modalFooter.innerHTML = `
        <button type="button" class="btn btn-primary btn-sm px-3 btn-publish ${event.published == 1 ? 'd-none' : 'd-block'}">Publish</button>
        <button type="button" class="btn btn-success btn-sm px-3" data-bs-dismiss="modal">OK</button>
    `

   modalDetailEvent.show()

   const btnPublish = document.querySelector('#modalDetailEvent .btn-publish')
   btnPublish.addEventListener('click', async function () {
      const formData = new FormData
      formData.append('id', event.id)
      const data = await requestData(url.event.publish, 'POST', formData)
      if (data) {
         modalDetailEvent.hide()
         alertInfo('success', 'Sukses', 'Event berhasil diterbitkan', () => reloadTable(tableEvent))
      }
   })
}

/**
 * 
 * @param {data detail order verify} data 
 */
const verifyModalEl = document.getElementById('modalVerify')
let modalVerify
if (verifyModalEl) {
   modalVerify = new bootstrap.Modal(verifyModalEl)
}

function showDetailVerify (data) {
   const modalFooter = document.querySelector('#modalVerify .modal-footer')
   const invoice = document.querySelector('#modalVerify #invoice')
   const confirmDate = document.querySelector('#modalVerify #confirmDate')
   const tBody = document.querySelector('#modalVerify #tableProductVerify tbody')
   const total = document.querySelector('#modalVerify #total')
   const imgTransfer = document.querySelector('#modalVerify #imgTransfer')

   invoice.innerHTML = data[0].invoice
   confirmDate.innerHTML = formatDate(data[0].confirm_date)
   total.innerHTML = `Rp. ${formatRupiah(data[0].total)}`
   imgTransfer.src = `/img/bukti-transfer/${data[0].image}`
   imgTransfer.alt = data[0].bank

   tBody.innerHTML = ''
   data.map((product, i) => {
      tBody.innerHTML += `
            <tr>
                <td>${i + 1}</td>
                <td>${product.product}</td>
                <td>${product.size}</td>
                <td>${product.color}</td>
                <td>${product.quantity}</td>
            </tr>`
   })

   modalFooter.innerHTML = `
        <button type="button" class="btn btn-secondary btn-sm px-3" data-bs-dismiss="modal">Batal</button>
        <button type="button" class="btn btn-danger btn-sm px-3 btn-cancel-verify" data-invoice="${data[0].invoice}">Tolak konfirmasi</button>
        <button type="button" class="btn btn-success btn-sm px-3 btn-confirm-verify" data-invoice="${data[0].invoice}">Konfirmasi</button>`
   modalVerify.show()
}

/**
 * @param {Route Url} url 
 * @param {String untuk pesan data yang akan dikonfirmasi} textData 
 * @param {Tabel yang akan direload} table 
 */
async function confirmOrder (url, textData, table) {
   try {
      const data = await requestData(url, 'GET')
      if (data) {
         alertInfo('success', 'Sukses', `${textData} berhasil dikonfirmasi`, () => reloadTable(table))
      }
   } catch (error) {
      alertInfo('error', 'Oops...', `Gagal mengkonfirmasi ${textData}`)
   }

   modalVerify.hide()
}

/**
 * @param {Route Url} url 
 * @param {String untuk pesan data yang akan dibatalkan} textData 
 * @param {Tabel yang akan direload} table 
 */
async function cancelConfirm (url, textData, table) {
   try {
      const data = await requestData(url, 'GET')
      if (data) {
         alertInfo('success', 'Sukses', `${textData} dibatalkan`, () => reloadTable(table))
      }
   } catch (error) {
      alertInfo('error', 'Oops...', `Gagal membatalkan ${textData}`)
   }

   modalVerify.hide()
}

/**
 * @param {detail pesanan untuk dikirim} data 
 */
async function showFormSend (data) {
   const modalBody = document.querySelector('#modalProccess .modal-body')
   const btnSubmit = document.querySelector('#formSendOrders button[type="submit"]')
   btnSubmit.innerHTML = 'Kirim'
   btnSubmit.disabled = false
   let content = `
        <div class="row mb-2">
            <div class="col-6">
                <p class="fs-6 my-0">Penerima :</p>
                <p class="fw-bold fs-6 my-0">${data[0].fullname}</p>
            </div>
            <div class="col-6 text-end">
                <p class="fs-6 my-0">Alamat :</p>
                <p class="fw-bold fs-6 my-0">${data[0].jalan}, ${data[0].kecamatan}, ${data[0].kabupaten}, ${data[0].provinsi}, ${data[0].kode_pos}</p>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-6">
                <p class="fs-6 my-0">Invoice :</p>
                <p class="fw-bold fs-6 my-0">${data[0].invoice}</p>
                <input type="hidden" name="invoice" value="${data[0].invoice}">
            </div>
            <div class="col-6 text-end">
                <p class="fs-6 my-0">Nomor Resi :</p>
                <div class="d-flex justify-content-end">
                    <input type="text" class="form-control form-control-sm w-50 text-uppercase" name="resi_number" placeholder="Masukan nomo resi" required>
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-sm table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Produk</th>
                        <th scope="col">Ukuran</th>
                        <th scope="col">Warna</th>
                        <th scope="col">Jumlah</th>
                        <th scope="col">Grand Total</th>
                        <th scope="col">Catatan</th>
                    </tr>
                </thead>
                <tbody>`
   data.map((product, i) => {
      content += `
            <tr>
                <td>${i + 1}</td>
                <td>${product.product}</td>
                <td>${product.size}</td>
                <td>${product.color}</td>
                <td>${product.quantity}</td>
                <td>Rp. ${formatRupiah(product.grand_total)}</td>
                <td>${product.note}</td>
            </tr>`
   })

   content += `
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-6">
            <p class="fs-6 my-0">Kurir : ${data[0].courier.toUpperCase()}</p>
            <p class="fs-6 my-0">Jenis Pengiriman : ${data[0].shipping_type}</p>
            </div>
            <div class="col-6 text-end">
                <h6 class="fw-bold">Ongkir : Rp. ${formatRupiah(data[0].cost)}</h6>
                <h5 class="fw-bold">Total : Rp. ${formatRupiah(data[0].total)}</h5>
            </div>
        </div>`

   modalBody.innerHTML = content
   modalProccess.show()
}

/**
 * @param {detail pesanan yang dikirim} data 
 */
const sendModalEl = document.getElementById('modalSending')
let modalSending
if (sendModalEl) {
   modalSending = new bootstrap.Modal(sendModalEl)
}
async function showDetailSending (data) {
   const modalBody = document.querySelector('#modalSending .modal-body')
   let content = `
        <div class="row mb-2">
            <div class="col-6">
                <p class="fs-6 my-0">Penerima :</p>
                <p class="fw-bold fs-6 my-0">${data[0].fullname}</p>
            </div>
            <div class="col-6 text-end">
                <p class="fs-6 my-0">Alamat :</p>
                <p class="fw-bold fs-6 my-0">${data[0].jalan}, ${data[0].kecamatan}, ${data[0].kabupaten}, ${data[0].provinsi}, ${data[0].kode_pos}</p>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-6">
                <p class="fs-6 my-0">Invoice :</p>
                <p class="fw-bold fs-6 my-0">${data[0].invoice}</p>
            </div>
            <div class="col-6 text-end">
                <p class="fs-6 my-0">Nomor Resi :</p>
                <p class="fw-bold fs-6 my-0">${data[0].resi_number}</p>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-sm table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Produk</th>
                        <th scope="col">Ukuran</th>
                        <th scope="col">Warna</th>
                        <th scope="col">Jumlah</th>
                        <th scope="col">Grand Total</th>
                        <th scope="col">Catatan</th>
                    </tr>
                </thead>
                <tbody>`
   data.map((product, i) => {
      content += `
            <tr>
                <td>${i + 1}</td>
                <td>${product.product}</td>
                <td>${product.size}</td>
                <td>${product.color}</td>
                <td>${product.quantity}</td>
                <td>Rp. ${formatRupiah(product.grand_total)}</td>
                <td>${product.note}</td>
            </tr>`
   })

   content += `
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-6">
            <p class="fs-6 my-0">Kurir : ${data[0].courier.toUpperCase()}</p>
            <p class="fs-6 my-0">Jenis Pengiriman : ${data[0].shipping_type}</p>
            <p class="fs-6 my-0">Estimast (hari) : ${data[0].estimate_date}</p>
            </div>
            <div class="col-6 text-end">
                <h6 class="fw-bold">Ongkir : Rp. ${formatRupiah(data[0].cost)}</h6>
                <h5 class="fw-bold">Total : Rp. ${formatRupiah(data[0].total)}</h5>
            </div>
        </div>`

   modalBody.innerHTML = content
   modalSending.show()
}

/**
 * @param {Tabel yang akan direload} table 
 */
function reloadTable (table) {
   table.ajax.reload(null, false)
}

/**
 * Updates the thumbnail on a drop zone element.
 *
 * @param {HTMLElement} dropZoneElement
 * @param {File} file
 */
function updateThumbnail (dropZoneElement, file) {
   let thumbnailElement = dropZoneElement.querySelector(".drop-zone__thumb")

   // First time - remove the prompt
   if (dropZoneElement.querySelector(".drop-zone__prompt")) {
      dropZoneElement.querySelector(".drop-zone__prompt").remove()
   }

   // First time - there is no thumbnail element, so lets create it
   if (!thumbnailElement) {
      thumbnailElement = document.createElement("div")
      thumbnailElement.classList.add("drop-zone__thumb")
      dropZoneElement.appendChild(thumbnailElement)
   }

   thumbnailElement.dataset.label = file.name

   // Show thumbnail for image files
   if (file.type.startsWith("image/")) {
      const reader = new FileReader()

      reader.readAsDataURL(file)
      reader.onload = () => {
         thumbnailElement.style.backgroundImage = `url('${reader.result}')`
      }
   } else {
      thumbnailElement.style.backgroundImage = `url(/img/foto-produk/product.jpg)`
   }
}

/**
 * @param {Text pesan} text 
 * @param {Text di tombol konfirmasi} confirmText 
 * @param {Warna tombol konfirmasi} confirmColor 
 * @param {Fungsi yang akan dijalankan} func 
 */
function alertQuestion (text, confirmText, confirmColor, func) {
   Swal.fire({
      icon: 'question',
      title: 'Anda yakin?',
      text,
      confirmButtonText: confirmText,
      showCancelButton: true,
      confirmButtonColor: confirmColor,
      reverseButtons: true
   }).then(async (result) => {
      if (result.isConfirmed) {
         func()
      }
   })
}

/**
 * @param {success / error} icon 
 * @param {Judul pesan} title 
 * @param {Text pesan} text 
 * @param {Fungsi yang akan dijalankan} func 
 */
function alertInfo (icon, title, text, func) {
   Swal.fire({
      icon,
      title,
      text,
   }).then(() => func())
}

// Hapus pesanan user yang melebihi deadlin konfirmasi pembayaran
deleteCheckout()

// Fungsi hapus pesanan user yang melebihi deadline
async function deleteCheckout () {
   await requestData('/checkout/delete', 'DELETE')
}