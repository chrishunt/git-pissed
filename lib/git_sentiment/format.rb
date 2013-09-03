module GitSentiment
  Format = Struct.new(:revisions, :options) do
    def to_s
      [ "#{name.upcase} has been written to #{file_path}",
        "To open:",
        "  $ open #{file_path}"
      ].join("\n")
    end

    def file_path
      @file_path ||= begin
        file = File.open("git-sentiment.#{name.downcase}", 'w')
        file.write formatted
        file.close
        file.path
      end
    end

    def name
      raise 'Implement me!'
    end

    def formatted
      raise 'Implement me!'
    end
  end
end
