module Caching

  # simple json cache

  CACHE_FILE = "#{PATH}/tmp/tweets_%s.json"

  def cache_present?(key)
    File.exist? CACHE_FILE % key
  end

  def cache_load(key)
    file = File.read CACHE_FILE % key
    JSON.parse file
  end

  def cache_save(key, contents)
    File.open( CACHE_FILE % key, "w" ) do |file|
      file.write contents.to_json
    end
  end

end