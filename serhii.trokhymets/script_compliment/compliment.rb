# frozen_string_literal: true

require 'rest-client'
require 'nokogiri'
require 'faraday'

module Compliment
  $url = 'http://kompli.me/%ef%bb%bfkomplimenty-devushke'
  $url2 = 'http://kompli.me/%ef%bb%bfkomplimenty-devushke/page/2'
  $url3 = 'http://kompli.me/%ef%bb%bfkomplimenty-devushke/page/3'

  $array_text_girl = []

  def compliment_girl(url)
    page = Faraday.get url
    page = page.body
    nokogiri_object = Nokogiri.HTML(page)
    nokogiri_object.css('.post-card__title a').each { |tag| $array_text_girl << tag.text }
  end
end
