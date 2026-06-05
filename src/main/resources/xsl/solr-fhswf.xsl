<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:mods="http://www.loc.gov/mods/v3"
                xmlns:mcrxml="xalan://org.mycore.common.xml.MCRXMLFunctions"
                xmlns:xalan="http://xml.apache.org/xalan"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                exclude-result-prefixes="mods xlink"
>
  <xsl:import href="xslImport:solr-document:solr-fhswf.xsl" />
  <xsl:include href="mods-utils.xsl" />

  <xsl:template match="mycoreobject[contains(@ID,'_mods_')]">
    <xsl:apply-imports />

    <xsl:apply-templates select="metadata/def.modsContainer/modsContainer/mods:mods" mode="timebarExtension"/>

  </xsl:template>

  <xsl:template match="mods:mods" mode="timebarExtension">

    <xsl:if test="mods:originInfo/mods:dateIssued">
      <field name="mods.dateIssued_range">
        <xsl:value-of select="mods:originInfo/mods:dateIssued" />
      </field>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
