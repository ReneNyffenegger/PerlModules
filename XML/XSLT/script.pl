use warnings;
use strict;

use XML::XSLT;

my $xml = q{<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="hello.xsl"?>
<document>
  <title   >This is the Title  </title>

  <heading >This is the heading</heading>

  <date    >28.08.2015         </date>

  <item    >foo                </item>
  <item    >bar                </item>
  <item    >baz                </item>

</document>
};

my $xsl = q{<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/document">
    <html>

      <head>

        <title><xsl:value-of select="title"/></title>

      </head>

      <body>

        <h1><xsl:value-of select="heading"/></h1>

        <xsl:apply-templates select="date"/>


        <ul>
        <xsl:for-each select="item">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
        </ul>

      </body>
    </html>
  </xsl:template>

  <xsl:template match="date">
    <p>
    <i>Date: </i> <xsl:value-of select="." />
    </p>
  </xsl:template>

</xsl:stylesheet>
};

my $xslt = XML::XSLT->new ($xsl, warnings => 1);

$xslt->transform ($xml);

open (my $html, '>', 'out.html') or die;
print $html $xslt->toString;
close $html;

$xslt->dispose();
