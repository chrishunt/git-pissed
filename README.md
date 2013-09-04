# git-pissed

### gitting pissed about your code.

Are the developers on your team frustrated? Do you wish you had better tests?
Do rainy days get you down? Do you have enough stackoverflow links in your
code? Answer these questions *today* with `git-pissed`

`git-pissed` tracks any number of words across your entire git history. The
defaults are **wildly offensive** and inspired by [Vidar Holen's Linux Kernel
Swear Counts](http://www.vidarholen.net/contents/wordcount).

![](https://raw.github.com/chrishunt/git-pissed/master/img/graph-100res.gif)

## Usage

Install the gem, open a git repo, and git pissed.

```bash
$ gem install git_pissed
$ cd my/git/repo
$ git-pissed && open git-pissed.html
```

Sometimes we want to track happiness instead of **ANGER!!** `git-pissed` allows
the tracking of any set of words.

```bash
$ git-pissed --words=love,hate,rainbow
```

![](https://raw.github.com/chrishunt/git-pissed/master/img/graph-love-hate-rainbow.png)

If you are a graphing wizard and just want the data, generate a CSV instead.

```bash
$ git-pissed --format=csv
$ cat git-pissed.csv
date,love,hate,rainbow
2010-12-27,37,3,2
2012-03-17,29,5,3
2012-11-08,35,4,3
2013-04-08,38,9,3
2013-09-02,42,9,3
```

Got time to spare and want a really cool graph? Increase the resolution. The
amount specified in `max-revisions` (defaults to 30) will be scanned evenly
throughout the entire git history.

```bash
$ git-pissed --max-revisions=100
```

![](https://raw.github.com/chrishunt/git-pissed/master/img/graph-100res.png)

```bash
$ git-pissed --max-revisions=15
```

![](https://raw.github.com/chrishunt/git-pissed/master/img/graph-15res.png)

## Options

```bash
$ git-pissed --help
usage: git-pissed [--words=<array>] [--max-revisions=<integer>] [--format=<html|csv>] [--version]

options:
        --words=shit,fuck,crap       Words to track across entire history
        --max-revisions=30           Number of revisions to track, spread equally across entire history
        --format=html                Output format. Supported formats: html, csv
        --version                    Show version
```

## Requirements
`git-pissed` requires Ruby `1.8.7` or later. Welcome to the future!

## Installation

```bash
$ gem install git_pissed
```

## Contributing
Please see the [Contributing
Document](https://github.com/chrishunt/git-pissed/blob/master/CONTRIBUTING.md)

## Changelog
Please see the [Changelog
Document](https://github.com/chrishunt/git-pissed/blob/master/CHANGELOG.md)

## License
Copyright (C) 2013 Chris Hunt, [MIT
License](https://github.com/chrishunt/git-pissed/blob/master/LICENSE.txt)
