<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="/pokedex">
  <html>
  <body>
  <h2>Strong Attackers:
    <xsl:value-of select="pokemon[attack/text() > 150]" /></h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Name</th>
      <th>Type</th>
    </tr>
    <xsl:apply-templates select="pokemon[attack/text() > 150]" />
  </table>
  <h2>Strong Defenders:
    <xsl:value-of select="pokemon[defense/text() > 150]" /></h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Name</th>
      <th>Type</th>
    </tr>
    <xsl:apply-templates select="pokemon[defense/text() > 150]" />
  </table>
  <h2>Fast:
    <xsl:value-of select="pokemon[speed/text() > 150]" /></h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Name</th>
      <th>Type</th>
    </tr>
    <xsl:apply-templates select="pokemon[speed/text() > 150]" />
  </table>
  </body>
  </html>
</xsl:template>

<xsl:template match="pokemon">
    <tr>
       <td><xsl:value-of select="./name" />(<xsl:value-of select="@pokedexNumber" />)</td>
       <td><xsl:value-of select="./@classification" /></td>
    </tr>
</xsl:template>

</xsl:stylesheet>
