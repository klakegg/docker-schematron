<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:sch="http://purl.oclc.org/dsdl/schematron"
                exclude-result-prefixes="xs xsl sch">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:param name="flag"/>
    <xsl:param name="rules"/>

    <xsl:variable name="list" select="tokenize($rules, ',')"/>

    <xsl:template match="sch:assert[some $id in $list satisfies normalize-space($id) = normalize-space(@id)]">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="replacing"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@flag" mode="replacing">
        <xsl:attribute name="flag" select="$flag"/>
    </xsl:template>

    <xsl:template match="@*|node()" mode="replacing">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
