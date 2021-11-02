<?php

use Tygh\Languages\Languages;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if (empty($_REQUEST['field_data']['field_id']) && !empty($_REQUEST['field_data'])) {

        $field_data = $_REQUEST['field_data'];
        $select = db_get_field("SELECT MAX(`object_id`) FROM `?:profile_field_descriptions`");

        db_query('UPDATE ?:profile_field_descriptions SET prompt = ?s, placeholder = ?s, maxlength = ?s WHERE object_id = ?i', $field_data['prompt'], $field_data['placeholder'], $field_data['maxlength'], $select);
    }
}
