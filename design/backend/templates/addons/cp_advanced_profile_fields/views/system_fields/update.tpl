<!--Этот шаблон перезаписан с помощью модуля Cart-Power: Advanced Profile fields-->
{if $field}
    {assign var="id" value=$field.field_id}
{else}
    {assign var="id" value="0"}
{/if}

{script src="js/tygh/tabs.js"}

{literal}
<script>
function fn_check_field_type(value, tab_id)
{
    Tygh.$('#' + tab_id).toggleBy(!(value == 'R' || value == 'S'));
}
</script>
{/literal}

{if $field.is_default == "Y" || $field.section == "ProfileFieldSections::BILLING_ADDRESS"|enum}
    {assign var="block_fields" value=true}
{/if}

{capture name="blocked_changing_info"}
    {if $block_fields && $field.is_default != "Y"}
        {__("edit_corresponding_profile_field", ["[URL]" => fn_url("profile_fields.update&field_id=`$field.matching_id`")])}
    {/if}
{/capture}

{if "ULTIMATE"|fn_allowed_for && $runtime.company_id}
    {assign var="hide_inputs" value="cm-hide-inputs"}
    {assign var="hide_multiple_buttons" value="hidden"}
{/if}

{capture name="mainbox"}

<form action="{""|fn_url}" enctype="multipart/form-data" method="post" name="add_fields_form" class="form-horizontal form-edit  {$hide_inputs}">

<div class="cm-j-tabs cm-track tabs">
    <ul class="nav nav-tabs">
        <li id="tab_new_profile{$id}" class="cm-js active"><a>{__("general")}</a></li>
        <li id="tab_variants{$id}"
            class="cm-js {if $field.is_default == "Y" || ($field.field_type != "ProfileFieldTypes::RADIO"|enum && $field.field_type != "ProfileFieldTypes::SELECT_BOX"|enum)}hidden{/if}"
        ><a>{__("variants")}</a></li>
    </ul>
</div>
<div class="cm-tabs-content">
    <div id="content_tab_new_profile{$id}">
        <input type="hidden" name="sys_field_data[profiles_name]" value="{$profiles_name}" />
        <input type="hidden" name="sys_field_data[profiles_description]" value="{$profiles_description}" />

        <div class="control-group">
            <label for="elm_field_placeholder" class="control-label">Placeholder:</label>
            <div class="controls">
            <input id="elm_field_placeholder" class="input-large" type="text" name="sys_field_data[placeholder]" value="{$placeholder}" />
            </div>
        </div>

        <div class="control-group">
            <label for="elm_field_prompt" class="control-label">Подсказка:</label>
            <div class="controls">
            <input id="elm_field_prompt" class="input-large" type="text" name="sys_field_data[prompt]" value="{$prompt}" />
            </div>
        </div>

        <div class="control-group">
            <label for="elm_field_maxlength" class="control-label">Длина строки:</label>
            <div class="controls">
            <input id="elm_field_maxlength" class="input-large" type="text" name="sys_field_data[maxlength]" value="{$maxlength}" />
            </div>
        </div>

    <!--content_tab_new_profile{$id}--></div>


</div>
</form>

{capture name="buttons"}
    {include file="buttons/save_cancel.tpl" but_name="dispatch[system_fields.update]" but_target_form="add_fields_form" save=$id}
{/capture}

{/capture}

{include file="common/mainbox.tpl"
    title=($id) ? $field.description : $profiles_description
    content=$smarty.capture.mainbox
    select_languages=true
    buttons=$smarty.capture.buttons
}
