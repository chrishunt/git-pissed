module GitSentiment
  WordFinder = Struct.new(:revisions, :options) do
    def by_date
      with_sorted_dates do |dates|
        revisions.each do |revision|
          date = git.date_for(revision)

          options.words.each do |word|
            dates[date][word] = [
              dates[date][word], git.count_for(word, revision)
            ].max

            progress_bar.increment
          end
        end
      end
    end

    def with_sorted_dates
      dates = Hash.new { |hash, key| hash[key] = Hash.new(0) }
      yield dates
      dates.sort { |(k1, v1), (k2, v2)| k1 <=> k2 }
    end

    def progress_bar
      @progress_bar ||= begin
        ProgressBar.create \
          total: revisions.count * options.words.count,
          format: '%e <%B> %p%% %t'
      end
    end

    def git
      Git.new(options)
    end
  end
end
