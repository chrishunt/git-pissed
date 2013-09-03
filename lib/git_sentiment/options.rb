module GitSentiment
  class Options
    MAX_REVISIONS = 30

    DEFAULT_WORDS = %w(
      shit
      fuck
      crap
    ).freeze

    FORMATS = %w(
      html
      csv
    )

    def words
      @words ||= DEFAULT_WORDS
    end

    def max_revisions
      @max_revisions ||= MAX_REVISIONS
    end

    def format
      @format ||= FORMATS.first
    end

    def parse!
      options = OptionParser.new do |opts|
        opts.banner = [
          'usage: git-sentiment',
          '[--words=<array>]',
          '[--max-revisions=<integer>]',
          "[--format=<#{FORMATS.join('|')}>]",
          '[--version]'
        ].join(' ')

        opts.separator "\noptions:"

        opts.on(
          "--words=#{DEFAULT_WORDS.join(',')}", Array,
          'Words to track across entire history'
        ) do |words|
          raise OptionParser::InvalidArgument if words.empty?
          @words = words
        end

        opts.on(
          "--max-revisions=#{MAX_REVISIONS}", Integer,
          'Number of revisions to track, spread equally across entire history'
        ) do |max_revisions|
          @max_revisions = max_revisions
        end

        opts.on(
          "--format=#{FORMATS.first}", String,
          "Output format. Supported formats: #{FORMATS.join(', ')}"
        ) do |format|
          raise OptionParser::InvalidArgument unless FORMATS.include?(format)
          @format = format
        end

        opts.on('--version', 'Show version') do
          puts VERSION
          exit
        end
      end

      options.parse!

      self
    rescue OptionParser::MissingArgument, OptionParser::InvalidArgument
      abort options.help
    end
  end
end
