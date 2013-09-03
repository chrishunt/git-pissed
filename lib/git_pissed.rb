require 'ruby-progressbar'

require 'git_pissed/version'
require 'git_pissed/git'
require 'git_pissed/word_finder'
require 'git_pissed/csv'
require 'git_pissed/cli'

module GitPissed
  MAX_REVISIONS = 30

  DEFAULT_WORDS = %w(
    shit
    fuck
    love
    todo
  ).freeze
end
