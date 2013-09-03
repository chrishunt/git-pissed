module GitPissed
  Options = Struct.new(:argv) do
    MAX_REVISIONS = 30

    DEFAULT_WORDS = %w(
      shit
      fuck
      crap
      love
    ).freeze

    def words
      DEFAULT_WORDS
    end

    def max_revisions
      MAX_REVISIONS
    end

    def blah
      options = OpenStruct.new

      options.words = DEFAULT_WORDS

      OptionParser.new do |opts|
        opts.banner = "Usage: example.rb [options]"

        opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
          options[:verbose] = v
        end
      end.parse!

      p options
      p ARGV

      options
    end
  end
end
