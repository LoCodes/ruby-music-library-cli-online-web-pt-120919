class Artist

                          #initialize accepts a name for the new artist
  attr_accessor :name     #name retireves the name of an artist
                          #name=  can set the name of the artist
  attr_reader :songs, :genre      #initialize creates a 'songs' property set to an empty array (artist has many songs)

  @@all = []               #@@all can initialize as an empty array


  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.all            #.all returns the class variable
    @@all
  end

  def self.destroy_all    #.destroy_all resets the @@all class variable to an empty array
    self.all.clear
  end

  def save                #save adds the Artist instanceto the @@all class varible
    self.class.all << self
  end

  def self.create(name)   #.create initializes and saves the artist
    name = new(name)
  end

  def add_song(song)
   song.artist = self unless song.artist
   songs << song unless songs.include?(song)
  end

  #Associations — Artist and Genre:
  #Artist
    #genres
      #returns a collection of genres for all of the artist's songs (artist has many genres through songs)
      #does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs)
      #collects genres through its songs instead of maintaining its own @genres instance variable (artist has many genres through songs)

  def genres
    songs.collect{ |s| s.genre }.uniq
  end




end
