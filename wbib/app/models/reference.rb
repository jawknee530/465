class Reference < ActiveRecord::Base
  require 'uri'
  validates :URL, presence: true
  before_save :checkurl
  belongs_to :topic
end

def checkurl
  uri = URI.parse(self.URL)
  if uri !=~ /\A#{URI::regexp(['http', 'https'])}\z/
    self.URL = "http://#{self.URL}"
  end
end
