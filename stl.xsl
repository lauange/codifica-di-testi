<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="stile.css"/>
                <title> <xsl:value-of select="//tei:titleStmt/tei:title"/></title>
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
			    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>    
                <script type="text/javascript" src="javascript.js"></script>
            </head>
            <body>
                <xsl:apply-templates select="//tei:titleStmt"/>
                
                <xsl:element name="div">
                    <xsl:attribute name="id">buttons</xsl:attribute>
                    <xsl:element name="button">
                        <xsl:attribute name="type">button</xsl:attribute>
                        <xsl:attribute name="id">traduzione</xsl:attribute>
                        visualizza traduzione
                    </xsl:element>
                    <xsl:element name="button">
                        <xsl:attribute name="type">button</xsl:attribute>
                        <xsl:attribute name="id">versione</xsl:attribute>
                        versione originale
                    </xsl:element>
                    <xsl:element name="button">
                        <xsl:attribute name="type">button</xsl:attribute>
                        <xsl:attribute name="id">collegamento</xsl:attribute>
                        mostra collegamento testo-immagine
                    </xsl:element>
                    <xsl:element name="button">
                        <xsl:attribute name="type">button</xsl:attribute>
                        <xsl:attribute name="id">cancellature</xsl:attribute>
                        mostra testo cancellato
                    </xsl:element>
                    <xsl:element name="button">
                        <xsl:attribute name="type">button</xsl:attribute>
                        <xsl:attribute name="id">aggiunte</xsl:attribute>
                        Mostra testo aggiunto
                    </xsl:element>
                    <xsl:element name="button">
                        <xsl:attribute name="type">button</xsl:attribute>
                        <xsl:attribute name="id">punteggiatura</xsl:attribute>
                        Mostra punteggiatura normalizzata
                    </xsl:element>
                    <xsl:element name="button">
                        <xsl:attribute name="type">button</xsl:attribute>
                        <xsl:attribute name="id">abbreviazioni</xsl:attribute>
                        Mostra espansione abbreviazioni
                    </xsl:element>
                    <xsl:element name="button">
                        <xsl:attribute name="type">button</xsl:attribute>
                        <xsl:attribute name="id">numeri</xsl:attribute>
                        Mostra numeri normalizzati
                    </xsl:element>
                    <xsl:element name="button">
                        <xsl:attribute name="type">button</xsl:attribute>
                        <xsl:attribute name="id">termini</xsl:attribute>
                        Mostra elementi terminologici
                    </xsl:element>
                    <xsl:element name="button">
                        <xsl:attribute name="type">button</xsl:attribute>
                        <xsl:attribute name="id">date</xsl:attribute>
                        Mostra date o eventi databili
                    </xsl:element>
                    <xsl:element name="button">
                        <xsl:attribute name="type">button</xsl:attribute>
                        <xsl:attribute name="id">toponimi</xsl:attribute>
                        Mostra toponimi
                    </xsl:element>
                    <xsl:element name="button">
                        <xsl:attribute name="type">button</xsl:attribute>
                        <xsl:attribute name="id">lingue</xsl:attribute>
                        Mostra lingue
                    </xsl:element>
                </xsl:element>

                <div id="container">
                    <xsl:apply-templates select="//tei:facsimile"/>
                    <xsl:apply-templates select="//tei:group[@xml:id='container']"/>
                    <xsl:element name="div">
                        <xsl:attribute name="id">slide</xsl:attribute>
                        <xsl:element name="button">
                            <xsl:attribute name="type">button</xsl:attribute>
                            <xsl:attribute name="id">indietro</xsl:attribute>
                            &#8249;
                        </xsl:element>
                        <xsl:element name="button">
                            <xsl:attribute name="type">button</xsl:attribute>
                            <xsl:attribute name="id">avanti</xsl:attribute>
                            &#8250;
                        </xsl:element>
                    </xsl:element>
                </div>

                <div>
                    <xsl:attribute name="id">list</xsl:attribute>
                    <xsl:apply-templates select="//tei:list"/>
                </div>   

                <div id="footer">
                    <xsl:apply-templates select="//tei:editionStmt"/>
                </div>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="//tei:titleStmt">
        <xsl:element name="h1"><xsl:value-of select="./tei:title[@type='main']"/></xsl:element>
        <xsl:element name="h2"><xsl:value-of select="./tei:title[@type='sub']"/></xsl:element>
    </xsl:template>

 
    <xsl:template match="//tei:facsimile">
        <xsl:element name="div">
            <xsl:attribute name="id">images</xsl:attribute>
            <xsl:for-each select="./tei:surface/tei:graphic">
                <xsl:variable name="graphic-id" select="./@xml:id" />
                <xsl:element name="div">
                    <xsl:attribute name="id"><xsl:value-of select="concat('image-', ./@xml:id)"/></xsl:attribute>
                    <xsl:attribute name="class">foto</xsl:attribute>

                    <xsl:element name="div">
                        <xsl:attribute name="id"><xsl:value-of select="concat('title-', ./@xml:id)"/></xsl:attribute>
                        <xsl:attribute name="class">titlephoto</xsl:attribute>
                    </xsl:element>
                   
                    <xsl:element name="img">
                        <xsl:attribute name="src"><xsl:value-of select="./@url"/></xsl:attribute>
                        <xsl:attribute name="id"><xsl:value-of select="concat('img-', ./@xml:id)"/></xsl:attribute>
                        <xsl:attribute name="usemap"><xsl:value-of select="concat('#map-', ./@xml:id)"/></xsl:attribute>
                        <xsl:attribute name="width"><xsl:value-of select="concat((substring-before(./@width, 'px')*0.5), 'px')"/></xsl:attribute>
                        <xsl:attribute name="height"><xsl:value-of select="concat((substring-before(./@height, 'px')*0.5), 'px')"/></xsl:attribute>
                        <xsl:attribute name="alt">foto della galleria</xsl:attribute>
                    </xsl:element>

                    <xsl:element name="map">
                        <xsl:attribute name="style">display:none</xsl:attribute>   
                        <xsl:attribute name="name"><xsl:value-of select="concat('map-', ./@xml:id)"/></xsl:attribute>   
                        <xsl:for-each select="//tei:surface/tei:zone">
                            <xsl:if test="starts-with(./@xml:id ,$graphic-id)">
                                <xsl:variable name="ulx" select="@ulx" />
                                <xsl:variable name="uly" select="@uly" />
                                <xsl:variable name="lrx" select="@lrx" />
                                <xsl:variable name="lry" select="@lry" />
                                <xsl:variable name="ratio" select="0.5" />
                                
                                <xsl:element name="area">
                                    <xsl:attribute name="shape">rect</xsl:attribute>
                                    <xsl:attribute name="coords">
                                        <xsl:value-of select="concat(($ulx*$ratio), ',', ($uly*$ratio), ',', ($lrx*$ratio), ',', ($lry*$ratio))" />
                                    </xsl:attribute>
                                    
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                                    <xsl:attribute name="style"> position: absolute; margin-top: <xsl:value-of select="concat(($uly * $ratio), 'px')" />; margin-left: <xsl:value-of select="concat(($ulx * $ratio)-509, 'px')" />; width: <xsl:value-of select="concat(($lrx - $ulx) * $ratio, 'px')" />; height: <xsl:value-of select="concat(($lry - $uly) * $ratio, 'px')" />; opacity: 0.5;</xsl:attribute>
                                    <xsl:attribute name="class">riquadro</xsl:attribute>
                                </xsl:element>
                            </xsl:if>
                        </xsl:for-each>        
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    
    <xsl:template match="//tei:group">
        <xsl:element name="div">
            <xsl:attribute name="id">texts</xsl:attribute>
            <xsl:for-each select="./tei:group">
                <xsl:element name="div">
                    <xsl:attribute name="id"><xsl:value-of select="concat('lang-', ./@xml:lang)"/></xsl:attribute>
                    <xsl:for-each select="./tei:text/tei:body/tei:div">
                        <xsl:variable name="pagenumber" select="./@n"/>
                        <xsl:element name="div">
                            <xsl:attribute name="id"><xsl:value-of select="concat(./@type, '-', ./@n)"/></xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="$pagenumber = 8">     
                                    <xsl:element name="div">
                                        <xsl:attribute name="id"><xsl:value-of select="concat('page-', $pagenumber, '-1-', @xml:lang)"/></xsl:attribute>                           
                                        <xsl:attribute name="class"><xsl:value-of select="concat('testo-', ./@xml:lang)"/></xsl:attribute>                           
                                        <xsl:for-each select="./tei:ab[not(position() > 3)]">
                                            <xsl:element name="span">
                                                <xsl:attribute name="id"><xsl:value-of select="./@xml:id"/></xsl:attribute>
                                               
                                                <xsl:apply-templates select="."/>
                                        
                                            </xsl:element>
                                        </xsl:for-each>
                                    </xsl:element>
                                    <xsl:element name="div">
                                        <xsl:attribute name="id"><xsl:value-of select="concat('page-', $pagenumber, '-2-', @xml:lang)"/></xsl:attribute>
                                        <xsl:attribute name="class"><xsl:value-of select="concat('testo-', ./@xml:lang)"/></xsl:attribute> 
                                        <xsl:for-each select="./tei:ab[(position() > 3)]">
                                            <xsl:element name="span">
                                                <xsl:attribute name="id"><xsl:value-of select="./@xml:id"/></xsl:attribute>
                                                
                                                <xsl:apply-templates select="."/>

                                            </xsl:element>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:element name="div">
                                        <xsl:attribute name="id"><xsl:value-of select="concat('page-', $pagenumber, '-1-', @xml:lang)"/></xsl:attribute>   
                                        <xsl:attribute name="class"><xsl:value-of select="concat('testo-', ./@xml:lang)"/></xsl:attribute>                         
                                        <xsl:for-each select="./tei:ab[not(position() > 4)]">
                                            <xsl:element name="span">
                                                <xsl:attribute name="id"><xsl:value-of select="./@xml:id"/></xsl:attribute>
                                                
                                                <xsl:apply-templates select="."/>
                                
                                            </xsl:element>
                                        </xsl:for-each>
                                    </xsl:element>
                                    <xsl:element name="div">
                                        <xsl:attribute name="id"><xsl:value-of select="concat('page-', $pagenumber, '-2-', @xml:lang)"/></xsl:attribute>
                                        <xsl:attribute name="class"><xsl:value-of select="concat('testo-', ./@xml:lang)"/></xsl:attribute> 
                                        <xsl:for-each select="./tei:ab[(position() > 4)]">
                                            <xsl:element name="span">
                                                <xsl:attribute name="id"><xsl:value-of select="./@xml:id"/></xsl:attribute>
                                                
                                                    <xsl:apply-templates select="."/>                                               
                                            </xsl:element>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
      
    <xsl:template match="//tei:ab">
        <xsl:choose>
            <xsl:when test="substring(./@corresp, 1, 3) = 'ita'">
                <xsl:for-each select="./tei:l">
                    <xsl:element name="span">
                        <xsl:attribute name="id"><xsl:value-of select="concat('span-', @facs)"/></xsl:attribute>
                        <xsl:if test="./@n">
                            <xsl:element name="br"></xsl:element>
                            <xsl:element name="span">
                                <xsl:attribute name="class">numriga</xsl:attribute>
                                <xsl:value-of select="./@n"/>
                            </xsl:element>
                        </xsl:if>

                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="./tei:l">
                    <xsl:element name="span">
                        <xsl:attribute name="id"><xsl:value-of select="concat('ita-', @facs)"/></xsl:attribute>
                        <xsl:if test="./@n">
                            <xsl:element name="br"></xsl:element>
                        </xsl:if>
                        <xsl:apply-templates />
                    </xsl:element>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="//tei:emph">
        <xsl:element name="u">
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:del">
        <xsl:choose>
            <xsl:when test="./tei:gap">
                <xsl:for-each select=".">
                    <xsl:element name="s">
                        <xsl:attribute name="style">display:none</xsl:attribute>
                        <xsl:attribute name="class">del</xsl:attribute>
                        <xsl:attribute name="id"><xsl:value-of select="concat('span-', ./@facs)"/></xsl:attribute>
                    ??</xsl:element>
                 </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="s">
                    <xsl:attribute name="class">del</xsl:attribute>
                    <xsl:attribute name="style">display:none</xsl:attribute>
                    <xsl:attribute name="id"><xsl:value-of select="concat('span-', ./@facs)"/></xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>   
    </xsl:template>

    <xsl:template match="//tei:choice">
        <xsl:choose>
            <xsl:when test="./tei:abbr">
                <xsl:element name="span">
                    <xsl:attribute name="class">abbreviazione</xsl:attribute>
                    <xsl:value-of select="./tei:abbr"/>
                </xsl:element>
                <xsl:element name="span">
                    <xsl:attribute name="class">expan</xsl:attribute>
                    <xsl:attribute name="style">display:none</xsl:attribute>
                    <xsl:value-of select="./tei:expan"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="./tei:orig">
                    <xsl:element name="span">
                        <xsl:attribute name="class">original</xsl:attribute>
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:for-each>
                <xsl:element name="span">
                    <xsl:attribute name="class">regolarizzazione</xsl:attribute>
                    <xsl:attribute name="style">display:none</xsl:attribute>
                    <xsl:value-of select="./tei:reg"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="//tei:add">
        <xsl:element name="span">
            <xsl:attribute name="class">add</xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="concat('span-', @facs)"/></xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:g">
        <xsl:element name="span">
            <xsl:attribute name="class">g</xsl:attribute>
            <xsl:attribute name="style">display:none</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:pc">
        <xsl:choose>
            <xsl:when test="./@resp='#prof'">
                <xsl:element name="span">
                    <xsl:attribute name="class">prof</xsl:attribute>
                    <xsl:attribute name="style">display:none</xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="./@resp='#author'">
                <xsl:element name="span">
                    <xsl:attribute name="class">autore</xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="span">
                    <xsl:attribute name="class">eliminati</xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//tei:editionStmt"> 
        <xsl:element name="div">
            <xsl:attribute name="id">responsabilità</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:resp">
        <xsl:element name="br"></xsl:element>
        <xsl:element name="b">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:term">
        <xsl:element name="span">
            <xsl:attribute name="class">terminologia</xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="concat('term-', @ref)"/></xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:date">
        <xsl:if test="./@resp='#prof'">
            <xsl:element name="span">
                <xsl:attribute name="class">date</xsl:attribute>
                <xsl:apply-templates />
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="//tei:placeName">
        <xsl:if test="./@resp='#prof'">
            <xsl:element name="span">
                <xsl:attribute name="class">toponimo</xsl:attribute>
                <xsl:apply-templates />
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <xsl:template match="//tei:lang">
        <xsl:element name="span">
            <xsl:attribute name="class">lingua</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:list">
        <xsl:element name="h3">Glossario</xsl:element>
    
        <xsl:for-each select="//tei:label">
            <div class="glossa">
                <div class="significato">
                   
                    <xsl:element name="span">
                        <xsl:attribute name="id">
                            <xsl:value-of select="tei:term[@xml:lang='fr']/@xml:id"/>
                        </xsl:attribute>
                        <xsl:attribute name="class">termine</xsl:attribute>
                        <xsl:value-of select="." />
                    </xsl:element>
                     
                    <xsl:variable name="IdTermine" >
                        <xsl:value-of select="tei:term[@xml:lang='fr']/@xml:id"/>
                    </xsl:variable>
                    <xsl:for-each select="../tei:item/tei:gloss">
                        <xsl:if test ="@target = concat('#', $IdTermine)">
                            <xsl:element name="span">
                                <xsl:value-of select="."/>
                                <xsl:element name="br"></xsl:element>
                            </xsl:element>
                        </xsl:if>
                    </xsl:for-each>
                    
                </div>               
            </div>
        </xsl:for-each>
    </xsl:template> 
</xsl:stylesheet>