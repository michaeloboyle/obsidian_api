# lib/obsidian_api/vault.rb
module ObsidianAPI
  class Vault
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def list_files
      Dir.glob(File.join(@path, '**/*.md'))
    end

    def read(file_path)
      full_path = File.join(@path, file_path)
      raise "File not found: #{file_path}" unless File.exist?(full_path)

      File.read(full_path)
    end

    def write(file_path, content)
      full_path = File.join(@path, file_path)
      File.write(full_path, content)
    end

    def delete(file_path)
      full_path = File.join(@path, file_path)
      File.delete(full_path) if File.exist?(full_path)
    end
  end
end