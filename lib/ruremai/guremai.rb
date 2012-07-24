# coding: utf-8

require 'open-uri'
require 'g'
require 'nokogiri'
require 'ruremai'

class Guremai

  def self.launch(method)
    if uri = Ruremai.locate(method)
      name, defs, desc = parse(open(uri))
      g [name, defs].join("\n\n")
      g desc
    else
      raise Ruremai::NoReferenceManualFound
    end
    nil
  end

  def self.parse(html)
    doc = Nokogiri(html)
    name = doc.css('h1').text
    list = doc.css('dl.methodlist')
    defs = list.css('dt.method-heading').text
    desc = list.css('dd.method-description').text
    [name, defs, desc]
  end
end

