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

This provides three objects and two methods, `PdfFile`, `Section` and `Outline`.
`Outline` represents the complete output file and `Section` represents a
section. Here is an example that combines three PDF files into one:

``` ruby
require 'jpdfunite'
file_one = Jpdfunite::PdfFile.new("file_one.pdf")
file_two = Jpdfunite::PdfFile.new("file_two.pdf")
file_three = Jpdfunite::PdfFile.new("file_three.pdf")
sec_one = Jpdfunite::Section.new("Section One")
sec_two = Jpdfunite::Section.new("Section Two")
document = Jpdfunite::Outline.new("Combined Files")
sec_one.add_mark(file_one)
sec_one.add_mark(file_two)
sec_two.add_mark(file_three)
document.add_mark(sec_one)
document.add_mark(sec_two)
Jpdfunite.create(document)
# Or do one at a time
outfile = Jpdfunite.combine(document)
Jpdfunite.outline(outfile, document)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/jpdfunite/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
