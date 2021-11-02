<?php

use Tygh\Tools\Url;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $dispatch = [
        'controller' => 'system_fields',
        'mode'       => 'manage',
    ];

    $dispatch['mode'] = 'update';
    $query_string['sys_field_name'] = $_REQUEST['sys_field_data']['profiles_name'];

    $sys_field_data = $_REQUEST['sys_field_data'];

    $profiles_name = $sys_field_data['profiles_name'];
    $placeholder = $sys_field_data['placeholder'];
    $prompt = $sys_field_data['prompt'];
    $maxlength = $sys_field_data['maxlength'];

    db_query("UPDATE `?:system_profile_fields` SET `prompt` = ?s,`placeholder` = ?s,`maxlength` = ?i WHERE `profiles_name` = ?s", $prompt, $placeholder, $maxlength, $profiles_name);

    $_REQUEST['sys_field_name'] = $sys_field_data['profiles_name'];
    $profiles_description = $sys_field_data['profiles_description'];

    return array(CONTROLLER_STATUS_OK, Url::buildUrn($dispatch, $query_string));

}

if ($mode == 'update') {

    if (isset($_REQUEST['sys_field_name'])) {
    $params['sys_field_name'] = $_REQUEST['sys_field_name'];


    $sys_fields = db_get_array("SELECT * FROM `?:system_profile_fields` WHERE `profiles_name` = ?s", $params['sys_field_name']);

    if (empty($sys_fields)) {
        return [CONTROLLER_STATUS_NO_PAGE];
    }

    foreach ($sys_fields as $sys_field) {
        $profiles_description   = $sys_field['profiles_description'];
        $placeholder            = $sys_field['placeholder'];
        $prompt                 = $sys_field['prompt'];
        $maxlength              = $sys_field['maxlength'];
        $profiles_name          = $sys_field['profiles_name'];
    }

    Tygh::$app['view']->assign(array(
        'profiles_description'  =>  $profiles_description,
        'placeholder'           =>  $placeholder,
        'prompt'                =>  $prompt,
        'maxlength'             =>  $maxlength,
        'profiles_name'         =>  $profiles_name,
    ));

    }

}
