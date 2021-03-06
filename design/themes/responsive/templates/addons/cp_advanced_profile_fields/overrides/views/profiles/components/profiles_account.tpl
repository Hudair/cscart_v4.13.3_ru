<!--Этот шаблон перезаписан с помощью модуля Cart-Power: Advanced Profile fields-->
{if !$nothing_extra}
    {include file="common/subheader.tpl" title=__("user_account_info")}
{/if}
<!--{$data_profile_fields.email.prompt|fn_print_r}-->
{hook name="profiles:account_info"}
    <div class="ty-control-group">
        <label for="email" class="ty-control-group__title cm-required cm-email cm-trim">{__("email")}{if $data_profile_fields.email.prompt}<a title="{$data_profile_fields.email.prompt}" class="cm-tooltip"><span class="icon icon-uniE010"></span></a>{/if}</label>
        <input {if $data_profile_fields.email.placeholder}placeholder="{$data_profile_fields.email.placeholder}"{/if} {if $data_profile_fields.email.maxlength}maxlength="{$data_profile_fields.email.maxlength}"{/if} type="text" id="email" name="user_data[email]" size="32" maxlength="128" value="{$user_data.email}" class="ty-input-text cm-focus" />
    </div>

    <div class="ty-control-group">
        <label for="password1" class="ty-control-group__title cm-required cm-password">{__("password")}{if $data_profile_fields.pass_1.prompt}<a title="{$data_profile_fields.pass_1.prompt}" class="cm-tooltip"><span class="icon icon-uniE010"></span></a>{/if}</label>
        <input {if $data_profile_fields.pass_1.placeholder}placeholder="{$data_profile_fields.pass_1.placeholder}"{/if} {if $data_profile_fields.pass_1.maxlength}maxlength="{$data_profile_fields.pass_1.maxlength}"{/if} type="password" id="password1" name="user_data[password1]" size="32" maxlength="32" value="{if $runtime.mode == "update"}            {/if}" class="ty-input-text cm-autocomplete-off" />
    </div>

    <div class="ty-control-group">
        <label for="password2" class="ty-control-group__title cm-required cm-password">{__("confirm_password")}{if $data_profile_fields.pass_2.prompt}<a title="{$data_profile_fields.pass_2.prompt}" class="cm-tooltip"><span class="icon icon-uniE010"></span></a>{/if}</label>
        <input {if $data_profile_fields.pass_2.placeholder}placeholder="{$data_profile_fields.pass_2.placeholder}"{/if} {if $data_profile_fields.pass_2.maxlength}maxlength="{$data_profile_fields.pass_2.maxlength}"{/if} type="password" id="password2" name="user_data[password2]" size="32" maxlength="32" value="{if $runtime.mode == "update"}            {/if}" class="ty-input-text cm-autocomplete-off" />
    </div>
{/hook}
