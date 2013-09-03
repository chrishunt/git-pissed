module GitPissed
  class Options
    MAX_REVISIONS = 30

    DEFAULT_WORDS = %w(
      shit
      fuck
      crap
    ).freeze

    def words
      @words ||= DEFAULT_WORDS
    end

    def max_revisions
      @max_revisions ||= MAX_REVISIONS
    end

    def parse!
      options = OptionParser.new do |opts|
        opts.banner = [
          'usage: git-pissed',
          '[--words=<array>]',
          '[--max-revisions=<integer>]',
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
