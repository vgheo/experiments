<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
<!-- 

	Fitler - including all ancestors.

ref:
	http://stackoverflow.com/questions/5876382/using-xslt-to-copy-all-nodes-in-xml-with-support-for-special-cases
 -->
 
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

<!-- more specific template  -->
	<xsl:template match="o">
		<!-- 
			
		 -->
		<xsl:if test="descendant-or-self::*[a[@nm='a']='def']">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>		
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>	