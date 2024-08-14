# frozen_string_literal: true

# test_vault.rb
require "obsidian_api"

# Prompt the user for the vault path
puts "Please enter the path to your Obsidian vault:"
vault_path = gets.chomp

# Initialize your vault
vault = ObsidianAPI::Vault.new(vault_path)

# List files
puts "\nMarkdown files in the vault:"
puts vault.list_files

# Read a specific note (if it exists)
puts "\nEnter the name of a note to read (e.g., example_note.md):"
note_name = gets.chomp

if File.exist?(File.join(vault_path, note_name))
  puts "\nContent of #{note_name}:"
  puts vault.read(note_name)
else
  puts "\nNote '#{note_name}' does not exist in the vault."
end

# Write to a new note
puts "\nEnter the name of a new note to create (e.g., test_note.md):"
new_note_name = gets.chomp
puts "Enter the content for #{new_note_name}:"
new_note_content = gets.chomp
vault.write(new_note_name, new_note_content)

# Verify the content
puts "\nContent of #{new_note_name} after writing:"
puts vault.read(new_note_name)

# Ask if the user wants to delete the test note
puts "\nDo you want to delete #{new_note_name}? (y/n)"
delete_confirmation = gets.chomp.downcase

if delete_confirmation == "y"
  vault.delete(new_note_name)
  puts "#{new_note_name} has been deleted."
else
  puts "#{new_note_name} has been kept in the vault."
end
