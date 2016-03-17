<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:news="http://schemas.microsoft.com/LiveSearch/2008/04/XML/news">
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:template match="news:NewsResult">
    <xsl:value-of select="news:Source"/>
    <xsl:text>#TAB#</xsl:text>
    <xsl:value-of select="news:Title"/>
    <xsl:text>#TAB#</xsl:text>
    <xsl:value-of select="news:Url"/>
    <xsl:text>#R##N#</xsl:text>
  </xsl:template>
</xsl:stylesheet>