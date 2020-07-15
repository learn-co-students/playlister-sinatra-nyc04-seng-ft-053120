require_relative 'concerns/slugifiable.rb'

class Song < ActiveRecord::Base
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        name.gsub(" ", "-").downcase
    end

    def find_by_slug(slug)
        self.all.find{ |instance| instance.slug == slug }
    end
end