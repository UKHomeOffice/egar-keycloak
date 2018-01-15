<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>

 <#if realm.displayName??>
    <#if realm.name == "egar">
        <a class="link-back" href="http://dev.egarteam.co.uk/egar/home">${msg("back")}</a>
    <#elseif realm.name == "egardemo">
        <a class="link-back" href="http://demo.egarteam.co.uk/egar/home">${msg("back")}</a>
    <#elseif realm.name == "egarlocal">
        <a class="link-back" href="http://localhost:8010/egar/home">${msg("back")}</a>
    <#elseif realm.name == "egarlive">
        <a class="link-back" href="http://live.egarteam.co.uk/egar/home">${msg("back")}</a>
    </#if>
    </#if>

    <div class="row">
        <div class="col-md-10">
            <h1 class="heading-large">${msg("editAccountHtmlTitle")}</h1>
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

    <form action="${url.accountUrl}" class="form-horizontal" method="post">

        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker?html}">

        <#if !realm.registrationEmailAsUsername>
            <div class="form-group ${messagesPerField.printIfExists('username','has-error')}">
                <div class="col-sm-2 col-md-2">
                    <label for="username" class="form-label form-label-bold">${msg("username")}<#if realm.editUsernameAllowed></#if></label> 
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" id="username" name="username" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')?html}"/>
                </div>
            </div>
        </#if>

        
        <input type="hidden" class="form-control" id="email" name="email" autofocus value="${(account.email!'')?html}"/>
            

        <div class="form-group ${messagesPerField.printIfExists('firstName','has-error')}">
            <div class="col-sm-2 col-md-2">
                <label for="firstName" class="form-label form-label-bold">${msg("firstName")}</label> 
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control" id="firstName" name="firstName" maxlength="35" value="${(account.firstName!'')?html}"/>
            </div>
        </div>

        <div class="form-group ${messagesPerField.printIfExists('lastName','has-error')}">
            <div class="col-sm-2 col-md-2">
                <label for="lastName" class="form-label form-label-bold">${msg("lastName")}</label>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control" id="lastName" name="lastName" maxlength="35" value="${(account.lastName!'')?html}"/>
            </div>
        </div>

        <div class="form-group ${messagesPerField.printIfExists('user.attributes.contactNumber','has-error')}">
            <div class="col-sm-2 col-md-2">
                <label for="user.attributes.contactNumber" class="form-label form-label-bold">${msg("contactNumber")}</label>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control" id="user.attributes.contactNumber" name="user.attributes.contactNumber" value="${(account.attributes.contactNumber!'')?html}"/>
            </div>
        </div>

        <div class="form-group ${messagesPerField.printIfExists('user.attributes.altContactNumber','has-error')}">
            <div class="col-sm-2 col-md-2">
                <label for="user.attributes.altContactNumber" class="form-label form-label-bold">${msg("altContactNumber")}</label>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control" id="user.attributes.altContactNumber" name="user.attributes.altContactNumber" value="${(account.attributes.altContactNumber!'')?html}"/>
            </div>
        </div>

        <div class="form-group">
            <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                <div class="">
                    <button type="submit" class="button secondary" name="submitAction" value="Cancel">${msg("doCancel")}</button>
                    <button type="submit" class="button primary" name="submitAction" value="Save">${msg("doSave")}</button>
                </div>
            </div>
        </div>
    </form>

</@layout.mainLayout>