<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginProfileTitle")}
    <#elseif section = "header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
        <p>${msg("loginProfileSubTitle")}</p>
        <form id="kc-update-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <#if user.editUsernameAllowed>
                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="username" name="username" value="${(user.username!'')?html}" class="${properties.kcInputClass!}"/>
                    </div>
                </div>
            </#if>

            <input type="hidden" id="email" name="email" value="${(user.email!'')?html}" class="${properties.kcInputClass!}" />

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input maxlength="35" type="text" id="firstName" name="firstName" value="${(user.firstName!'')?html}" maxlength="35" class="${properties.kcInputClass!}" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input maxlength="35" type="text" id="lastName" name="lastName" value="${(user.lastName!'')?html}" maxlength="35" class="${properties.kcInputClass!}" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('user.attributes.contactNumber',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.contactNumber" class="${properties.kcLabelClass!}">${msg("contactNumber")}</label>
                </div>

                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" class="${properties.kcInputClass!}"  id="user.attributes.contactNumber" name="user.attributes.contactNumber" value="${(user.attributes.contactNumber!'')?html}" class="${properties.kcInputClass!}"/>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('user.attributes.altContactNumber',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.altContactNumber" class="${properties.kcLabelClass!}">${msg("altContactNumber")}</label>
                </div>

                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" class="${properties.kcInputClass!}"  id="user.attributes.altContactNumber" name="user.attributes.altContactNumber" value="${(user.attributes.altContactNumber!'')?html}" class="${properties.kcInputClass!}"/>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>