<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:sch="http://purl.oclc.org/dsdl/schematron"
                exclude-result-prefixes="xs xsl sch">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:param name="rules"/>

    <xsl:variable name="list" select="tokenize($rules, ',')"/>

    <xsl:template match="/*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="sch:assert[@id and (some $id in $list satisfies normalize-space($id) = normalize-space(@id))]">
        <!-- No action -->
    </xsl:template>

    <xsl:template match="sch:rule">
        <xsl:variable name="res">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:variable>

        <xsl:if test="count($res/*[*]) != 0">
            <xsl:copy-of select="$res"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
