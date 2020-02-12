#Genre


class Genre
  attr_accessor :name       #initialize accepts name for the new genre, retrieves the name of a genre
  attr_reader :songs        #songs returns the genre's 'songs' collection (genre has many songs)

  @@all = []


  def initialize(name)
    @name = name            #name= can set the name of genre
    @songs = []             #initialize  creates a 'songs' property set to an empty array (genre has many songs)
    @@all << self
  end

  def self.all              #.all returns the class variable @@all
    @@all
  end

  def self.destroy_all     #.destroy_all resets the @@all class variable to an empty array
    self.all.clear
  end

  def save
    self.class.all << self  #save adds the Genre instance to the @@all class variable
  end

  def self.create(name)     #.create initializes and saves the genre
    genre = new(name)
    genre.save
    genre
  end

  #Associations - Artist and Genre 
  #Genre
    #artists
      #returns a collection of artists for all of the genre's songs (genre has many artists through songs)
      #does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs)
      #collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)


  def artists
    songs.collect{ |s| s.artist }.uniq
  end






end
