<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/pokedex">
<xsl:variable name="pokemonResults" select = "pokemon[type='fire' or type='water' or type='flying' or type='ground']" />
  <html>
  <body>
  <h2>Elemental Pokemon</h2>
  A total of <xsl:value-of select="count($pokemonResults)" />:
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Name (Pokedex Number)</th>
      <th>Type(s)</th>
    </tr>
    <xsl:apply-templates select="pokemon[$pokemonResults]" />
  </table>
  </body>
  </html>
</xsl:template>

<!-- In this template, select the name, pokedexNumber, and type in each of the value-of
     statements, respectively. -->
<xsl:template match="pokemon">
    <tr>
      <td><xsl:value-of select="./name" />(<xsl:value-of select="@pokedexNumber" />)</td>
      <td><xsl:apply-templates select="./type" /></td>
    </tr>
</xsl:template>

</xsl:stylesheet>
