<!--Этот шаблон перезаписан с помощью модуля Cart-Power: Advanced Profile fields-->
{if !$nothing_extra}
    {include file="common/subheader.tpl" title=__("user_account_info")}
{/if}
<!--{$data_profile_fields.email.prompt|fn_print_r}-->
{hook name="profiles:account_info"}
    <div class="ty-control-group">
        <label for="email" class="ty-control-group__title cm-required cm-email cm-trim">{__("email")}{if $data_profile_fields.email.prompt}<a title="{$data_profile_fields.email.prompt}" class="cm-tooltip"><i class="icon-question-sign-1"></i></a>{/if}</label>
        <input {if $data_profile_fields.email.placeholder}placeholder="{$data_profile_fields.email.placeholder}"{/if} {if $data_profile_fields.email.maxlength}maxlength="{$data_profile_fields.email.maxlength}"{/if} type="text" id="email" name="user_data[email]" size="32" maxlength="128" value="{$user_data.email}" class="ty-input-text cm-focus" />
    </div>

    <div class="ty-control-group">
        <label for="password1" class="ty-control-group__title cm-required cm-password">{__("password")}{if $data_profile_fields.pass_1.prompt}<a title="{$data_profile_fields.pass_1.prompt}" class="cm-tooltip"><i class="icon-question-sign-1"></i></a>{/if}</label>
        <input {if $data_profile_fields.pass_1.placeholder}placeholder="{$data_profile_fields.pass_1.placeholder}"{/if} {if $data_profile_fields.pass_1.maxlength}maxlength="{$data_profile_fields.pass_1.maxlength}"{/if} type="password" id="password1" name="user_data[password1]" size="32" maxlength="32" value="{if $runtime.mode == "update"}            {/if}" class="ty-input-text cm-autocomplete-off" />
    </div>

    <div class="ty-control-group">
        <label for="password2" class="ty-control-group__title cm-required cm-password">{__("confirm_password")}{if $data_profile_fields.pass_2.prompt}<a title="{$data_profile_fields.pass_2.prompt}" class="cm-tooltip"><i class="icon-question-sign-1"></i></a>{/if}</label>
        <input {if $data_profile_fields.pass_2.placeholder}placeholder="{$data_profile_fields.pass_2.placeholder}"{/if} {if $data_profile_fields.pass_2.maxlength}maxlength="{$data_profile_fields.pass_2.maxlength}"{/if} type="password" id="password2" name="user_data[password2]" size="32" maxlength="32" value="{if $runtime.mode == "update"}            {/if}" class="ty-input-text cm-autocomplete-off" />
    </div>
{/hook}

<style>
.icon-question-sign-1 {
    position: absolute;
    background: url("data: image/svg+xml, %3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 54 54' style='max-width: 80px;'%3E%3Cg%3E%3Cpath d='M27,8c-9.374,0-17,7.626-17,17c0,7.112,4.391,13.412,11,15.9V50c0,0.553,0.447,1,1,1h1v2c0,0.553,0.447,1,1,1h6 c0.553,0,1-0.447,1-1v-2h1c0.553,0,1-0.447,1-1v-9.1c6.609-2.488,11-8.788,11-15.9C44,15.626,36.374,8,27,8z M30,49 c-0.553,0-1,0.447-1,1v2h-4v-2c0-0.553-0.447-1-1-1h-1v-5h8v5H30z M31.688,39.242C31.277,39.377,31,39.761,31,40.192V42h-8v-1.808 c0-0.432-0.277-0.815-0.688-0.95C16.145,37.214,12,31.49,12,25c0-8.271,6.729-15,15-15s15,6.729,15,15 C42,31.49,37.855,37.214,31.688,39.242z'/%3E%3Cpath d='M27,6c0.553,0,1-0.447,1-1V1c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C26,5.553,26.447,6,27,6z'/%3E%3Cpath d='M51,24h-4c-0.553,0-1,0.447-1,1s0.447,1,1,1h4c0.553,0,1-0.447,1-1S51.553,24,51,24z'/%3E%3Cpath d='M7,24H3c-0.553,0-1,0.447-1,1s0.447,1,1,1h4c0.553,0,1-0.447,1-1S7.553,24,7,24z'/%3E%3Cpath d='M43.264,7.322l-2.828,2.828c-0.391,0.391-0.391,1.023,0,1.414c0.195,0.195,0.451,0.293,0.707,0.293 s0.512-0.098,0.707-0.293l2.828-2.828c0.391-0.391,0.391-1.023,0-1.414S43.654,6.932,43.264,7.322z'/%3E%3Cpath d='M12.15,38.436l-2.828,2.828c-0.391,0.391-0.391,1.023,0,1.414c0.195,0.195,0.451,0.293,0.707,0.293 s0.512-0.098,0.707-0.293l2.828-2.828c0.391-0.391,0.391-1.023,0-1.414S12.541,38.045,12.15,38.436z'/%3E%3Cpath d='M41.85,38.436c-0.391-0.391-1.023-0.391-1.414,0s-0.391,1.023,0,1.414l2.828,2.828c0.195,0.195,0.451,0.293,0.707,0.293 s0.512-0.098,0.707-0.293c0.391-0.391,0.391-1.023,0-1.414L41.85,38.436z'/%3E%3Cpath d='M12.15,11.564c0.195,0.195,0.451,0.293,0.707,0.293s0.512-0.098,0.707-0.293c0.391-0.391,0.391-1.023,0-1.414l-2.828-2.828 c-0.391-0.391-1.023-0.391-1.414,0s-0.391,1.023,0,1.414L12.15,11.564z'/%3E%3Cpath d='M27,13c-6.617,0-12,5.383-12,12c0,0.553,0.447,1,1,1s1-0.447,1-1c0-5.514,4.486-10,10-10c0.553,0,1-0.447,1-1 S27.553,13,27,13z'/%3E%3C/g%3E%3C/svg%3E") no-repeat center;
    width: 37px;
    height: 19px;
    background-size: 16px;
}
</style>
