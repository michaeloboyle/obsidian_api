# spec/vault_spec.rb
require 'obsidian_api/vault'

RSpec.describe ObsidianAPI::Vault do
  let(:vault_path) { 'spec/fixtures/vault' }
  let(:vault) { ObsidianAPI::Vault.new(vault_path) }

  describe '#list_files' do
    it 'lists all markdown files in the vault' do
      expect(vault.list_files).to include('spec/fixtures/vault/note1.md', 'spec/fixtures/vault/note2.md')
    end
  end

  describe '#read' do
    it 'reads the content of a markdown file' do
      content = vault.read('note1.md')
      expect(content).to eq("# Note 1\nThis is the first note.")
    end
  end

  describe '#write' do
    it 'writes content to a markdown file' do
      vault.write('note3.md', "# Note 3\nThis is a new note.")
      expect(vault.read('note3.md')).to eq("# Note 3\nThis is a new note.")
    end
  end

  describe '#delete' do
    it 'deletes a markdown file' do
      vault.delete('note3.md')
      expect(File.exist?('spec/fixtures/vault/note3.md')).to be false
    end
  end
end