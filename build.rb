require 'json'

chapters_files = Dir['./site/chapters/*'].select {|f| File.basename(f) =~ /^[0-9]+\.md/ }

chapters = chapters_files.map {|file|
  first_line     = File.open(file, &:readline)
  title          = first_line.sub(/^# */, '')
  chapter_number = File.basename(file).gsub(/[^0-9]/, '')

  { number: chapter_number, title: title }
}
.sort_by {|ch| ch[:number] }

payload = { chapters: chapters }.to_json
File.open('./site/chapters/_data.json', 'w') { |file| file.write(payload) }
