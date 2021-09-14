
# lib/disco.rb
require 'json'
require 'fileutils'

class Disco
  DATASTORE_DIR = "datastore"
  INDEX_FILE = "index"
  def self.write(raw_event)
    event = JSON.parse(raw_event)

    existing_columns = Dir.children(DATASTORE_DIR)
    index_filepath = File.join(DATASTORE_DIR, INDEX_FILE)
    head = File.open(index_filepath, 'r') { |index| index.gets.to_i }
    new_columns = (event.keys - existing_columns)

    new_columns.each do |column|
      filepath = File.join(DATASTORE_DIR, column)
      File.open(filepath, 'a') do |file|
        head.times { file.puts nil }
      end
    end

    Dir.each_child(DATASTORE_DIR) do |column|
      filepath = File.join(DATASTORE_DIR, column)
      File.open(filepath, 'a') do |file|
        file.puts event[column]
      end
    end

    File.open(index_filepath, 'w') do |index|
      index.puts head.next
    end
  end
end
