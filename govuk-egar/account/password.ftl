<#import "template.ftl" as layout>
<@layout.mainLayout active='password' bodyClass='password'; section>

    <div class="row">
        <div class="col-md-10">
            <h1 class="heading-large">${msg("changePasswordHtmlTitle")}</h1>
        </div>
        <div class="col-md-2 subtitle">
            <!-- <span class="subtitle"></span> -->
        </div>
    </div>

    <#if message?has_content>
        <#if message.type = 'error'>
            <div class="error-summary" role="group" aria-labelledby="error-summary-heading-example-1" tabindex="-1">
                <h1 class="heading-medium error-summary-heading" id="error-summary-heading-example-1">
                    There is a problem with this form
                </h1>

                <ul class="error-summary-list" id="error-details">
                    <li>${message.summary}</li>
                </ul>
            </div>
        <#else>
            <div class="${properties.kcFeedbackAreaClass!}">
                <div class="alert alert-${message.type}"><p>
                    <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                    <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                    <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                    <span class="kc-feedback-text">${message.summary}</span></p>
                </div>
            </div>
        </#if>
    </#if>

    <form action="${url.passwordUrl}" class="form-horizontal" method="post">
        <input type="text" readonly value="this is not a login form" style="display: none;">
        <input type="password" readonly value="this is not a login form" style="display: none;">

        <#if password.passwordSet>
            <div class="form-group">
                <div class="col-sm-2 col-md-2">
                    <label for="password" class="form-label form-label-bold">${msg("password")}</label>
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="password" class="form-control" id="password" name="password" autofocus autocomplete="off">
                </div>
            </div>
        </#if>

        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker?html}">

        <div class="form-group">
            <div class="col-sm-2 col-md-2">
                <label for="password-new" class="form-label form-label-bold">${msg("passwordNew")}</label>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="password" class="form-control" id="password-new" name="password-new" autocomplete="off">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-2 col-md-2">
                <label for="password-confirm" class="form-label form-label-bold" class="two-lines">${msg("passwordConfirm")}</label>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="password" class="form-control" id="password-confirm" name="password-confirm" autocomplete="off">
            </div>
        </div>

        <div class="form-group">
            <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                <div class="">
                    <a href="${url.passwordUrl}" class="button secondary">${msg("doCancel")}</a>
                    <button type="submit" class="button primary" name="submitAction" value="Save">${msg("doSave")}</button>
                </div>
            </div>
        </div>
    </form>

</@layout.mainLayout>