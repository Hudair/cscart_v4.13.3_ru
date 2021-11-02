<?php

if (!defined('BOOTSTRAP')) { die('Access denied'); }

/**
 * @var string $mode
 * @var string $action
 */

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    return;
}

if ($mode == 'add') {

    $lang_code = CART_LANGUAGE;
    $data = array();

    $data = db_get_array ("SELECT * FROM `?:system_profile_fields`");

    if ($data) {
        $data_profile_fields = array();
        foreach ($data as $k => $v) {
            $data_profile_fields[$v['profiles_name']] = $v;
        }
    }

    Tygh::$app['view']->assign('data_profile_fields', $data_profile_fields);

}
