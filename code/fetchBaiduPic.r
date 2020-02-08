library(rvest)
library(clipr)
library(httr)
doc = read_html(paste0(readClipboard(),collapse = ""))
doc %>% html_nodes('.main_img.img-hover') %>% html_attr("data-imgurl")->baidu_url
#writeLines(baidu_url,'urls.txt')
download_pic <- function(input_urls, dest = ".", wt = 0.5)
{
    require(httr)
  
    for(i in 1:length(input_urls)){
        fn = paste0(dest,"/", i, gsub(".+(\\.+)","\\1",input_urls[i]))
        x = GET(input_urls[i],add_headers("User-Agent"="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36"))
        Sys.sleep(wt)
        writeBin(x$content,fn)
        cat(fn,"\n")
        flush.console()
    }
  
}