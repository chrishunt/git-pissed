module GitPissed
  class CSV < Format
    def name
      'CSV'
    end

    def formatted
      table.join "\n"
    end

    def table
      [["date", *words_by_date[0][1].keys].join(',')].tap do |table|
        words_by_date.each do |date, words|
          table << [date, *words.values].join(',')
        end
      end
    end
  end
end
