module GitPissed
  class CLI
    def execute
      puts "Measuring #{options.words.join(', ')}..."
      puts "\n#{formatted_output}"
    end

    def options
      @options ||= Options.new.parse!
    end

    def formatted_output
      send options.format
    end

    def csv
      @csv ||= CSV.new(words_by_date, options)
    end

    def html
      @html ||= HTML.new(words_by_date, options)
    end

    def words_by_date
      WordFinder.new(
        Git.new(options).revisions,
        options
      ).by_date
    end
  end
end
