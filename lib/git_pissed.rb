require 'ruby-progressbar'

require './lib/git_pissed/git'
require './lib/git_pissed/word_finder'
require './lib/git_pissed/csv'
require './lib/git_pissed/cli'

module GitPissed
  MAX_REVISIONS = 5

  DEFAULT_WORDS = %w(
    shit
    fuck
    love
    todo
  ).freeze
end
