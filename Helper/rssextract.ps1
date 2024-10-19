# Define an array of RSS URLs and their corresponding output file paths
$rssFeeds = @(
    @{ Url = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=MicrosoftSentinelBlog&size=20"; OutFile = "c:\temp\Sentinel_rssdump.txt" },
    @{ Url = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=MicrosoftDefenderCloudBlog&size=20"; OutFile = "c:\temp\DefenderForCloud_rssdump.txt" },
    @{ Url = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=DefenderThreatIntelligence&size=20"; OutFile = "c:\temp\MDTI_rssdump.txt" },
    @{ Url = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=SecurityCopilotBlog&size=20"; OutFile = "c:\temp\SecCopilot_rssdump.txt" },
    @{ Url = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=MicrosoftDefenderIoTBlog&size=20"; OutFile = "c:\temp\IoT_rssdump.txt" },
    @{ Url = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=6042109320470044639&board=Identity&size=20"; OutFile = "c:\temp\EntraID_rssdump.txt" },
    @{ Url = "https://www.vansurksum.com/category/conditional-access/feed/?posts_per_page=500"; OutFile = "c:\temp\CAKenneth_rssdump.txt" },
    @{ Url = "https://danielchronlund.com/category/conditional-access/feed/?posts_per_page=500"; OutFile = "c:\temp\Chronlund_rssdump.txt" },
    @{ Url = "https://techcommunity.microsoft.com/gxcuf89792/rss/board?board.id=MicrosoftDefenderATPBlog&size=20"; OutFile = "c:\temp\MDE_rssdump.txt" },
    @{ Url = "https://techcommunity.microsoft.com/gxcuf89792/rss/board?board.id=DefenderExternalAttackSurfaceMgmtBlog&size=20"; OutFile = "c:\temp\EASM_rssdump.txt" },
    @{ Url = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=860249516929499341&board=Vulnerability-Management&size=25"; OutFile = "c:\temp\TVM_rssdump.txt" },
    @{ Url = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=860249516929499341&board=MicrosoftThreatProtectionBlog&size=25"; OutFile = "c:\temp\XDR_rssdump.txt" },
    @{ Url = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=860249516929499341&board=MicrosoftDefenderforOffice365Blog&size=25"; OutFile = "c:\temp\MDO_rssdump.txt" },
    @{ Url = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=860249516929499341&board=MicrosoftSecurityandCompliance&size=40"; OutFile = "c:\temp\SecurityCompliance_rssdump.txt" }
)

# Iterate over each RSS feed in the array
foreach ($feed in $rssFeeds) {
    $rssUrl = $feed.Url
    $outfile = $feed.OutFile

    # Fetch the RSS XML data
    $response = Invoke-WebRequest -Uri $rssUrl
    $rss = [xml]$response.Content

    # Iterate over each item in the RSS feed
    foreach ($item in $rss.rss.channel.item) {
        $title = $item.title
        $url = $item.link
        $pubdate = $item.pubDate

        # Create a markdown link for the RSS item
        $md = "- " + "[" + $title + "]" + "(" + $url + ")"

        # Output to the specific file for this RSS feed
        $md | Out-File -FilePath $outfile -Append -Force
    }
}

