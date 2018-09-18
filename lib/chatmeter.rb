require(File.join(File.dirname(__FILE__), "chatmeter", "api"))
Gem.find_files("chatmeter/g5/*.rb").each { |path| require path }