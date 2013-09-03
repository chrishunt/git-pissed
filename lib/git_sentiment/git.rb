module GitSentiment
  Git = Struct.new(:options) do
    def revisions
      revs = `git rev-list --all`.split

      if revs.count > options.max_revisions
        revs = revs.each_slice(revs.count / options.max_revisions).map(&:first)
      end

      revs
    end

    def date_for(revision)
      `git show #{revision} --format=format:"%ad" --date=short | head -n1`.strip
    end

    def count_for(word, revision)
      `git grep -iw #{word} #{revision} | wc -l`.strip.to_i
    end
  end
end
