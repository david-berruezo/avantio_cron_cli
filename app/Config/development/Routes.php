<?php
namespace Config;
$routes = Services::routes();
$routes->get('/elvis-sighted', 'Home::localidades');
$routes->get('/elvis-sighted/(:any)', 'Home::localidades/$1');
$routes->get('/elvis-sighted/(:any)/(:any)', 'Home::localidades/$1/$2');
$routes->get('/say-it-isnt-so', 'Home::localidades');
$routes->get('/say-it-isnt-so/(:any)', 'Home::localidades/$1');
$routes->get('/say-it-isnt-so/(:any)/(:any)', 'Home::localidades/$1/$2');
$routes->get('/caffeination-yes', 'Home::localidades');
$routes->get('/caffeination-yes/(:any)', 'Home::localidades/$1');
$routes->get('/caffeination-yes/(:any)/(:any)', 'Home::localidades/$1/$2');