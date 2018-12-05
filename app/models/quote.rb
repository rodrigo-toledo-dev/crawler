require 'nokogiri'
require 'open-uri'
class Quote
  include Mongoid::Document
  field :quote, type: String
  field :author, type: String
  field :author_about, type: String
  field :tags, type: Array, default: []

  def self.crawler(tag)
    begin
      page_url = "http://quotes.toscrape.com"
      page_tag = "#{page_url}/tag/#{tag}"
      page = Nokogiri::HTML(open(page_tag))
      quotes = page.css('div.quote')
      if quotes.length > 0
        quotes.each do |result|
          quote_title = result.css('span.text').text.gsub(/\”/,"").gsub("\“","")
          quote_author = result.css('small.author').text
          quote_author_about = "#{page_url}#{result.css('small.author').first.parent.css('a').first['href']}"
          quote_tags = result.css('meta.keywords').first['content'].split(',')

          quote = Quote.where(tags: { '$in': [tag] }, quote: quote_title).first_or_initialize({
            quote: quote_title,
            author: quote_author,
            author_about: quote_author_about,
            tags: quote_tags
          })
          quote.save!
        end
      end
    rescue => exception
      logger.info "Can't run the crawler"
      logger.info exception.message
    end
    Quote.where(tags: { '$in': [tag] }).all.as_json(only: [:quote, :author, :author_about, :tags])
  end
end
