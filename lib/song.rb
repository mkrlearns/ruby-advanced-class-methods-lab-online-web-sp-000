class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name }
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    
    name = filename_split[1]
    song = self.new
    song.name = filename[1][0...-4]
    song.artist_name = filename_split[0]
  end

  def self.create_from_filename
    
  end

  def self.destroy_all
    @@all.clear
  end

end
