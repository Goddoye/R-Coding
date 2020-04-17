#WEB SCRAPPING
install.packages('rvest')
library(rvest)
demo(package = 'rves')
demo(package = 'rvest', topic = 'tripadvisor')


#-------------------------------------------------------------------------
library(rvest)

##Establish Url
url <- "http://www.tripadvisor.com/Hotel_Review-g37209-d1762915-Reviews-JW_Marriott_Indianapolis-Indianapolis_Indiana.html"


##Read URL
reviews <- url %>%
read_html() %>%
html_nodes("#REVIEWS .innerBubble")


##Scrape Relevant Infrmation from Website
id <- reviews %>%
html_node(".quote a") %>%
html_attr("id")

quote <- reviews %>%
html_node(".quote span") %>%
html_text()

rating <- reviews %>%
html_node(".rating .rating_s_fill") %>%
html_attr("alt") %>%
gsub(" of 5 stars", "", .) %>%
as.integer()

date <- reviews %>%
html_node(".rating .ratingDate") %>%
html_attr("title") %>%
strptime("%b %d, %Y") %>%
as.POSIXct()

review <- reviews %>%
html_node(".entry .partial_entry") %>%
html_text()


#Create Dataframe of Scraped Information
data.frame(id, quote, rating, date, review, stringsAsFactors = FALSE) %>% View()
!nformaPRD_117
!nformaEQW_117