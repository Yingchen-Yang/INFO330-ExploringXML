<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="/pokedex">
  <html>
  <body>
  <h2>All Fire-type Pokemon</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Name (Classification)</th>
      <th>Types</th>
    </tr>
     <xsl:apply-templates select="pokemon[type='fire']" />
  </table>
  </body>
  </html>
</xsl:template>

<xsl:template match="pokemon">
    <tr>
      <td><xsl:value-of select="./name" />(<xsl:value-of select="@classification" />)</td>
        <td><xsl:apply-templates select="./type" /></td>
    </tr>
</xsl:template>

</xsl:stylesheet>
