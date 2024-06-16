# Define the URL of the RSS feed
# Sentinel
#$rssUrl = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=MicrosoftSentinelBlog&size=600"
# Defender for Cloud
#$rssUrl = 'https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=MicrosoftDefenderCloudBlog&size=600'
# mdti
#$rssUrl = 'https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=DefenderThreatIntelligence&size=600'
# sec copilot
#$rssUrl = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=SecurityCopilotBlog&size=200"
# iot
$rssUrl = "https://techcommunity.microsoft.com/plugins/custom/microsoft/o365/custom-blog-rss?tid=-1596964823266872039&board=MicrosoftDefenderIoTBlog&size=400"

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
