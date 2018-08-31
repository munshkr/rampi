# Rampi

Rampi is a REPL for [Rampcode](https://github.com/gabochi/rampclon), a bytecode
interpreter for Puredata. Rampi allows you to extend rampcode's minimalistic
language *on-the-fly*.

*NOTE: This is still very much BETA (as well as Rampcode itself).  Let me know
if you tried it and found something wrong or unexpected.*


## Dependencies

* Ruby 2.3+
* Bundler

## Installation

*NOTE: I haven't uploaded a gem yet, so please refer to the Manual installation section.*

Run the following to install Rampi

    $ gem install rampi

### Manual installation

1. Make sure Bundler is installed: `gem install bundler`.
2. Clone this repository and run `bin/setup` to install any dependencies.
3. Run `bundle exec rake install` to install Rampi.


## Usage

Start Puredata and load the rampcode patch. Then on a terminal run `rampi`
Use `r` and `c1`, `c2`, etc. to set ramp velocity and code lines.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/munshkr/rampi.
