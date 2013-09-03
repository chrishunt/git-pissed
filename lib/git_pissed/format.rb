module GitPissed
  Format = Struct.new(:revisions, :options) do
    def to_s
      [ "#{name.upcase} has been written to #{file_path}",
        "To open:",
        "  $ open #{file_path}"
      ].join("\n")
    end

    def file_path
      @file_path ||= File.open("git-pissed.#{name.downcase}", 'w').tap do |file|
        file.write formatted
      end.path
    end

    def name
      raise 'Implement me!'
    end

    def formatted
      raise 'Implement me!'
    end
  end
end
