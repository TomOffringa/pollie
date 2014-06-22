require 'open-uri'

class WelcomeController < ApplicationController
  def index
    @status = status
    @color_class = color_class
  end

  private

  def url
    "http://api.hooikoortsalert.nl/?login=true&host=www.hooikoortsalert.nl&username=#{ENV["API_USER"]}&key=#{ENV["API_KEY"]}"
  end

  def data
    @data ||= Nokogiri::XML(open(url))
  end

  def status
    data.xpath('//desc').text
  end

  def color_class
    data.xpath('//txt').text
  end
end
