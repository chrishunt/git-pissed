module GitPissed
  class CSV < Format
    def name
      'CSV'
    end

    def formatted
      table.join "\n"
    end

    def table
      [["date", *options.words].join(',')].tap do |table|
        words_by_date.each do |date, words|
          table << [date, words.values_at(*options.words)].join(',')
        end
      end
    end
  end
end
