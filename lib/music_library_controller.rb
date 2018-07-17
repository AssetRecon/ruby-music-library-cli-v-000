class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
    @path = path
    library = MusicImporter.new(path)
    library.import
  end

  def call

  end









end
