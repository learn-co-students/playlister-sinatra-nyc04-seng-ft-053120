require_relative 'concerns/slugifiable.rb'

class Genre < ActiveRecord::Base
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
    has_many :song_genres 
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs 


    def slug
        name.gsub(" ", "-").downcase
    end

    def find_by_slug(slug)
        self.all.find{ |instance| instance.slug == slug }
    end
end