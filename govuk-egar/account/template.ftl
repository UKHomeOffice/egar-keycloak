<#macro mainLayout active bodyClass displayInfo=false>
<!DOCTYPE html>

<#-- Attempt to reverse-engineer code for page’s current language, as Keycloak does not currently make this available -->
<#assign LANG_CODE = "en">
<#if .locale??>
    <#assign LANG_CODE = .locale>
</#if>
<#if locale??>
    <#list locale.supported>
        <#items as supportedLocale>
            <#if supportedLocale.label == locale.current>
                <#if supportedLocale.url?contains("?kc_locale=")>
                    <#assign LANG_CODE = supportedLocale.url?keep_after("?kc_locale=")[0..1]>
                </#if>
                <#if supportedLocale.url?contains("&kc_locale=")>
                    <#assign LANG_CODE = supportedLocale.url?keep_after("&kc_locale=")[0..1]>
                </#if>
            </#if>
        </#items>
    </#list>
</#if>

<!--[if lt IE 9]><html class="lte-ie8 ${properties.kcHtmlClass!}" lang="${LANG_CODE}"><![endif]-->
<!--[if gt IE 8]><!--><html class="${properties.kcHtmlClass!}" lang="${LANG_CODE}"><!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("editAccountHtmlTitle")} - ${realm.displayName?html!'GOV.UK'}</title>

    <#-- Start GOV.UK Template <head> content -->

    <!--[if gt IE 8]><!--><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template.css?0.22.1" media="screen" rel="stylesheet" /><!--<![endif]-->
    <!--[if IE 6]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie6.css?0.22.1" media="screen" rel="stylesheet" /><![endif]-->
    <!--[if IE 7]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie7.css?0.22.1" media="screen" rel="stylesheet" /><![endif]-->
    <!--[if IE 8]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie8.css?0.22.1" media="screen" rel="stylesheet" /><![endif]-->
    <link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-print.css?0.22.1" media="print" rel="stylesheet" />

    <!--[if IE 8]><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/fonts-ie8.css?0.22.1" media="all" rel="stylesheet" /><![endif]-->
    <!--[if gte IE 9]><!--><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/fonts.css?0.22.1" media="all" rel="stylesheet" /><!--<![endif]-->
    <!--[if lt IE 9]><script src="${url.resourcesPath}/vendor/govuk_template/javascripts/ie.js?0.22.1"></script><![endif]-->

    <link rel="shortcut icon" href="${url.resourcesPath}/vendor/govuk_template/images/favicon.ico?0.22.1" type="image/x-icon" />
    <link rel="mask-icon" href="${url.resourcesPath}/vendor/govuk_template/images/gov.uk_logotype_crown.svg?0.22.1" color="#0b0c0c">
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-152x152.png?0.22.1">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-120x120.png?0.22.1">
    <link rel="apple-touch-icon-precomposed" sizes="76x76" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-76x76.png?0.22.1">
    <link rel="apple-touch-icon-precomposed" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-60x60.png?0.22.1">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:image" content="${url.resourcesPath}/vendor/govuk_template/images/opengraph-image.png?0.22.1">

    <#-- End GOV.UK Template <head> content -->


    <#-- GOV.UK Elements stylesheets -->

    <!--[if gt IE 8]><!--><link href="${url.resourcesPath}/css/govuk_elements.css" rel="stylesheet" type="text/css"><!--<![endif]-->
    <!--[if IE 6]><link href="${url.resourcesPath}/css/govuk_elements-ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
    <!--[if IE 7]><link href="${url.resourcesPath}/css/govuk_elements-ie7.css" rel="stylesheet" type="text/css" /><![endif]-->
    <!--[if IE 8]><link href="${url.resourcesPath}/css/govuk_elements-ie8.css" rel="stylesheet" type="text/css" /><![endif]-->

    <#-- End GOV.UK Elements stylesheets -->
    
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script type="text/javascript" src="${url.resourcesPath}/${script}"></script>
        </#list>
    </#if>
</head>
<body class="admin-console user ${bodyClass}">
     <#-- Add GOV.UK Template <body> JavaScript class -->
    <script>document.body.className = ((document.body.className) ? document.body.className + ' js-enabled' : 'js-enabled');</script>

    <#-- Start GOV.UK Template header -->

    <div id="skiplink-container">
      <div>
        <a href="#content" class="skiplink">Skip to main content</a>
      </div>
    </div>
    <div id="global-cookie-message">

        <p>GOV.UK uses cookies to make the site simpler. <a href=\"https://www.gov.uk/help/cookies\">Find out more about cookies</a></p>

    </div>
    <header role="banner" id="global-header" class="${properties.kcHeaderClass!} with-proposition">
      <div class="header-wrapper">
        <div class="header-global">
          <div class="header-logo">
            <a href="https://www.gov.uk" title="Go to the GOV.UK homepage" id="logo" class="content">
              <img src="${url.resourcesPath}/vendor/govuk_template/images/gov.uk_logotype_crown_invert_trans.png?0.22.1" width="36" height="32" alt=""> GOV.UK
            </a>
          </div>
        </div>
        <#if realm.displayNameHtml?? || realm.displayName??>
          <div class="header-proposition">
            <div class="content">
              <#if realm.displayName??>
                <#if realm.name == "egar">
                    <a href="http://dev.egarteam.co.uk/" id="proposition-name">${realm.displayName}</a>
                    <ul> 
                        <li><a href="http://dev.egarteam.co.uk/oauth/logout?redirect=/welcome">${msg("doSignOut")}</a></li>               
                    </ul>                    
                <#elseif realm.name == "egardemo">
                    <a href="http://demo.egarteam.co.uk/" id="proposition-name">${realm.displayName}</a>
                    <ul> 
                        <li><a href="http://demo.egarteam.co.uk/oauth/logout?redirect=/welcome">${msg("doSignOut")}</a></li>               
                    </ul>                    
                <#elseif realm.name == "egarlocal">
                    <a href="http://localhost:8010/" id="proposition-name">${realm.displayName}</a>
                    <ul> 
                        <li><a href="http://localhost:8010/oauth/logout?redirect=/welcome">${msg("doSignOut")}</a></li>           
                    </ul>
                <#elseif realm.name == "egarlive">
                    <a href="http://live.egarteam.co.uk/" id="proposition-name">${realm.displayName}</a>
                    <ul> 
                        <li><a href="http://live.egarteam.co.uk/oauth/logout?redirect=/welcome">${msg("doSignOut")}</a></li>               
                    </ul>
                </#if>
              </#if>

            </div>
          </div>
        </#if>
        
      </div>
    </header>

    <div id="global-header-bar"></div>
    
    <#-- End GOV.UK Template header -->
    <main id="content" role="main">
        <#if url.referrerURI??><a href="${url.referrerURI}">${msg("backToApplication")}/a></#if>
        <div class="grid-row">
            <div class="column-two-thirds">
                <#nested "content">
            </div>
            <div class="column-one-third">
                <#if displayInfo>
                    <div id="kc-info" class="${properties.kcInfoAreaClass!}">
                        <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                            <#nested "info">
                        </div>
                    </div>
                </#if>
            </div>
        </div>
    </main>
    
    <#-- Start GOV.UK Template footer -->

    <footer class="group js-footer" id="footer" role="contentinfo">

      <div class="footer-wrapper">
        <div class="footer-meta">
          <div class="footer-meta-inner">

            <div class="open-government-licence">
              <p class="logo"><a href="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/" rel="license">Open Government Licence</a></p>

                <p>All content is available under the <a href="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/" rel="license">Open Government Licence v3.0</a>, except where otherwise stated</p>

            </div>
          </div>

          <div class="copyright">
            <a href="http://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/copyright-and-re-use/crown-copyright/">&copy; Crown copyright</a>
          </div>
        </div>
      </div>
    </footer>

    <div id="global-app-error" class="app-error hidden"></div>

    <script src="${url.resourcesPath}/vendor/govuk_template/javascripts/govuk-template.js?0.22.1"></script>

    <script>if (typeof window.GOVUK === 'undefined') document.body.className = document.body.className.replace('js-enabled', '');</script>

    <#-- End GOV.UK Template footer -->
</body>
</html>
</#macro>