<!--Этот шаблон перезаписан с помощью модуля Cart-Power: Advanced Profile fields-->
{if $show_email}
    <div class="ty-control-group">
        <label for="{$id_prefix}elm_email" class="cm-required cm-email">{__("email")}<i>*</i></label>
        <input type="text" id="{$id_prefix}elm_email" name="user_data[email]" size="32" value="{$user_data.email}" class="ty-input-text {$_class}" {$disabled_param} />
    </div>
{else}

{$fields = []}

{if !$exclude && !$include}
    {$fields = $profile_fields.$section}
{else}
    {foreach $profile_fields.$section as $key => $field}
        {if $include}
            {if in_array($field.field_name, $include)}
                {$fields[$key] = $field}
            {/if}
        {elseif $exclude}
            {if !in_array($field.field_name, $exclude)}
                {$fields[$key] = $field}
            {/if}
        {/if}
    {/foreach}
{/if}

{if $fields}

{if $address_flag}
    <div class="ty-profile-field__switch ty-address-switch clearfix">
        <div class="ty-profile-field__switch-label">{if $section == "S"}{__("shipping_same_as_billing")}{else}{__("text_billing_same_with_shipping")}{/if}</div>
        <div class="ty-profile-field__switch-actions">
            <input class="radio cm-switch-availability cm-switch-inverse cm-switch-visibility" type="radio" name="ship_to_another" value="0" id="sw_{$body_id}_suffix_yes" {if !$ship_to_another}checked="checked"{/if} /><label for="sw_{$body_id}_suffix_yes">{__("yes")}</label>
            <input class="radio cm-switch-availability cm-switch-visibility" type="radio" name="ship_to_another" value="1" id="sw_{$body_id}_suffix_no" {if $ship_to_another}checked="checked"{/if} /><label for="sw_{$body_id}_suffix_no">{__("no")}</label>
        </div>
    </div>
{else}
    <input type="hidden" name="ship_to_another" value="1" />
{/if}

{if ($address_flag && !$ship_to_another && ($section == "S" || $section == "B")) || $disabled_by_default}
    {assign var="disabled_param" value="disabled=\"disabled\""}
    {assign var="_class" value="disabled"}
    {assign var="hide_fields" value=true}
{else}
    {assign var="disabled_param" value=""}
    {assign var="_class" value=""}
{/if}

<div class="clearfix">
{if $body_id || $grid_wrap}
    <div id="{$body_id}" class="{if $hide_fields}hidden{/if}">
        <div class="{$grid_wrap}">
{/if}

{if !$nothing_extra}
    {include file="common/subheader.tpl" title=$title}
{/if}

{$default_data_name = $default_data_name|default:"user_data"}
{$user_data = $user_data|default:[]}
{$profile_data = $profile_data|default:$user_data}
{$fields = fn_fill_profile_fields_value($fields, $profile_data)}

{foreach from=$fields item=field name="profile_fields"}

{$value = $field.value}
{if $field.field_name && $field.is_default == "YesNo::YES"|enum}
    {$data_name=$default_data_name}
    {$data_id=$field.field_name}
    {$data_file_name=$default_data_name}
{else}
    {$data_name="`$default_data_name`[fields]"}
    {$data_id=$field.field_id}
    {$data_file_name="`$default_data_name`_fields"}
{/if}
    
{$element_id = "`$id_prefix`elm_`$field.field_id`"}
{$required = $field.required}

{if $field.field_type == "ProfileFieldTypes::FILE"|enum}
    {$var_name = "profile_fields[{$data_id}]"}
    {$hash_name = $var_name|md5}
    {$element_id = "type_{$hash_name}"}
    {if isset($value.file_name)}
        {$required = "YesNo::NO"|enum}
    {/if}
{/if}

{assign var="skip_field" value=false}
{if $section == "S" || $section == "B"}
    {if $section == "S"}
        {assign var="_to" value="B"}
    {else}
        {assign var="_to" value="S"}
    {/if}
    {if !$profile_fields.$_to[$field.matching_id]}
        {assign var="skip_field" value=true}
    {/if}
{/if}

{hook name="profiles:profile_fields"}
<div class="ty-control-group ty-profile-field__item ty-{$field.class}">
{if ($pref_field_name != $field.description || $required == "Y") && $field.field_type != "ProfileFieldTypes::VENDOR_TERMS"|enum}
    <label
        for={$element_id}
        class="ty-control-group__title cm-profile-field {if $field.autocomplete_type == "phone-full" || $field.field_type == "ProfileFieldTypes::PHONE"|enum}cm-mask-phone-label{/if} {if $required == "Y"}cm-required{/if}{if $field.field_type == "Z"} cm-zipcode{/if}{if $field.field_type == "E"} cm-email{/if} {if $field.field_type == "Z"}{if $section == "S"}cm-location-shipping{else}cm-location-billing{/if}{/if}"
    >{$field.description}{if $field.prompt}<a title="{$field.prompt}" class="cm-tooltip"><i class="icon-question-sign"></i></a>{/if}</label>
{/if}

    {if $field.field_type == "ProfileFieldTypes::STATE"|enum}
        {$_country = $profile_data.s_country}
        {$_state = $value}

        <select {if $field.autocomplete_type}x-autocompletetype="{$field.autocomplete_type}"{/if} id={$element_id} class="ty-profile-field__select-state cm-state {if $section == "S"}cm-location-shipping{else}cm-location-billing{/if} {if !$skip_field}{$_class}{/if}" name="{$data_name}[{$data_id}]" {if !$skip_field}{$disabled_param nofilter}{/if}>
            {if $required !== "Y"}
                <option value="">- {__("select_state")} -</option>
            {/if}
            {if $states && $states.$_country}
                {foreach from=$states.$_country item=state}
                    <option {if $_state == $state.code}selected="selected"{/if} value="{$state.code}">{$state.state}</option>
                {/foreach}
            {/if}
        </select>

        <input {if $field.autocomplete_type}x-autocompletetype="{$field.autocomplete_type}"{/if} type="text" id="elm_{$field.field_id}_d" name="{$data_name}[{$data_id}]" size="32" maxlength="64" value="{$_state}" disabled="disabled" class="cm-state {if $section == "S"}cm-location-shipping{else}cm-location-billing{/if} ty-input-text hidden {if $_class}disabled{/if}"/>

    {elseif $field.field_type == "ProfileFieldTypes::COUNTRY"|enum}
        {$_country = $value}

        <select {if $field.autocomplete_type}x-autocompletetype="{$field.autocomplete_type}"{/if} id={$element_id} class="ty-profile-field__select-country cm-country {if $section == "S"}cm-location-shipping{else}cm-location-billing{/if} {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if}" name="{$data_name}[{$data_id}]" {if !$skip_field}{$disabled_param nofilter}{/if}>
            {hook name="profiles:country_selectbox_items"}
            {if $required !== "Y"}
                <option value="">- {__("select_country")} -</option>
            {/if}
            {foreach from=$countries item="country" key="code"}
            <option {if $_country == $code}selected="selected"{/if} value="{$code}">{$country}</option>
            {/foreach}
            {/hook}
        </select>

    {elseif $field.field_type == "ProfileFieldTypes::CHECKBOX"|enum}
        <input type="hidden" name="{$data_name}[{$data_id}]" value="N" {if !$skip_field}{$disabled_param nofilter}{/if} />
        <input type="checkbox" id={$element_id} name="{$data_name}[{$data_id}]" value="Y" {if $value == "Y"}checked="checked"{/if} class="checkbox {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if}" {if !$skip_field}{$disabled_param nofilter}{/if} />

    {elseif $field.field_type == "ProfileFieldTypes::TEXT_AREA"|enum}
        <textarea {if $field.autocomplete_type}x-autocompletetype="{$field.autocomplete_type}"{/if} class="ty-input-textarea {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if}" id={$element_id} name="{$data_name}[{$data_id}]" cols="32" rows="3" {if !$skip_field}{$disabled_param nofilter}{/if}>{$value}</textarea>

    {elseif $field.field_type == "ProfileFieldTypes::DATE"|enum}
        {if !$skip_field}
            {include file="common/calendar.tpl" date_id="`$id_prefix`elm_`$field.field_id`" date_name="`$data_name`[`$data_id`]" date_val=$value extra=$disabled_param}
        {else}
            {include file="common/calendar.tpl" date_id="`$id_prefix`elm_`$field.field_id`" date_name="`$data_name`[`$data_id`]" date_val=$value}
        {/if}

    {elseif $field.field_type == "ProfileFieldTypes::SELECT_BOX"|enum}
        <select {if $field.autocomplete_type}x-autocompletetype="{$field.autocomplete_type}"{/if} id={$element_id} class="ty-profile-field__select {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if}" name="{$data_name}[{$data_id}]" {if !$skip_field}{$disabled_param nofilter}{/if}>
            {if $required != "Y"}
            <option value="">--</option>
            {/if}
            {foreach from=$field.values key=k item=v}
            <option {if $value == $k}selected="selected"{/if} value="{$k}">{$v}</option>
            {/foreach}
        </select>

    {elseif $field.field_type == "ProfileFieldTypes::RADIO"|enum}
        <div id={$element_id}>
            {foreach from=$field.values key=k item=v name="rfe"}
            <input class="radio {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if} {$id_prefix}elm_{$field.field_id}" type="radio" id="{$id_prefix}elm_{$field.field_id}_{$k}" name="{$data_name}[{$data_id}]" value="{$k}" {if (!$value && $smarty.foreach.rfe.first) || $value == $k}checked="checked"{/if} {if !$skip_field}{$disabled_param nofilter}{/if} /><span class="radio">{$v}</span>
            {/foreach}
        </div>

    {elseif $field.field_type == "ProfileFieldTypes::ADDRESS_TYPE"|enum}
        <input class="radio {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if} {$id_prefix}elm_{$field.field_id}" type="radio" id="{$id_prefix}elm_{$field.field_id}_residential" name="{$data_name}[{$data_id}]" value="residential" {if !$value || $value == "residential"}checked="checked"{/if} {if !$skip_field}{$disabled_param nofilter}{/if} /><span class="radio">{__("address_residential")}</span>
        <input class="radio {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if} {$id_prefix}elm_{$field.field_id}" type="radio" id="{$id_prefix}elm_{$field.field_id}_commercial" name="{$data_name}[{$data_id}]" value="commercial" {if $value == "commercial"}checked="checked"{/if} {if !$skip_field}{$disabled_param nofilter}{/if} /><span class="radio">{__("address_commercial")}</span>

    {elseif $field.field_type == "ProfileFieldTypes::VENDOR_TERMS"|enum}

        {include file="views/profiles/components/vendor_terms.tpl"}

    {elseif $field.field_type == "ProfileFieldTypes::FILE"|enum}
        {if isset($value.file_name)}
            <div class="text-type-value" data-file-id="{$hash_name}">
                <i id="{$hash_name}" title="{__("remove_this_item")}" class="ty-icon-cancel-circle ty-fileuploader__icon cm-file-remove {if $field.required == "YesNo::YES"|enum}cm-file-required{/if}"></i>
                <span class="ty-fileuploader__filename ty-filename-link">
                    <a href="{$value.link|default:""}">{$value.file_name}</a>
                </span>
            </div>
        {/if}
        {include file="common/fileuploader.tpl"
            var_name=$var_name
            label_id="elm_{$id_prefix}{$field.field_id}"
            hidden_name="{$data_name}[{$data_id}]"
            hidden_value=$value.file_name|default:""
            prefix=$id_prefix
            disabled_param=$disabled_param
            max_upload_filesize=$config.tweaks.profile_field_max_upload_filesize
        }

    {else}  {* Simple input *}
        <input
            {if $field.autocomplete_type}x-autocompletetype="{$field.autocomplete_type}"{/if}
            type="text"
            id={$element_id}
            name="{$data_name}[{$data_id}]"
            size="32"
            value="{$value}"
            class="ty-input-text{if ($field.autocomplete_type == "phone-full") || ($field.field_type == "ProfileFieldTypes::PHONE"|enum)} cm-mask-phone{/if} {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if} {if $smarty.foreach.profile_fields.index == 0} cm-focus{/if}" {if !$skip_field}{$disabled_param nofilter}{/if}
            {if $field.placeholder}placeholder="{$field.placeholder}"{/if}
            {if $field.maxlength}maxlength="{$field.maxlength}"{/if}
        />
    {/if}

{assign var="pref_field_name" value=$field.description}
</div>
{/hook}
{/foreach}

{if $body_id || $grid_wrap}
        </div>
    </div>
{/if}
</div>

{/if}
{/if}

<style>
.icon-question-sign {
    position: absolute;
    background: url("data: image/svg+xml, %3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 54 54' style='max-width: 80px;'%3E%3Cg%3E%3Cpath d='M27,8c-9.374,0-17,7.626-17,17c0,7.112,4.391,13.412,11,15.9V50c0,0.553,0.447,1,1,1h1v2c0,0.553,0.447,1,1,1h6 c0.553,0,1-0.447,1-1v-2h1c0.553,0,1-0.447,1-1v-9.1c6.609-2.488,11-8.788,11-15.9C44,15.626,36.374,8,27,8z M30,49 c-0.553,0-1,0.447-1,1v2h-4v-2c0-0.553-0.447-1-1-1h-1v-5h8v5H30z M31.688,39.242C31.277,39.377,31,39.761,31,40.192V42h-8v-1.808 c0-0.432-0.277-0.815-0.688-0.95C16.145,37.214,12,31.49,12,25c0-8.271,6.729-15,15-15s15,6.729,15,15 C42,31.49,37.855,37.214,31.688,39.242z'/%3E%3Cpath d='M27,6c0.553,0,1-0.447,1-1V1c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C26,5.553,26.447,6,27,6z'/%3E%3Cpath d='M51,24h-4c-0.553,0-1,0.447-1,1s0.447,1,1,1h4c0.553,0,1-0.447,1-1S51.553,24,51,24z'/%3E%3Cpath d='M7,24H3c-0.553,0-1,0.447-1,1s0.447,1,1,1h4c0.553,0,1-0.447,1-1S7.553,24,7,24z'/%3E%3Cpath d='M43.264,7.322l-2.828,2.828c-0.391,0.391-0.391,1.023,0,1.414c0.195,0.195,0.451,0.293,0.707,0.293 s0.512-0.098,0.707-0.293l2.828-2.828c0.391-0.391,0.391-1.023,0-1.414S43.654,6.932,43.264,7.322z'/%3E%3Cpath d='M12.15,38.436l-2.828,2.828c-0.391,0.391-0.391,1.023,0,1.414c0.195,0.195,0.451,0.293,0.707,0.293 s0.512-0.098,0.707-0.293l2.828-2.828c0.391-0.391,0.391-1.023,0-1.414S12.541,38.045,12.15,38.436z'/%3E%3Cpath d='M41.85,38.436c-0.391-0.391-1.023-0.391-1.414,0s-0.391,1.023,0,1.414l2.828,2.828c0.195,0.195,0.451,0.293,0.707,0.293 s0.512-0.098,0.707-0.293c0.391-0.391,0.391-1.023,0-1.414L41.85,38.436z'/%3E%3Cpath d='M12.15,11.564c0.195,0.195,0.451,0.293,0.707,0.293s0.512-0.098,0.707-0.293c0.391-0.391,0.391-1.023,0-1.414l-2.828-2.828 c-0.391-0.391-1.023-0.391-1.414,0s-0.391,1.023,0,1.414L12.15,11.564z'/%3E%3Cpath d='M27,13c-6.617,0-12,5.383-12,12c0,0.553,0.447,1,1,1s1-0.447,1-1c0-5.514,4.486-10,10-10c0.553,0,1-0.447,1-1 S27.553,13,27,13z'/%3E%3C/g%3E%3C/svg%3E") no-repeat center;
    width: 19px;
    height: 19px;
    background-size: 16px;
}
</style>
