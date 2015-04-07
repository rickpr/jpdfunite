# Jpdfunite

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jpdfunite'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jpdfunite

This depends on the following:
[Poppler-utils](http://poppler.freedesktop.org/) for finding length of PDF
(`pdfinfo`) and merging PDF files (`pdfunite`) (GPLv3)

Java for running JPDFBookmarks

[JPDFBookmarks](http://sourceforge.net/projects/jpdfbookmarks/) for adding
bookmarks to PDF (GPLv3)

`jpdfbookmarks` must be in your path, so download it and symlink it to
`/usr/local/bin` or add it to `.profile`.

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/jpdfunite/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
