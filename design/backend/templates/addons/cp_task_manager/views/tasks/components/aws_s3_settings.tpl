{include file="common/subheader.tpl" title=__("cp_task_settings") target="#acc_task_{$smarty.const.TM_AWS_S3}"}
<div id="acc_task_{$smarty.const.TM_AWS_S3}" class="collapse in">
    <p class="muted">{__("cp_aws_s3_instruction") nofilter}</p>
    <div class="control-group">
        <label class="control-label" for="elm_task_{$smarty.const.TM_AWS_S3}_region">{__("ems_region")}{include file="common/tooltip.tpl" tooltip=__("cp_aws_s3_region_tooltip")}:</label>
        <div class="controls">
            <input type="text" name="task_data[task_settings][{$smarty.const.TM_AWS_S3}][region]" id="elm_task_{$smarty.const.TM_AWS_S3}_region" value="{$task.task_settings.region}" size="25" class="input-medium" />
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="elm_task_{$smarty.const.TM_AWS_S3}_key">{__("key")}{include file="common/tooltip.tpl" tooltip=__("cp_aws_s3_key_tooltip")}:</label>
        <div class="controls">
            <input type="text" name="task_data[task_settings][{$smarty.const.TM_AWS_S3}][key]" id="elm_task_{$smarty.const.TM_AWS_S3}_key" value="{$task.task_settings.key}" size="25" class="input-medium" />
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="elm_task_{$smarty.const.TM_AWS_S3}_secret">{__("cp_secret")}{include file="common/tooltip.tpl" tooltip=__("cp_aws_s3_secret_tooltip")}:</label>
        <div class="controls">
            <input type="text" name="task_data[task_settings][{$smarty.const.TM_AWS_S3}][secret]" id="elm_task_{$smarty.const.TM_AWS_S3}}_secret" value="{$task.task_settings.secret}" size="25" class="input-medium" />
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="elm_task_{$smarty.const.TM_AWS_S3}_bucket">{__("bucket")}{include file="common/tooltip.tpl" tooltip=__("cp_aws_s3_bucket_tooltip")}:</label>
        <div class="controls">
            <input type="text" name="task_data[task_settings][{$smarty.const.TM_AWS_S3}][bucket]" id="elm_task_{$smarty.const.TM_AWS_S3}}_bucket" value="{$task.task_settings.bucket}" size="25" class="input-medium" />
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="elm_task_{$smarty.const.TM_AWS_S3}_folder">{__("folder")}{include file="common/tooltip.tpl" tooltip=__("cp_aws_s3_folder_tooltip")}:</label>
        <div class="controls">
            <input type="text" name="task_data[task_settings][{$smarty.const.TM_AWS_S3}][folder]" id="elm_task_{$smarty.const.TM_AWS_S3}_folder" value="{$task.task_settings.folder|default:"`$config.dir.backups`"}" size="25" class="input-large" />
        </div>
    </div>
</div>
