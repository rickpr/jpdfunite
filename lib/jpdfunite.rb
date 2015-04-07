require "jpdfunite/version"
require "shellwords"

module Jpdfunite

  class << self
    
    def combine(pdf_outline)
      sans_outline = Tempfile.new("pdfgs")
      sans_outline.close
      %x[pdfunite #{pdf_outline.path} #{sans_outline.path.shellescape}]
      sans_outline
    end

    def outline(sans_outline, pdf_outline)
      pdfmarks = Tempfile.new("pdfmarks")
      pdfmarks.write pdf_outline.pdfmarks
      pdfmarks.close
      output = Tempfile.new(pdf_outline.title)
      output.close
      %x[jpdfbookmarks -f -a #{pdfmarks.path} #{sans_outline.path} -o #{output.path.shellescape}]
      output
    end

  end

class Outline

    attr_reader :title, :submarks

    def initialize title = ""
      @title    = title
      @submarks = []
    end

    def add_mark(element)
      @submarks << element
    end

    def pages
      @submarks.map(&:pages).reduce(0, :+)
    end

    def pdfmarks(page = 1, tabs = -1)
      output = [own_mark(page, tabs)]
      tabs += 1
      @submarks.each do |element|
        output << element.pdfmarks(page, tabs)
        page += element.pages
      end
      output.reject(&:empty?).join("\n")
    end

    def path
      @submarks.map(&:path).join(" ")
    end

    private

    def own_mark(page, tabs)
      ""
    end

  end

  class Section < Outline

    private

    def own_mark(page, tabs)
      tabs = "\t" * tabs
      tabs << "#{@title}/#{page}"
    end

  end



  class PdfFile < Section 

    attr_reader :path, :pages

    def initialize(path, title = path)
      @path = path.shellescape
      super(title)
      get_pages
    end
    
    private

    def get_pages
      @pages = %x[pdfinfo #{@path}][/^Pages: +(\d+)/, 1].to_i
    end

  end


end
