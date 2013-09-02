module GitPissed
  CSV = Struct.new(:revisions, :words) do
    def to_s
      by_date = WordFinder.new(revisions, words).by_date

      csv = ["date", *words].join(',').tap do |csv|
        by_date.each do |date, words|
          csv << "\n" << [date, *words.values].join(',')
        end
      end
    end
  end
end
