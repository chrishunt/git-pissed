module GitPissed
  class CLI
    def execute
      puts "Tracking #{options.words.join(', ')}..."
      puts "\n#{csv}"
    end

    def options
      @options ||= Options.new.parse!
    end

    def csv
      CSV.new(revisions, options)
    end

    def revisions
      Git.new(options).revisions
    end
  end
end
