<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="functionalityList/analysis/case">
<h2><xsl:value-of select="@val"/></h2>
</xsl:template>

<!-- 
	NOTES
	
	* There is one <tr> per <functionality>
	
	* For each <case> in the input there will
		be one <td> in the output.
		
		Have to determine colspan for each td.
		
 -->
<xsl:template match="analysis">
<table>
<tr>
<xsl:variable name="schema" select="schema"/>
<xsl:for-each select="schema/descendant::criterion">
<th></th>
</xsl:for-each>
</tr>

<xsl:for-each select=".//functionality">
<xsl:variable name="fun" select="."/>
<tr>
<xsl:for-each select="$schema//criterion">

</xsl:for-each>
</tr>
</xsl:for-each>


</table>
</xsl:template>

</xsl:stylesheet>