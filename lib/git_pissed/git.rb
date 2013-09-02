module GitPissed
  class Git
    def self.revisions
      revs = `git rev-list --all`.split

      if revs.count > MAX_REVISIONS
        revs = revs.each_slice(revs.count / MAX_REVISIONS).map(&:first)
      end

      revs
    end

    def self.date_for(revision)
      `git show #{revision} --format=format:"%ad" --date=short | head -n1`.strip
    end

    def self.count_for(word, revision)
      `git grep -iw #{word} #{revision} | wc -l`.strip.to_i
    end
  end
end
