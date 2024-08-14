# frozen_string_literal: true

module ObsidianAPI
  # The Note class provides methods to interact with individual markdown notes in an Obsidian vault.
  # It allows for reading, writing, and manipulating the content of the notes.
  # It also provides methods to add and remove tags from notes.
  #
  # Example:
  #
  # vault = ObsidianAPI::Vault.new("path/to/vault")
  # note = ObsidianAPI::Note.new(vault, "path/to/note.md")
  #
  # content = note.content
  # puts content
  #
  # note.save("New content")
  #
  # note.add_tag("new-tag")
  #
  # note.remove_tag("old-tag")
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
