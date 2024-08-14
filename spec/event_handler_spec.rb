# spec/event_handler_spec.rb

require 'spec_helper'
require 'fileutils'
require 'obsidian_api/event_handler'

RSpec.describe ObsidianAPI::EventHandler do
  let(:vault_path) { 'spec/fixtures/vault' }
  let(:event_handler) { ObsidianAPI::EventHandler.new(vault_path) }
  let(:test_file_path) { "#{vault_path}/new_note.md" }

  before do
    allow(event_handler).to receive(:on_file_created)
  end

  it 'detects file creation in the vault' do
    event_handler.start
    FileUtils.touch(test_file_path)
    sleep 1  # Allow time for the listener to detect the file
    expect(event_handler).to have_received(:on_file_created).with("new_note.md")
    event_handler.stop
  end

  after do
    # Clean up the test file after the test runs
    FileUtils.rm_f(test_file_path)
  end
end