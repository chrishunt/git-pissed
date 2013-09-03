module GitSentiment
  class CLI
    def execute
      puts "Measuring #{options.words.join(', ')}..."
      puts "\n#{formatted_output}"
    end

    def options
      @options ||= Options.new.parse!
    end

    def formatted_output
      public_send options.format
    end

    def csv
      @csv ||= CSV.new(revisions, options)
    end

    def html
      @html ||= HTML.new(revisions, options)
    end

    def revisions
      Git.new(options).revisions
    end
  end
end
