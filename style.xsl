<?xml version ="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" />
                </title>
                <meta charset="UTF-8" />
                <link rel="shortcut icon" href="immagini_sito/favicon.ico" type="image/x-icon" />
                <link rel="icon" href="immagini_sito/favicon.ico" type="image/x-icon" />
                <link rel="stylesheet" type="text/css" href="stile.css" />
                <script type="text/javascript" src="script.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script type="text/javascript" src="scriptDescrizioni.js"></script>
            </head>
            <body>
                <xsl:element name="div">
                    <xsl:attribute name="class">titolo</xsl:attribute>
                    <h1>
                        <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='main']" />
                    </h1>
                </xsl:element>
                <img src="immagini_sito/divisore.png" id="divisore" />
                <div id="introduzione">
                    <p>
                            In questo sito è presentata la codifica digitale di tre cartoline provenienti dal <i><xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository"/></i>
                        di <xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement"/> e si connette ad un progetto realizzato dal <xsl:value-of select = "//tei:publicationStmt/tei:address/tei:addrLine"/>.
                            <br />
                             Le tre cartoline sono state scritte nel pieno della Prima Guerra Mondiale: le prime due riguardano la corrispondenza amorosa tra il militare 
                             -si ipotizza maggiore o tenente colonnello- <i><strong>Giovanni Coliola</strong></i>, e <strong><i>Oliva Turtura</i></strong> di cui è presente il nome nell’<a href ="https://books.google.it/books?id=niGVVFNDkzkC">Annuario del Ministero dell’Educazione Nazionale del 1935</a>.
                            <br  />
                            È interessante vedere come in un periodo così difficile come la <strong>Grande Guerra</strong>, le cartoline e la scrittura in generale rappresentino uno spiraglio di quotidianità,
                            in mezzo al dolore e alla nostalgia dei soldati al Fronte che, in quei rari momenti di tranquillità, cercavano di mantenere un contatto con le persone care, informandole e rassicurandole 
                            sulla loro salute oppure scrivendo parole d’amore alla persona amata come nel caso di Oliva Turtura e Giovanni Coliola.
                            <br />
                            La terza cartolina invece è una cartolina di auguri da parte del cugino, probabilmente di Oliva, indirizzata ad Antonietta, che si ipotizza fosse anch’essa parente della sopracitata Oliva.
                    </p>
                </div>
                
                <!-- GALLERIA IMMAGINI-->
                <div class="contenitore_cartoline">
                    <xsl:for-each select="tei:teiCorpus/tei:TEI/tei:facsimile/tei:surfaceGrp/tei:surface">
                        <div class="galleria">
                            <xsl:element name="img">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="tei:graphic/@url" />
                                </xsl:attribute>
                            </xsl:element>
                        </div>
                    </xsl:for-each>
                    
                    <!--frecce-->
                    <a class="prev" id="indietro" onclick="gestoreAvanti(-1)">❮</a>
                    <a class="next" id="avanti" onclick="gestoreAvanti(1)">❯</a>

                    <xsl:for-each select="tei:teiCorpus/tei:TEI/tei:facsimile/tei:surfaceGrp/tei:surface">
                        <div class="galleria_foto_piccole">
                            <xsl:element name="img">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="tei:graphic/@url" />
                                </xsl:attribute>
                                <xsl:attribute name="class">img_piccole</xsl:attribute>
                                <xsl:attribute name="onclick">
                                    <xsl:value-of select="'immagineCorrente('" />
                                    <xsl:number level="any" />
                                    <xsl:value-of select="')'" />
                                </xsl:attribute>
                            </xsl:element>
                        </div>
                    </xsl:for-each>
                </div>
                
                <hr />
                
                <!--CONTENITORE IMMAGINI E DESCRIZIONI-->
                
                <div id="wrapper">
                    <xsl:for-each select="tei:teiCorpus/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title">
                        <xsl:element name="h2">
                            <xsl:attribute name="class">
                                <xsl:choose>
                                    <xsl:when test="(position() = 1)">prima</xsl:when>
                                    <xsl:when test="(position() = 2)">seconda</xsl:when>
                                    <xsl:otherwise>terza</xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:value-of select="." />
                        </xsl:element>
                    </xsl:for-each>
                    
                    <select id="selezioneCartolina">
                        <xsl:for-each select="tei:teiCorpus/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title">
                            <xsl:element name="option">
                                <xsl:value-of select="." />
                            </xsl:element>
                        </xsl:for-each>
                    </select>
                    
                    <button type="button" class="bottone_fronte">Fronte</button>
                    <button type="button" class="bottone_retro">Recto</button>
                   <button type = "button" class = "bottone_ruota">
                       <a href = "img_cartoline/7694-193R - ruotata.jpg" target = "_blank">Ruota</a>
                   </button>
                    
                    <!-- TEMPLATE PER IL FACSIMILE -->
                    <xsl:apply-templates select="//tei:facsimile" />
                    <xsl:apply-templates select="//tei:facsimile/tei:surfaceGrp/tei:surface[position() = 2]" />
                    <!-- TEMPLATE PER LE DESCRIZIONI DEL FRONTE -->
                    <div id="desc_fronte">
                        <xsl:apply-templates select="//tei:teiCorpus/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl" />
                        <xsl:apply-templates select="//tei:figure" />
                        <xsl:apply-templates select="//tei:supportDesc" />
                        <xsl:apply-templates select="//tei:teiCorpus/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier" />
                        <xsl:apply-templates select="//tei:teiCorpus/tei:TEI/tei:teiHeader/tei:profileDesc/tei:langUsage" />
                        <xsl:apply-templates select="//tei:listPerson" />
                        <xsl:apply-templates select="/tei:teiCorpus/tei:TEI/tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date" />
                    </div>
                    <!-- TEMPLATE PER LE DESCRIZIONI DEL RECTO -->
                    <div id="desc_retro">
                        <xsl:apply-templates select="//tei:div[@type = 'recto']/tei:div[@type = 'contenuto_trascrizione']" />
                        <div id="note">
                            <xsl:apply-templates select="//tei:handDesc" />
                            <xsl:apply-templates select="//tei:div[@type = 'francobolli_timbri']/tei:p/tei:stamp[@type = 'postage_stamp']" />
                            <xsl:apply-templates select="//tei:div[@type = 'francobolli_timbri']/tei:p/tei:stamp[@type = 'postmark']" />
                            <xsl:apply-templates select="//tei:div[@type = 'stampe_cartolina']" />
                        </div>
                    </div>
                </div>
                
                <img src="immagini_sito/divisore.png" id="divisore" />
                <!-- FOOTER -->
                <div id = "footer">
                    <xsl:apply-templates select ="tei:teiCorpus/tei:teiHeader/tei:fileDesc"/> 
                </div>
            </body>
        </html>
        
        
    </xsl:template>
    <xsl:template match="//tei:facsimile">
        <xsl:element name="div">
            <xsl:attribute name="class">contenitore_fronte</xsl:attribute>
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="tei:surfaceGrp/tei:surface/tei:graphic/@url" />
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:choose>
                        <xsl:when test="(position() = 1)">prima</xsl:when>
                        <xsl:when test="(position() = 2)">seconda</xsl:when>
                        <xsl:otherwise>terza</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="'Fronte_'" />
                    <xsl:number level="any" />
                </xsl:attribute>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:facsimile/tei:surfaceGrp/tei:surface[position() = 2]">
        <xsl:element name="div">
            <xsl:attribute name="class">contenitore_retro</xsl:attribute>
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="tei:graphic/@url" />
                </xsl:attribute>
                <xsl:attribute name="class">retro</xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="'Retro_'" />
                    <xsl:number level="any" />
                </xsl:attribute>
                <xsl:attribute name="usemap">
                    <xsl:value-of select="concat('#image-map', position())" />
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="map">
                <xsl:attribute name="name">
                    <xsl:value-of select="concat('image-map', position())" />
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id" />
                </xsl:attribute>
                <xsl:for-each select="tei:zone">
                    <xsl:element name="area">
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id" />
                        </xsl:attribute>
                        <xsl:attribute name="class">area</xsl:attribute>
                        <xsl:attribute name="coords">
                            <xsl:value-of select="@ulx" />,<xsl:value-of select="@uly" />,<xsl:value-of select="@lrx" />,<xsl:value-of select="@lry" /></xsl:attribute>
                        <xsl:attribute name="shape">rect</xsl:attribute>
                        <xsl:attribute name="onmouseover">puntatore(<xsl:value-of select="@xml:id" />);</xsl:attribute>
                        <xsl:attribute name="onmouseout">puntatore_base(<xsl:value-of select="@xml:id" />);</xsl:attribute>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- TEMPLATE ELEMENTI FRONTE -->
    <xsl:template match="tei:teiCorpus/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="(position() = 1)">prima</xsl:when>
                    <xsl:when test="(position() = 2)">seconda</xsl:when>
                    <xsl:otherwise>terza</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <strong>Editore cartolina: </strong>
            <xsl:value-of select="tei:publisher" /> (<xsl:value-of select="tei:pubPlace" />)
            </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:figure">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="(position() = 1)">prima</xsl:when>
                    <xsl:when test="(position() = 2)">seconda</xsl:when>
                    <xsl:otherwise>terza</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:for-each select="tei:figDesc">
                <strong>Descrizione: </strong>
                <xsl:value-of select="." />
            </xsl:for-each>
            <br />
            <xsl:for-each select="tei:note">
                <strong>Note riguardo la cartolina: </strong>
                <xsl:value-of select="." />
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:supportDesc">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="(position() = 1)">prima</xsl:when>
                    <xsl:when test="(position() = 2)">seconda</xsl:when>
                    <xsl:otherwise>terza</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:for-each select="tei:support/tei:dimensions">
                <strong>Altezza: </strong>
                <xsl:value-of select="tei:height" /> cm 
                <br/>
                <strong>Larghezza: </strong>
                <xsl:value-of select="tei:width" /> cm 
                <br/>
            </xsl:for-each>
            <xsl:for-each select="tei:condition">
                <strong>Stato di conservazione: </strong>
                <xsl:value-of select="." />
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:teiCorpus/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="(position() = 1)">prima</xsl:when>
                    <xsl:when test="(position() = 2)">seconda</xsl:when>
                    <xsl:otherwise>terza</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <strong>Numero di inventario: </strong>
            <xsl:for-each select="tei:idno">
                <xsl:value-of select="." />
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:teiCorpus/tei:TEI/tei:teiHeader/tei:profileDesc/tei:langUsage">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="(position() = 1)">prima</xsl:when>
                    <xsl:when test="(position() = 2)">seconda</xsl:when>
                    <xsl:otherwise>terza</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <strong>Lingua usata per il testo della cartolina: </strong>
            <br/>
            &#8811;<xsl:value-of select="tei:language[position() = 1]" />
            <xsl:if test="tei:language[position() = 2]">
                <br/>
                &#8811;<xsl:value-of select="tei:language[2]" />
            </xsl:if>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:teiCorpus/tei:TEI/tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="(position() = 1)">prima</xsl:when>
                    <xsl:when test="(position() = 2)">seconda</xsl:when>
                    <xsl:otherwise>terza</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <strong>Data di invio della cartolina: </strong>
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:listPerson">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="(position() = 1)">prima</xsl:when>
                    <xsl:when test="(position() = 2)">seconda</xsl:when>
                    <xsl:otherwise>terza</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:for-each select="tei:person[1]/tei:persName">
                <strong>Mittente: </strong>
                <xsl:value-of select="." />
            </xsl:for-each>
            <br />
            <xsl:for-each select="tei:person[2]/tei:persName">
                <strong>Destinatario: </strong>
                <xsl:value-of select="." />
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <!-- TEMPLATE PER LA TRASCRIZIONE DEL TESTO NEL RECTO-->
    <xsl:template match="tei:lb">
        <br />
        <xsl:element name="p">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs, '#', '')" />
            </xsl:attribute>
            <xsl:attribute name="class">puntatore</xsl:attribute>
            <img src="immagini_sito/puntatore.png" id="puntatore" />
        </xsl:element>
        <xsl:apply-templates />
    </xsl:template>
    
    
    <xsl:template match="//tei:div[@type = 'recto']/tei:div[@type = 'contenuto_trascrizione']">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="concat('trascrizione_testo', position())" />
            </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:salute">
        <xsl:element name = "p">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <i>
                <xsl:value-of select="." />
            </i>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:teiCorpus/tei:TEI/tei:text/tei:body/tei:div/tei:div[@type = 'contenuto_trascrizione']/tei:ab">
        <xsl:element name="p">
            <xsl:attribute name="id">
                <xsl:value-of select="@n" />
            </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:address">
        <address id = "cart_3">
            <xsl:apply-templates />
        </address>
    </xsl:template>
    
    <xsl:template match="//tei:closer">
        <p>
            <i>
                <xsl:apply-templates />
            </i>
        </p>
    </xsl:template>
    
    <xsl:template match="//tei:handDesc">
      <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="(position() = 1)">prima</xsl:when>
                    <xsl:when test="(position() = 2)">seconda</xsl:when>
                    <xsl:otherwise>terza</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <strong>Note riguardo la cartolina: </strong>
            <xsl:value-of select="tei:handNote[position() = 2 ]" />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'francobolli_timbri']/tei:p/tei:stamp[@type = 'postage_stamp']">
        <p class="timbri_francobolli">
            <strong>
            Francobollo:
            </strong>
            <xsl:apply-templates />
        </p>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'francobolli_timbri']/tei:p/tei:stamp[@type = 'postmark']">
        <p class="timbri_francobolli">
            <strong>
            Timbro:
        </strong>
            <xsl:apply-templates />
        </p>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'francobolli_timbri']/tei:p/tei:stamp[@type = 'postmark']/tei:note">
        <p class="timbri_francobolli">
            <strong>Nota: </strong>
            <xsl:apply-templates />
        </p>
    </xsl:template>
    
    <xsl:template match="//tei:hi">
        <i>
            <xsl:apply-templates />
        </i>
    </xsl:template>
    
    <xsl:template match = "//tei:hi[@rend = 'align(right)']">
       <xsl:element name = "p">
           <xsl:attribute name = "id">
               <xsl:value-of select="@xml:id"/>
           </xsl:attribute>
        <xsl:apply-templates/>
       </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type = 'stampe_cartolina']">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="(position() = 1)">prima</xsl:when>
                    <xsl:when test="(position() = 2)">seconda</xsl:when>
                    <xsl:otherwise>terza</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <strong>Stampe presenti nella cartolina: </strong>
            <xsl:for-each select="tei:ab/tei:s">
                <xsl:value-of select="." />
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:gap">
    [...]
    </xsl:template>
    
    <xsl:template match="//tei:unclear">
        [...]
    </xsl:template>
    
    <xsl:template match = "//tei:hi[@rend = 'underline']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>

  
  <!-- TEMPLATE PER IL FOOTER -->
    <xsl:template match = "tei:teiCorpus/tei:teiHeader/tei:fileDesc">
        <div id = "about">
            <h3>About</h3>
            <p>
                <xsl:value-of select="//tei:respStmt[1]"/> <!--Trascrizione a cura di: Erica Cau Alice Isola -->
                <br />
                Il progetto è stato relizzato per l'esame di <strong>Codifica di Testi</strong> del professore Angelo Mario del Grosso (a.a 2018-2019)
                <br />
                Il seguente progetto fa parte di un progetto più ampio avviato dal <xsl:value-of select = "//tei:publicationStmt/tei:address/tei:addrLine[1]"/>
                <br />
                &#169; <xsl:value-of select = "//tei:publicationStmt/tei:availability"/>
            </p>
        </div>
        
        <div id = "credits">
            <h3>Credits</h3>
            <p> 
                <xsl:value-of select="//tei:editionStmt/tei:respStmt[2]"/>
                <br />
                <xsl:value-of select="//tei:editionStmt/tei:respStmt[3]"/>
                <br />
                <xsl:value-of select="//tei:editionStmt/tei:respStmt[4]"/>
                <br />
                Le cartoline sono conservate presso il <i><xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository"/></i>
                (<xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement"/>)    
            </p> 
        </div>
    </xsl:template>
    
</xsl:stylesheet>