module GitSentiment
  class CSV < Format
    def name
      'CSV'
    end

    def formatted
      table.join "\n"
    end

    def table
      by_date = WordFinder.new(revisions, options).by_date

      [["date", *options.words].join(',')].tap do |table|
        by_date.each do |date, words|
          table << [date, *words.values].join(',')
        end
      end
    end
  end
end
