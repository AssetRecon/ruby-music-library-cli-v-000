class MusicImporter

  attr_accessor :path

  def initialize(filepath)
    @path = filepath
  end

  def files
    files =  Dir.entries(@path) - ["."] - [".."]
  end

  def self.import
    #imports all of the files from the library, instantiating a new Song object for each file.
    files.each do |filename|
    Song.new_by_filename(filename)
    end
  end




end