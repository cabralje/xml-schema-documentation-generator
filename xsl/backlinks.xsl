<xsl:stylesheet 
   exclude-result-prefixes="xs f bl"
   version="2.0"
   xmlns:bl="http://example.org/backlinks"
   xmlns:f="http://example.org/functions"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:param name="backlinks-file" required="yes"/>
  <xsl:variable name="backlinks" as="element(bl:backlinks)"
                select="$backlinks-file/bl:backlinks"/>

  <xsl:function name="f:backlinks-get-elements-of-type" as="xs:QName*">
    <xsl:param name="type" as="xs:QName"/>
    <xsl:for-each
       select="$backlinks/bl:element-of-type[f:attribute-get-qname(@type) = $type]">
      <xsl:sequence select="f:attribute-get-qname(@element)"/>
    </xsl:for-each>
  </xsl:function>

  <xsl:function name="f:backlinks-get-attributes-of-type" as="xs:QName*">
    <xsl:param name="type" as="xs:QName"/>
    <xsl:for-each
       select="$backlinks/bl:attribute-of-type[f:attribute-get-qname(@type) = $type]">
      <xsl:sequence select="f:attribute-get-qname(@attribute)"/>
    </xsl:for-each>
  </xsl:function>

  <xsl:function name="f:backlinks-get-types-having-element" as="xs:QName*">
    <xsl:param name="element" as="xs:QName"/>
    <xsl:for-each
       select="$backlinks/bl:type-has-element[f:attribute-get-qname(@element) = $element]">
      <xsl:sequence select="f:attribute-get-qname(@type)"/>
    </xsl:for-each>
  </xsl:function>

  <xsl:function name="f:backlinks-get-types-having-attribute" as="xs:QName*">
    <xsl:param name="attribute" as="xs:QName"/>
    <xsl:for-each
       select="$backlinks/bl:type-has-attribute[f:attribute-get-qname(@attribute) = $attribute]">
      <xsl:sequence select="f:attribute-get-qname(@type)"/>
    </xsl:for-each>
  </xsl:function>

  <xsl:function name="f:backlinks-get-attribute-groups-having-attribute" as="xs:QName*">
    <xsl:param name="attribute" as="xs:QName"/>
    <xsl:for-each
       select="$backlinks/bl:attribute-group-has-attribute[f:attribute-get-qname(@attribute) = $attribute]">
      <xsl:sequence select="f:attribute-get-qname(@attribute-group)"/>
    </xsl:for-each>
  </xsl:function>

  <xsl:function name="f:backlinks-get-types-derived-from-type" as="xs:QName*">
    <xsl:param name="base-type" as="xs:QName"/>
    <xsl:for-each
      select="$backlinks/bl:type-derivation[f:attribute-get-qname(@base-type) = $base-type]">
      <xsl:variable name="derived-type" as="xs:QName"
                    select="f:attribute-get-qname(@derived-type)"/>
      <xsl:sequence select="$derived-type,f:backlinks-get-types-derived-from-type($derived-type)"/>
    </xsl:for-each>
  </xsl:function>

  <xsl:function name="f:backlinks-get-substitutable-elements" as="xs:QName*">
    <xsl:param name="base-element" as="xs:QName"/>
    <xsl:for-each
      select="$backlinks/bl:element-substitution-group[f:attribute-get-qname(@substitution-group) = $base-element]">
      <xsl:variable name="substitutable-element" as="xs:QName"
                    select="f:attribute-get-qname(@element)"/>
      <xsl:sequence select="$substitutable-element,f:backlinks-get-substitutable-elements($substitutable-element)"/>
    </xsl:for-each>
  </xsl:function>

  <xsl:function name="f:backlinks-get-elements-had-by-type" as="xs:QName*">
    <xsl:param name="type" as="xs:QName"/>
    <xsl:for-each
       select="$backlinks/bl:type-has-element[f:attribute-get-qname(@type) = $type]">
      <xsl:sequence select="f:attribute-get-qname(@element)"/>
    </xsl:for-each>
  </xsl:function>

</xsl:stylesheet>
