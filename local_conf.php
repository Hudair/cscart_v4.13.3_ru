<?php

// При работе с "живым" магазином можно сделать так, чтобы настройки из файла применялись только для определённого IP-адреса. Так local_conf.php не затронет покупателей. Замените 127.0.0.1 на нужный вам IP.
if ($_SERVER['REMOTE_ADDR'] == '127.0.0.1') {

    // Включаем дебаг-панель на витрине и в панели администратора
    // define('DEBUG_MODE', true);

    // Включаем режим разработки для отображения ошибок
    define('DEVELOPMENT', true);

    // Включаем отображение SMARTY- и PHP-ошибок на экране
    error_reporting(E_ALL);
    ini_set('display_errors', 'on');
    ini_set('display_startup_errors', true);

    // Отключаем PHP-кэш блоков
    $config['tweaks']['disable_block_cache'] = true;

}
