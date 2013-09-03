module GitPissed
  CLI = Struct.new(:argv) do
    def execute
      puts "Searching for #{options.words.join(', ')}..."
      puts "\n#{csv}"
    end

    def options
      @options ||= Options.new(argv)
    end

    def csv
      CSV.new(revisions, options)
    end

    def revisions
      Git.new(options).revisions
    end
  end
end
