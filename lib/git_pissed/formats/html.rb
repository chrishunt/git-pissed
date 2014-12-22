module GitPissed
  class HTML < Format
    def name
      'HTML'
    end

    def formatted
      File.read(
        File.expand_path('../templates/index.html', __FILE__)
      ).gsub("%CSV%", csv).gsub("%PATH%", File.basename(Dir.pwd))
    end

    def csv
      CSV.new(words_by_date, options).
        table.
        map { |r| "'#{r.strip}\\n'" }.
        join('+')
    end
  end
end
