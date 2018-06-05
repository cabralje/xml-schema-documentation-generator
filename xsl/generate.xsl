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

  <xsl:include href="common.xsl"/>

  <xsl:param name="root-path" as="xs:string" required="yes"/>

  <xsl:output method="text" encoding="us-ascii"/>

  <!-- ================================================================== -->
  <!-- templates, in order of appearance -->
  <!-- ================================================================== -->

  <!-- ================================================================== -->
  <!-- default mode -->
  <!-- ================================================================== -->

  <xsl:template match="catalog:catalog">
    <xsl:apply-templates select="." mode="root-index"/>
    <xsl:apply-templates select="catalog:uri[ends-with(@uri, '.xsd')]"/>
  </xsl:template>

  <xsl:template match="catalog:uri">
    <xsl:apply-templates select="doc(resolve-uri(@uri, base-uri(.)))"/>
  </xsl:template>

  <xsl:template match="xs:schema">
    <xsl:apply-templates select="." mode="namespace-index"/>
    <xsl:apply-templates select="xs:complexType"/>
  </xsl:template>

  <xsl:template match="/xs:schema/xs:complexType[@name]">
    <xsl:apply-templates select="." mode="component-page"/>
  </xsl:template>

  <xsl:template match="@*|node()" priority="-2">
    <xsl:message terminate="yes">unexpected content (default mode)</xsl:message>
  </xsl:template>

  <!-- ================================================================== -->
  <!-- mode: root-index -->
  <!-- ================================================================== -->

  <xsl:template match="catalog:catalog" mode="root-index">
    <xsl:result-document
       href="{$root-path}/index.html"
       method="xml" version="1.0" encoding="UTF-8" indent="yes">
      <html>
        <head>
          <title>Index</title>
        </head>
        <body>
          <ul>
            <xsl:variable name="context" as="element(catalog:catalog)"
                          select="."/>
            <xsl:for-each select="$prefixes">
              <xsl:variable name="namespace" select="@uri" as="xs:string"/>
              <xsl:variable name="catalog-uri" as="element(catalog:uri)?"
                            select="$context/catalog:uri[@name = $namespace]"/>
              <xsl:if test="exists($catalog-uri)">
                <xsl:apply-templates mode="#current"
                                     select="doc(resolve-uri($catalog-uri/@uri, base-uri($catalog-uri)))"/>
              </xsl:if>
            </xsl:for-each>
          </ul>
        </body>
      </html>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="xs:schema" mode="root-index">
    <xsl:variable name="prefix" select="f:get-prefix(.)"/>
    <li>
      <p>
      <a href="{$prefix}/index.html">
        <xsl:value-of select="$prefix"/>
      </a>
      <xsl:text>: </xsl:text>
      <xsl:value-of select="@targetNamespace"/>
      </p>
      <div style="margin-left: 1em;">
        <p>
          <xsl:value-of select="f:xs-component-get-definition(.)"/>
        </p>
      </div>
    </li>
  </xsl:template>

  <xsl:template match="*" priority="-2" mode="root-index">
    <xsl:message terminate="yes">Unexpected element (mode = root-index, name= <xsl:value-of select="name()"/>).</xsl:message>
  </xsl:template>

  <xsl:template match="@*|node()" priority="-3" mode="root-index">
    <xsl:message terminate="yes">Unexpected content (mode = root-index).</xsl:message>
  </xsl:template>

  <!-- ================================================================== -->
  <!-- mode: namespace-index -->
  <!-- ================================================================== -->

  <xsl:template match="xs:schema" mode="namespace-index">
    <xsl:result-document
      href="{f:get-prefix(.)}/index.html"
      method="xml" version="1.0" encoding="UTF-8" indent="yes">
      <html>
        <head>
          <title>Index for namespace <code><xsl:value-of select="f:get-target-namespace(.)"/></code></title>
        </head>
        <body>
          <ul>
            <xsl:apply-templates select="xs:*[@name]" mode="#current">
              <xsl:sort select="@name"/>
            </xsl:apply-templates>
          </ul>
        </body>
      </html>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="/xs:schema/xs:*[@name]" mode="namespace-index">
    <li><a href="{@name}/index.html"><xsl:value-of select="@name"/> (<xsl:value-of select="local-name()"/>)</a></li>
  </xsl:template>

  <xsl:template match="*" mode="namespace-index" priority="-1">
    <xsl:message terminate="yes">Unexpected element <xsl:value-of select="name()"/></xsl:message>
  </xsl:template>

  <!-- ================================================================== -->
  <!-- mode: component-page -->
  <!-- ================================================================== -->

  <xsl:template match="/xs:schema/xs:complexType[@name]" mode="component-page">
    <xsl:variable name="prefix" select="f:get-prefix(.)"/>
    <xsl:variable name="name" select="@name"/>
    <xsl:result-document href="{$root-path}/{$prefix}/{$name}/index.html"
      method="xml" version="1.0" encoding="UTF-8" indent="yes">
      <html>
        <head>
          <title><xsl:value-of select="$prefix"/>:<xsl:value-of select="$name"/></title>
        </head>
        <body>
          <p class="title">
            <a href="../index.html">
              <xsl:value-of select="$prefix"/>
            </a>
            <xsl:text>:</xsl:text>
            <xsl:value-of select="$name"/>
          </p>
          <h1>Definition</h1>
          <p><xsl:value-of select="f:xs-component-get-definition(.)"/></p>
          <h1>Diagram</h1>
          <object data="diagram.svg" type="image/svg+xml">
            <img src="diagram.svg" usemap="#diagram"/>
            <!-- include diagram.map -->
          </object>
        </body>
      </html>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="*" mode="component-page" priority="-1">
    <xsl:message terminate="yes">Unexpected element <xsl:value-of select="name()"/></xsl:message>
  </xsl:template>

  <!-- ================================================================== -->
  <!-- mode: component-diagram -->
  <!-- ================================================================== -->

  <xsl:template match="catalog:catalog" mode="component-diagram">
    <xsl:apply-templates mode="#current"
                         select="catalog:uri[ends-with(@uri, '.xsd')]"/>
  </xsl:template>

  <xsl:template match="catalog:uri" mode="component-diagram">
    <xsl:apply-templates mode="#current"
                         select="doc(resolve-uri(@uri, base-uri(.)))"/>
  </xsl:template>

  <xsl:template match="xs:schema" mode="component-diagram">
    <xsl:apply-templates mode="#current"
                         select="xs:complexType"/>
  </xsl:template>

  <xsl:template match="/xs:schema/xs:complexType[@name]" mode="component-diagram">
    <xsl:variable name="prefix" select="f:get-prefix(.)"/>
    <xsl:result-document href="{$root-path}/{$prefix}/{@name}/diagram.dot"
                         method="text" encoding="US-ASCII">
      <xsl:variable name="object" as="item()*" xmlns="">
        <TABLE BORDER="1" CELLBORDER="0" CELLPADDING="0">
          <TR>
            <TD ALIGN="LEFT">
              <B><xsl:value-of select="$prefix"/>:<xsl:value-of select="@name"/></B>
            </TD>
            <TD>#</TD>
            <TD ALIGN="LEFT">Type</TD>
          </TR>
          <HR/>
          <xsl:apply-templates mode="component-diagram-type-table"/>
        </TABLE>
      </xsl:variable>
      
      digraph diagram {
        edge [fontname = "Helvetica", fontsize = 10, dir = forward];
        node [fontname = "Helvetica", fontsize = 10, width = 0, height = 0, shape = plain];
        rankdir=LR;

      &quot;<xsl:value-of select="$prefix"/>:<xsl:value-of select="@name"/>&quot; [label = &lt;
      <xsl:value-of select="f:to-dot-html($object)"/>
      &gt;];
      }
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="@*|node()" priority="-1" mode="component-diagram">
    <xsl:message terminate="yes">Unexpected content (mode=component-diagram)</xsl:message>
  </xsl:template>

  <xsl:function name="f:to-dot-html" as="xs:string">
    <xsl:param name="item" as="item()*"/>
    <xsl:variable name="html" as="xs:string">
      <xsl:value-of>
        <xsl:apply-templates select="$item" mode="to-dot-html"/>
      </xsl:value-of>
    </xsl:variable>
    <xsl:value-of select="$html"/>
  </xsl:function>

  <!-- ================================================================== -->
  <!-- mode: component-diagram-type-table -->
  <!-- ================================================================== -->

  <xsl:template mode="component-diagram-type-table"
                match="text()">
  </xsl:template>

  <xsl:template mode="component-diagram-type-table"
                match="xs:annotation|xs:documentation|xs:complexContent">
    <xsl:apply-templates select="*" mode="#current"/>
  </xsl:template>

  <xsl:template mode="component-diagram-type-table"
                match="xs:extension[@base]">
    <xsl:variable name="base-type" as="element()">
      <!-- here -->
    </xsl:variable>
  </xsl:template>

  <xsl:template match="*" priority="-1" mode="component-diagram-type-table">
    <xsl:message terminate="yes">Unexpected element (mode=component-diagram, location=<xsl:value-of select="base-uri(.)"/>, name=<xsl:value-of select="name()"/>)</xsl:message>
  </xsl:template>
  
  <xsl:template match="text()" priority="-1" mode="component-diagram-type-table">
    <xsl:message terminate="yes">Unexpected text (mode=component-diagram, text=<xsl:value-of select="."/>)</xsl:message>
  </xsl:template>
  
  <xsl:template match="@*|node()" priority="-2" mode="component-diagram-type-table">
    <xsl:message terminate="yes">Unexpected content (mode=component-diagram-type-table)</xsl:message>
  </xsl:template>
  

  <!-- ============================================================================= -->
  <!-- mode to-dot-html -->
  <!-- ============================================================================= -->

  <xsl:template match="*" mode="to-dot-html">
    <xsl:text>&lt;</xsl:text>
    <xsl:value-of select="name()"/>
    <xsl:apply-templates select="@*" mode="#current"/>
    <xsl:text>&gt;</xsl:text>
    <xsl:apply-templates select="node()" mode="#current"/>
    <xsl:text>&lt;/</xsl:text>
    <xsl:value-of select="name()"/>
    <xsl:text>&gt;</xsl:text>
  </xsl:template>

  <xsl:template match="@*" mode="to-dot-html">
    <xsl:text> </xsl:text>
    <xsl:value-of select="name()"/>
    <xsl:text>=&quot;</xsl:text>
    <xsl:value-of select="replace(., '&quot;', '&amp;&quot;')"/>
    <xsl:text>&quot;</xsl:text>
  </xsl:template>

  <xsl:template match="text()" mode="to-dot-html">
    <xsl:value-of select="replace(., '&lt;', '&amp;&lt;')"/>
  </xsl:template>

  <xsl:template match="@*|node()" priority="-1" mode="to-dot-html">
    <xsl:message terminate="yes">Unexpected content (mode=to-dot-html)</xsl:message>
  </xsl:template>

</xsl:stylesheet>
