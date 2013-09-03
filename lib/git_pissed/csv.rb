module GitPissed
  CSV = Struct.new(:revisions, :options) do
    def to_s
      by_date = WordFinder.new(revisions, options).by_date

      csv = ["date", *options.words].join(',').tap do |csv|
        by_date.each do |date, words|
          csv << "\n" << [date, *words.values].join(',')
        end
      end
    end
  end
end
