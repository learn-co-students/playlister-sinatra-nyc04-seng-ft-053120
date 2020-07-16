require_relative './concerns/slugifiable'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  
  # def slug
  #   self.name.downcase.gsub(/[^a-z0-9]/, '-')
  # end

  # def self.find_by_slug(slug)
  #   self.all.find { |artist| artist.slug == slug }
  # end
end