<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${msg("emailVerificationBodyHtml", link, linkExpiration, realmName)}
    </#if>
    <#if section = "linkText">
        ${msg("emailVerificationLinkTextHtml")}
    </#if>
</@layout.htmlEmailLayout>