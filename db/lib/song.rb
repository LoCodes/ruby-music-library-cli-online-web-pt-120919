#Song

class Song
  attr_accessor :name              #initialize accepts a name for the new song
  attr_reader :artist, :genre       #name retrieves the name of a song
                                    #name= can set the name of a song

  @@all = []                        #@@all is initialized as an empty array

  def initialize(name, artist = nil, genre = nil)  #initialize  can be invoked with an optional second argument,an Artist object to be assigned to the song's 'artist' property (song belongs to artist)
    self.artist = artist if artist    #initialize invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization
    self.genre = genre if genre       #initialize can be invoked with optional third argument, a Genre object to be assigned to song's 'genre' property (song belongs to genre)
    @name = name
    @@all << self
  end

  def artist=(artist)     #artist= invokes Artist#add_song to add itself to the artist's collection of songs (artist has many songs)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)       #genre returns the genre of the song (song belongs to genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)  #does not add the song to the genre's collection of songs if it already exists therein
  end


  def self.all              #.all  returns the class variable @@all
    @@all
  end

  def self.destroy_all      #.destroy_all resets the @@all class variable to an empty array
    @@all.clear
  end

  def save                  #save adds the Song instance to the @@all class variable
    self.class.all << self
  end

  def self.create(name)     #.create initialize, saves, and returns the song
    song = new(name)
    song.save
    song
  end

  def self.find_by_name (name)   #.find_by_name finds a song instance in @@all by the name property
    all.detect { |s| s.name == name }
  end


  def self.find_or_create_by_name(name)
    find_by_name(name) == create(name)
  end



end
