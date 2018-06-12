<xsl:stylesheet 
   exclude-result-prefixes="catalog ns xs f"
   version="2.0"
   xmlns:catalog="urn:oasis:names:tc:entity:xmlns:xml:catalog"   
   xmlns:f="http://example.org/functions"
   xmlns:ns="http://example.org/namespaces"
   xmlns:xml="http://www.w3.org/XML/1998/namespace"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns="http://www.w3.org/1999/xhtml">

  <!-- ================================================================== -->
  <!-- mode: component-diagram-td -->
  <!-- ================================================================== -->

  <xsl:template match="/xs:schema/xs:complexType[@name]
                       | /xs:schema/xs:simpleType[@name]
                       | /xs:schema/xs:element[@name]
                       | /xs:schema/xs:attribute[@name]
                       | /xs:schema/xs:attributeGroup[@name]"
                mode="component-diagram-td">
    <xsl:variable name="qname" select="f:xs-component-get-qname(.)"/>
    <TD xmlns=""
        ALIGN="LEFT"
        HREF="{f:qname-get-href('../..', $qname)}"
        PORT="{generate-id(.)}">
      <xsl:variable name="definition" as="xs:string"
                    select="f:safe-string(f:xs-component-get-definition(.))"/>
      <xsl:if test="string-length(normalize-space($definition)) gt 0">
        <xsl:attribute name="TOOLTIP" select="normalize-space($definition)"/>
      </xsl:if>
      <xsl:if test="self::xs:attribute">
        <xsl:text>@</xsl:text>
      </xsl:if>
      <xsl:value-of select="$qname"/>
    </TD>
  </xsl:template>

  <xsl:template match="@*|node" mode="component-diagram-td" priority="-1">
    <xsl:message terminate="yes">Unexpected content (mode=component-diagram-td; <xsl:value-of select="name()"/>)</xsl:message>
  </xsl:template>

</xsl:stylesheet>