#!/bin/bash
echo "GAU scan in progress..."
echo $1 |getallurls  --threads 20 > tmp_urls_R00tendo
echo "gospider scan in progress..."
gospider -s $1 --json -t 20 --robots --sitemap --js -d 0 |jq '.output' -c |cut -d \"  -f 2 >> tmp_urls_R00tendo
echo "crawley scan in progress..."
crawley -js -depth -1 -brute $1 2>/dev/null >> tmp_urls_R00tendo
cat tmp_urls_R00tendo |sort -u > urls_R00tendo
rm tmp_urls_R00tendo
echo "Done! Results saved at:urls_R00tendo"
