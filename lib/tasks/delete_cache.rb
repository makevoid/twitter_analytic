path = File.expand_path "../../../", __FILE__

puts `rm -rf #{path}/tmp/*.json`

puts "cache files deleted"