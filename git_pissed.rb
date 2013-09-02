#!/bin/ruby

# Git Pissed
# git_pissed.rb
#
# Track words of interest over time in your git repository. Output is formatted
# as CSV for import into graphing tool. Case is ignored.
#
# Usage:
#
#   # Track default set of words (shit, fuck, love, todo)
#   $ git_pissed
#
#   # Track custom set of words
#   $ git_pissed happy love california

require 'pry'
require 'ruby-progressbar'

MAX_REVISIONS = 30

DEFAULT_WORDS = %w(
  shit
  fuck
  love
  todo
)

def words
  @words ||= (ARGV.empty? ? DEFAULT_WORDS : ARGV)
end

def revisions
  @revisions ||= begin
    revs = `git rev-list --all`.split

    if revs.count > MAX_REVISIONS
      revs = revs.each_slice(revs.count / MAX_REVISIONS).map(&:first)
    end

    revs
  end
end

def date_for(revision)
  `git show #{revision} --format=format:"%ad" --date=short | head -n1`.strip
end

def count_for(word, revision)
  `git grep -iw #{word} #{revision} | wc -l`.strip.to_i
end

def words_by_date
  @words_by_date ||= begin
    Hash.new { |hash, key| hash[key] = Hash.new(0) }.tap do |words_by_date|
      progress_bar = ProgressBar.create \
        total: revisions.count * words.count,
        format: '%e <%B> %p%% %t'

      revisions.each do |revision|
        date = date_for(revision)

        words.each do |word|
          words_by_date[date][word] = [
            words_by_date[date][word],
            count_for(word, revision)
          ].max

          progress_bar.increment
        end
      end
    end
  end
end

def csv
  csv = ["date", *words].join(',').tap do |csv|
    words_by_date.keys.sort.each do |date|
      csv << "\n" << [date, *words_by_date[date].values].join(',')
    end
  end
end

puts "Tracking #{words.join(', ')} ..."
puts "\n#{csv}"
