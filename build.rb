require 'json'

chapters_files = Dir['./site/chapters/*'].select {|f| File.basename(f) =~ /^[0-9]+\.md/ }

#
# Generate a json with title data for home page
#
chapters = chapters_files.map {|file|
  File.open(file) do |f|
    line = ""
    while line && !line.match(/^# /)
      line = f.readline
    end

    title          = line.sub(/^# */, '')
    chapter_number = File.basename(file).gsub(/[^0-9]/, '')

    { number: chapter_number, title: title }
  end
}
.sort_by {|ch| ch[:number] }

payload = { chapters: chapters }.to_json
File.open('./site/chapters/_data.json', 'w') { |file| file.write(payload) }
