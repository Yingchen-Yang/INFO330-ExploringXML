<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/pokedex">
    <html>
      <body>
        <h2>Generation One Pokemon</h2>
        <table border="1">
          <tr bgcolor="#9acd32">
            <th>Name (Pokedex Number)</th>
            <th>Classification</th>
          </tr>
          <xsl:apply-templates select="//pokemon[@generation='1']"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="pokemon">
    <tr>
      <td><xsl:value-of select="./name"/> (<xsl:value-of select="@pokedexNumber"/>)</td>
      <td><xsl:value-of select="./@classification"/></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
