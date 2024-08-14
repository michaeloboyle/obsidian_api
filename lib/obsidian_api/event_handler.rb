# lib/obsidian_api/event_handler.rb
require 'listen'

module ObsidianAPI
  class EventHandler
    def initialize(vault_path)
      @vault_path = Pathname.new(vault_path).realpath.to_s
      @listener = Listen.to(vault_path) do |modified, added, removed|
        added.each { |path| on_file_created(relative_path(path)) }
      end
    end

    def start
      @listener.start
      puts "Monitoring started..."
    end

    def stop
      @listener.stop
      puts "Monitoring stopped..."
    end

    private

    def on_file_created(relative_path)
      # Handle file creation
    end

    def relative_path(absolute_path)
      Pathname.new(absolute_path).relative_path_from(Pathname.new(@vault_path)).to_s
    end
  end
end