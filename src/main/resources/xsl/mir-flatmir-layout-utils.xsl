<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:i18n="xalan://org.mycore.services.i18n.MCRTranslation"
    xmlns:mcrver="xalan://org.mycore.common.MCRCoreVersion"
    xmlns:mcrxsl="xalan://org.mycore.common.xml.MCRXMLFunctions"
    exclude-result-prefixes="i18n mcrver mcrxsl">


  <xsl:import href="resource:xsl/layout/mir-common-layout.xsl" />
  <xsl:param name="piwikID" select="'0'" />

  <xsl:template name="mir.navigation">

    <div class="container">
      <div class="row">
        <div class="col-12">

          <div id="options_nav_box" class="mir-prop-nav">
            <nav>
              <ul class="navbar-nav ml-auto flex-row">
                <xsl:call-template name="mir.loginMenu" />
                <xsl:call-template name="mir.languageMenu" />
              </ul>
            </nav>
          </div>

        </div>
      </div>
      <div class="row">
        <div class="col-12 col-lg-3">

          <div id="fhswf_logo_box">
            <a href="https://www4.fh-swf.de/"
               class="">
              <img src="{$WebApplicationBaseURL}images/logos/fh-logo.png" alt="Fachhochschule Südwestfalen" title="zur Startseite" />
            </a>
          </div>

        </div>
        <div class="col">
          <div class="row">
            <div class="col-12">

              <div id="project_logo_box">
                <a href="{concat($WebApplicationBaseURL,substring($loaded_navigation_xml/@hrefStartingPage,2),$HttpSession)}"
                  class="">
                  <xsl:choose>
                    <xsl:when test="$CurrentLang='en'">
                      <span id="logo_mir"><strong>PIA</strong> - <strong>P</strong>ublication, <strong>I</strong>nformation and <strong>A</strong>rchive</span>
                    </xsl:when>
                    <xsl:otherwise>
                      <span id="logo_mir"><strong>PIA</strong> - <strong>P</strong>ublikation, <strong>I</strong>nformation und <strong>A</strong>rchiv</span>
                    </xsl:otherwise>
                  </xsl:choose>
                </a>
              </div>

            </div>
          </div>
          <div class="row search-row">
            <div class="col-auto col-sm-3 col-lg-auto order-2 order-sm-1">

              <nav class="navbar navbar-expand-lg navbar-light mir-main-nav">
                <button
                  class="navbar-toggler"
                  type="button"
                  data-toggle="collapse"
                  data-target=".mir-main-nav__entries"
                  aria-controls="mir-main-nav__entries"
                  aria-expanded="false"
                  aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse mir-main-nav__entries">
                  <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <xsl:for-each select="$loaded_navigation_xml/menu">
                      <xsl:choose>
                        <xsl:when test="@id='main'"/>
                        <xsl:when test="@id='brand'"/>
                        <xsl:when test="@id='below'"/>
                        <xsl:when test="@id='user'"/>
                        <xsl:otherwise>
                          <xsl:apply-templates select="."/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                    <xsl:call-template name="mir.basketMenu" />
                  </ul>
                </div>
              </nav>

            </div>
            <div class="col col-sm-9 col-lg search-column order-1 order-sm-2">

              <form
                action="{$WebApplicationBaseURL}servlets/solr/find"
                class="searchfield_box form-inline justify-content-end"
                role="search">
                <xsl:choose>
                  <xsl:when test="mcrxsl:isCurrentUserInRole('admin') or mcrxsl:isCurrentUserInRole('editor')">
                    <input name="owner" type="hidden" value="createdby:*" />
                  </xsl:when>
                  <xsl:when test="not(mcrxsl:isCurrentUserGuestUser())">
                    <input name="owner" type="hidden" value="createdby:{$CurrentUser}" />
                  </xsl:when>
                </xsl:choose>
                <div class="input-group">
                  <input name="condQuery" placeholder="{i18n:translate('mir.navsearch.placeholder')}" class="form-control search-query" id="searchInput" type="text" />
                  <div class="input-group-append">
                    <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
                  </div>
                </div>
              </form>

            </div>
          </div>
        </div>
      </div>
    </div>

<!--
    <div id="header_box" class="clearfix container">
      <div id="options_nav_box" class="mir-prop-nav">
        <nav>
          <ul class="navbar-nav ml-auto flex-row">
            <xsl:call-template name="mir.loginMenu" />
            <xsl:call-template name="mir.languageMenu" />
          </ul>
        </nav>
      </div>
    </div>


    <div class="mir-main-nav">
      <div class="container">

        <nav class="navbar navbar-expand-lg navbar-light">

          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target=".mir-main-nav__entries"
            aria-controls="mir-main-nav__entries"
            aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse mir-main-nav__entries justify-content-between">

            <div id="fhswf_logo_box">
              <a href="https://www4.fh-swf.de/"
                 class="">
                <img src="{$WebApplicationBaseURL}images/logos/fh-logo.png" alt="Fachhochschule Südwestfalen" title="zur Startseite" />
              </a>
            </div>

            <div class="d-flex flex-column">
              <div id="project_logo_box">
                <a href="{concat($WebApplicationBaseURL,substring($loaded_navigation_xml/@hrefStartingPage,2),$HttpSession)}"
                  class="">
                  <span id="logo_mir"><strong>PIA</strong> - <strong>P</strong>ublikation, <strong>I</strong>nformation und <strong>A</strong>rchiv</span>
                </a>
              </div>

              <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <xsl:for-each select="$loaded_navigation_xml/menu">
                  <xsl:choose>
                    <xsl:when test="@id='main'"/>
                    <xsl:when test="@id='brand'"/>
                    <xsl:when test="@id='below'"/>
                    <xsl:when test="@id='user'"/>
                    <xsl:otherwise>
                      <xsl:apply-templates select="."/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>
                <xsl:call-template name="mir.basketMenu" />
              </ul>
            </div>

            <form action="{$WebApplicationBaseURL}servlets/solr/find" class="searchfield_box form-inline my-2" role="search">
              <div class="form-group">
                <input name="condQuery" placeholder="{i18n:translate('mir.navsearch.placeholder')}" class="form-control search-query" id="searchInput" type="text" />
                <xsl:choose>
                  <xsl:when test="mcrxsl:isCurrentUserInRole('admin') or mcrxsl:isCurrentUserInRole('editor')">
                    <input name="owner" type="hidden" value="createdby:*" />
                  </xsl:when>
                  <xsl:when test="not(mcrxsl:isCurrentUserGuestUser())">
                    <input name="owner" type="hidden" value="createdby:{$CurrentUser}" />
                  </xsl:when>
                </xsl:choose>
              </div>
              <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
            </form>
          </div>
        </nav>
      </div>
    </div>
  -->
  </xsl:template>

  <xsl:template name="mir.jumbotwo">
    <!-- show only on startpage -->
    <xsl:if test="//div/@class='jumbotwo'">
    </xsl:if>
  </xsl:template>

  <xsl:template name="mir.footer">
    <div class="container">
      <div class="row">
        <div class="col-12 text-right">
          <ul class="internal_links nav navbar-nav">
            <xsl:apply-templates select="$loaded_navigation_xml/menu[@id='below']/*" mode="footerMenu" />
          </ul>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="mir.powered_by">
    <xsl:variable name="mcr_version" select="concat('MyCoRe ',mcrver:getCompleteVersion())" />
    <div id="powered_by">
      <a href="http://www.mycore.de">
        <img src="{$WebApplicationBaseURL}mir-layout/images/mycore_logo_small_invert.png" title="{$mcr_version}" alt="powered by MyCoRe" />
      </a>
    </div>
  </xsl:template>

</xsl:stylesheet>
