# Define the URL of the RSS feed
# Sentinel
#$rssUrl = "https://t#echcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=MicrosoftSentinelBlog&size=20"
# Defender for Cloud
#$rssUrl = 'https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=MicrosoftDefenderCloudBlog&size=20'
# mdti
#$rssUrl = 'https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=DefenderThreatIntelligence&size=20'
# sec copilot
#$rssUrl = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=SecurityCopilotBlog&size=20"
# iot
#$rssUrl = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=MicrosoftDefenderIoTBlog&size=20"
# entra ID
#$rssurl = 'https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=6042109320470044639&board=Identity&size=20'
# ca kenneth
#$rssUrl = "https://www.vansurksum.com/category/conditional-access/feed/?posts_per_page=500"
# chronlund
#$rssUrl = 'https://danielchronlund.com/category/conditional-access/feed/?posts_per_page=500'
# MDE
#$rssurl = 'https://techcommunity.microsoft.com/gxcuf89792/rss/board?board.id=MicrosoftDefenderATPBlog&size=20'
# EASM
#$rssUrl = 'https://techcommunity.microsoft.com/gxcuf89792/rss/board?board.id=DefenderExternalAttackSurfaceMgmtBlog&size=20'
# tvm
#$rssUrl = 'https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=860249516929499341&board=Vulnerability-Management&size=25'
# xdr
#$rssUrl = 'https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=860249516929499341&board=MicrosoftThreatProtectionBlog&size=25'

# mdo
#$rssUrl =  'https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=860249516929499341&board=MicrosoftDefenderforOffice365Blog&size=25'

# security and compliance
$rssUrl = 'https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=860249516929499341&board=MicrosoftSecurityandCompliance&size=40'



$outfile = "c:\temp\rssdump.txt"
# Fetch the RSS XML data
$response = Invoke-WebRequest -Uri $rssUrl
# Load XML from the response
$rss = [xml]$response.Content
# Iterate over each item in the RSS feed
foreach ($item in $rss.rss.channel.item) {
    # Extract the title and link
    $title = $item.title
    $url = $item.link
    $pubdate = $item.pubDate
    
    # Print the title and URL
    #Write-Output "Title: $title"
    #Write-Output "URL: $url"
    #Write-Output "PubDate: $pubdate"

    $md = "- " + "[" + $title + "]" + "(" + $url + ")"
    $md | Out-File -FilePath $outfile -Append -Force
}
