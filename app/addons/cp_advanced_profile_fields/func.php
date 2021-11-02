<?php

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_cp_advanced_profile_fields_get_profile_fields($location, &$select, $condition, $params) {

    $select .= ", ?:profile_field_descriptions.prompt";
    $select .= ", ?:profile_field_descriptions.placeholder";
    $select .= ", ?:profile_field_descriptions.maxlength";

    return $select;

}
