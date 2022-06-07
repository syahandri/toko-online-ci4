<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php')) {
   require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('HomeController');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'HomeController::index');
$routes->group('product', function ($routes) {
   $routes->get('search', 'ProductController::search');
   $routes->get('newest', 'ProductController::newest');
   $routes->get('bestseller', 'ProductController::bestseller');
   $routes->get('cheapest', 'ProductController::cheapest');
   $routes->get('category/(:any)', 'ProductController::getProductsByCategory/$1');
   $routes->get('(:any)', 'ProductController::find/$1');
});
$routes->group('cart', ['filter' => 'role:admin,user,member'], function ($routes) {
   $routes->get('/', 'CartController::index');
   $routes->post('/', 'CartController::addCart');
   $routes->get('count-cart', 'CartController::countCart');
   $routes->post('ongkir', 'CartController::getOngkir');
   $routes->post('deleteItem', 'CartController::deleteItem');
});
$routes->group('checkout', ['filter' => 'role:admin,user,member'], function ($routes) {
   $routes->post('checkout', 'CheckoutController::checkout');
   $routes->get('print/(:any)', 'CheckoutController::printInvoice/$1');
   $routes->get('status/(:any)/(:any)', 'CheckoutController::getByStatus/$1/$2');
   $routes->get('(:any)', 'CheckoutController::getByInvoice/$1');
});
$routes->delete('checkout/delete', 'CheckoutController::deleteCheckout');
$routes->group('order', function ($routes) {
   $routes->get('confirm', 'ConfirmController::index');
   $routes->post('confirm', 'ConfirmController::confirm');
});
$routes->group('profile', ['filter' => 'role:admin,user,member'], function ($routes) {
   $routes->get('/', 'ProfileController::index');
   $routes->post('/', 'ProfileController::update');
   $routes->get('edit/(:any)', 'ProfileController::edit/$1');
});
$routes->get('provinsi', 'ProfileController::getProvinsi');
$routes->get('kabupaten/(:any)', 'ProfileController::getKabupaten/$1');
$routes->get('event/(:any)', 'EventController::event/$1');
$routes->group('web-admin', ['filter' => 'role:admin'], function ($routes) {
   $routes->get('/', 'DashboardController::index');

   $routes->get('products', 'ProductController::listProducts');
   $routes->get('getProducts', 'ProductController::getProducts');
   $routes->get('products/add', 'ProductController::save');
   $routes->get('products/edit/(:any)', 'ProductController::edit/$1');
   $routes->post('products/store', 'ProductController::store');
   $routes->post('products/update', 'ProductController::update');
   $routes->delete('products/delete/(:any)', 'ProductController::delete/$1');

   $routes->get('categories', 'CategoryController::index');
   $routes->get('listCategories', 'CategoryController::listCategories');
   $routes->post('categories/store', 'CategoryController::store');
   $routes->delete('categories/delete/(:any)', 'CategoryController::delete/$1');
   $routes->get('categories/(:any)', 'CategoryController::bySlug/$1');

   $routes->get('events', 'EventController::index');
   $routes->post('events/store', 'EventController::store');
   $routes->get('listEvents', 'EventController::listEvents');
   $routes->delete('events/delete/(:any)', 'EventController::delete/$1');
   $routes->post('events/publish', 'EventController::publish');
   $routes->get('events/(:any)', 'EventController::find/$1');

   $routes->get('orders/verify', 'OrderController::verify');
   $routes->get('listOrdersVerify', 'OrderController::listOrdersVerify');
   $routes->get('orders/verify/confirm/(:any)', 'OrderController::confirm/$1');
   $routes->get('orders/verify/cancel/(:any)', 'OrderController::cancel/$1');
   $routes->get('orders/verify/(:any)', 'OrderController::findVerify/$1');

   $routes->get('orders/proccess', 'OrderController::proccess');
   $routes->get('listOrdersProccess', 'OrderController::listOrdersProccess');
   $routes->post('orders/proccess/send', 'OrderController::send');
   $routes->get('orders/proccess/(:any)', 'OrderController::findProccess/$1');

   $routes->get('orders/sent', 'OrderController::sent');
   $routes->get('listOrdersSent', 'OrderController::listOrdersSent');
   $routes->get('orders/sent/(:any)', 'OrderController::findSent/$1');

   $routes->get('users/manage', 'ProfileController::manageUsers');
   $routes->post('users/manage/(:any)', 'ProfileController::asMember/$1');

   $routes->get('report/sales', 'ReportController::sales');
   $routes->get('history/sales', 'ReportController::getHistorySales');
   $routes->get('report/users', 'ReportController::users');
   $routes->get('history/users', 'ReportController::getHistoryUsers');
});
/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
   require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
