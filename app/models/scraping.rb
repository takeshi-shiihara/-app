require 'mechanize'

class Scraping
  def self.english_urls
    agent = Mechanize.new
    links = []
    current_page = agent.get("https://www.tentan.jp/wordlist/")
    elements = current_page.search('.row li a')
    elements.each do |ele|
      eword = ele.inner_text
      english = English.where(eword: eword).first_or_initialize
      english.save
    end
  end
end
