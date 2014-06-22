require 'open-uri'
class WelcomeController < ApplicationController
  def index
    @data = Nokogiri::XML(open("http://api.hooikoortsalert.nl/?login=true&host=www.hooikoortsalert.nl&username=#{ENV["API_USER"]}&key=#{ENV["API_KEY"]}"))
    @status = @data.xpath("//desc").text
    @colorclass = @data.xpath("//txt").text
  end
end
