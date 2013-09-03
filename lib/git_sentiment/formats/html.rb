module GitSentiment
  class HTML < Format
    def name
      'HTML'
    end

    def formatted
      File.read(
        File.expand_path('../templates/index.html', __FILE__)
      ).gsub("%CSV%", csv)
    end

    def csv
      CSV.new(revisions, options).table.map { |r| "'#{r.strip}\\n'" }.join('+')
    end
  end
end
