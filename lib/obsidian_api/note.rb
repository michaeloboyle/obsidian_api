# frozen_string_literal: true

# lib/obsidian_api/note.rb

module ObsidianAPI
  class Note
    attr_reader :vault, :file_path

    def initialize(vault, file_path)
      @vault = vault
      @file_path = file_path
    end

    def content
      @vault.read(@file_path)
    end

    def save(new_content)
      @vault.write(@file_path, new_content)
    end

    def add_tag(tag)
      content = self.content
      if content =~ /tags:/
        content.gsub!(/tags: (.*)/, "tags: \\1, #{tag}")
      else
        content.prepend("---\ntags: #{tag}\n---\n")
      end
      save(content)
    end

    def remove_tag(tag)
      content = self.content
      content.gsub!(/tags:.*\b#{tag}\b,?/, "tags:")
      save(content)
    end
  end
end
