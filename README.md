# ObsidianAPI Gem

[![Gem Version](https://badge.fury.io/rb/obsidian_api.svg)](https://badge.fury.io/rb/obsidian_api_gem)
[![Build Status](https://travis-ci.org/your_username/obsidian_api_gem.svg?branch=main)](https://travis-ci.org/your_username/obsidian_api_gem)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

`ObsidianAPI` is a Ruby gem that allows developers to interact with their Obsidian vaults directly from Ruby. With this gem, you can manage Markdown files, handle metadata, and automate tasks within your vaults programmatically.

## Features

- **List Markdown Files**: Retrieve a list of all Markdown files within an Obsidian vault.
- **Read File Content**: Read the content of a specific Markdown file.
- **Write to Files**: Modify the content of existing Markdown files or create new ones.
- **Delete Files**: Safely delete files from your vault.
- **Tag Management**: Add and remove tags from notes.
- **Event Handling**: Register and handle events such as file creation, modification, and deletion.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'obsidian_api'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install obsidian_api
```

## Usage

### Initializing a Vault

To start interacting with your Obsidian vault, initialize the `Vault` class with the path to your vault:

```ruby
require 'obsidian_api/vault'

vault = ObsidianAPI::Vault.new('/path/to/your/obsidian/vault')
```

### Listing Files

You can list all Markdown files in your vault:

```ruby
files = vault.list_files
files.each { |file| puts file }
```

### Reading a File

To read the content of a specific file:

```ruby
content = vault.read('note1.md')
puts content
```

### Writing to a File

To write content to a new or existing file:

```ruby
vault.write('note2.md', "# Note 2\nThis is the second note.")
```

### Deleting a File

To delete a file from your vault:

```ruby
vault.delete('note2.md')
```

### Working with Notes

The `Note` class provides more specialized methods for handling Markdown files:

```ruby
require 'obsidian_api/note'

note = ObsidianAPI::Note.new(vault, 'note1.md')

# Get the content of the note
puts note.content

# Add a tag to the note
note.add_tag('important')

# Remove a tag from the note
note.remove_tag('important')
```

### Event Handling

You can also register event handlers to listen for changes within your vault:

```ruby
require 'obsidian_api/event_handler'

event_handler = ObsidianAPI::EventHandler.new('/path/to/your/obsidian/vault')

event_handler.start
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rspec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [RubyGems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/your_username/obsidian_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/your_username/obsidian_api_gem/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ObsidianAPI project's codebases, issue trackers, chat rooms, and mailing lists is expected to follow the [code of conduct](https://github.com/your_username/obsidian_api/blob/main/CODE_OF_CONDUCT.md).

---

This README provides a comprehensive overview of the `ObsidianAPI` gem, including installation instructions, basic usage examples, and information on contributing to the project. Be sure to replace placeholder URLs with the actual links to your GitHub repository and other relevant resources.