<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
    ${msg("termsTitle")}
    <#elseif section = "header">
    ${msg("termsTitleHtml")}
    <#elseif section = "form">
    <h3>${msg("termsIntro")}</h3>
    <p>&nbsp;</p>

    <div id="kc-terms-text" >
        ${msg("termsText")}
    </div>
    <form class="form-actions" action="${url.loginAction}" method="POST">

    <div class="form-group">
        <fieldset class="inline">
            <div class="multiple-choice">
                <input id="radio-inline-1" type="radio" name="radio-inline-group" value="Yes"  aria-required="true" required="true">
                <label for="radio-inline-1">I agree</label>
            </div>
        </fieldset>
    </div>

        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="accept" id="kc-accept" type="submit" value="${msg("termsButton")}"/>
    </form>
    </#if>
</@layout.registrationLayout>