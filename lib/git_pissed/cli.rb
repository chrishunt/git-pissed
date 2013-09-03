module GitPissed
  CLI = Struct.new(:argv) do
    def execute
      puts "Searching for #{words.join(', ')}..."
      puts "\n#{csv}"
    end

    def words
      @words ||= (argv.empty? ? DEFAULT_WORDS : argv)
    end

    def csv
      CSV.new(revisions, words)
    end

    def revisions
      Git.revisions
    end
  end
end
