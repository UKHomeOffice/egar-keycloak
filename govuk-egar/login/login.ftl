<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("loginTitleHtml",(realm.displayNameHtml!''))}
    <#elseif section = "back">
     <#if realm.displayName??>
        <#if realm.name == "egar">
           <a class="link-back" href="http://dev.egarteam.co.uk/">${msg("backToLogin")}</a>
       <#elseif realm.name == "egardemo">
           <a class="link-back" href="http://demo.egarteam.co.uk/">${msg("backToLogin")}</a>
       <#elseif realm.name == "egarlocal">
           <a class="link-back" href="http://localhost:8010/">${msg("backToLogin")}</a>
       <#elseif realm.name == "egarlive">
           <a class="link-back" href="http://live.egarteam.co.uk/">${msg("backToLogin")}</a>
      </#if>
    </#if>
    <#elseif section = "form">  
        <h2 class="heading-medium">${msg("signInHeader")}</h2>
        <#if realm.password>
            <details>
                <summary><span class="summary">${msg("loginDirectSummary")}</span></summary>
                <div id="kc-form-wrapper" class="panel panel-border-narrow">
                    <form id="kc-form-login" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                        <div class="${properties.kcFormGroupClass!}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="username" class="${properties.kcLabelClass!}">${msg("loginUsernameLabel")}</label>
                                <p class="form-hint">${msg("loginUsernameHint")}</p>
                            </div>

                            <div class="${properties.kcInputWrapperClass!}">
                                <#if usernameEditDisabled??>
                                    <input id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')?html}" type="text" disabled />
                                <#else>
                                    <input id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')?html}" type="text" autofocus autocomplete="off" />
                                </#if>
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                            </div>

                            <div class="${properties.kcInputWrapperClass!}">
                                <input id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" />
                            </div>
                        </div>


                            <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                                <#if realm.rememberMe && !usernameEditDisabled??>
                                    <div class="checkbox ${properties.kcFormGroupClass}">
                                        <div class="multiple-choice">
                                            <#if login.rememberMe??>
                                                <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked>
                                                <label for="rememberMe" class="${properties.kcCheckboxLabelClass}">${msg("rememberMe")}</label>
                                            <#else>
                                                <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3">
                                                <label for="rememberMe" class="${properties.kcCheckboxLabelClass}">${msg("rememberMe")}</label>
                                            </#if>
                                        </div>
                                    </div>
                                </#if>
                            </div>

                            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!} ${properties.kcFormGroupClass}">
                                <div class="${properties.kcFormButtonsWrapperClass!}">
                                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                                </div>
                            </div>

                            <div class="${properties.kcFormOptionsWrapperClass!} ${properties.kcFormGroupClass}">
                                <#if realm.resetPasswordAllowed>
                                    <p><a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></p>
                                </#if>
                            </div>
                    </form>
                </div>
            </details>

            <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                <div id="kc-registration">
                    <h2 class="heading-medium">${msg("noAccount")}</h2>
                    <p><a href="${url.registrationUrl}">${msg("registerLink")}</a></p>
                </div>
            </#if>

        </#if>

    <#elseif section = "info" >
        <#if realm.password && social.providers??>
            <div id="kc-social-providers">
                <ul class="list horizontal">
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="button zocial ${p.providerId}">${p.displayName}</a></li>
                    </#list>
                </ul>
            </div>
        </#if>


        
    </#if>
</@layout.registrationLayout>
