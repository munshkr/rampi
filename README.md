# Rampi

Rampi is a REPL for [Rampcode](https://github.com/gabochi/rampclon), a bytecode
interpreter for Puredata. Rampi allows you to extend rampcode's minimalistic
language *on-the-fly*.


## Dependencies

* Ruby 2.3+
* Bundler

## Installation

Run the following to install Rampi

    $ gem install rampi

### Manual installation

1. Make sure Bundler is installed: `gem install bundler`.
2. Clone this repository and run `bin/setup` to install any dependencies.
3. Run `bundle exec rake install` to install Rampi.


## Editor integration

### Vim

Add the following line on your `~/.vimrc` file:

```vim
autocmd BufWritePost *.rampi silent exec "!rampi -f <afile>"
autocmd BufNewFile,BufRead *.rampi set syntax=ruby
```

### Gedit

You can use the *External Tools* plugin form Gedit to run `rampi` when pressing
a combination of keys.

First, you have to enable the plugin. Go to Preferences,
Plugins, and enable External Tools.  Then, on the menu, look for the option
*Manage External Tools*.  Add a new Tool called "Rampi" by pressing the `+`
button. Add the following content:

```bash
#!/bin/bash
rampi -f $GEDIT_CURRENT_DOCUMENT_NAME
```

Make sure the define a Shortcut Key, and set "Current document" on Save, to
make sure file is saved before running Rampi.

Whenever you hit your shortcut key, Gedit will run this script with all
environment variables cleared.  If you are using [rvm](https://rvm.io/) or
[chruby](https://github.com/postmodern/chruby) for managing your Ruby
installations, you may have a problem with this.  Make sure to add any setup
needed to set up the environemnt again.

For example, for chruby I had to use this:

```bash
#!/bin/bash
source /usr/local/share/chruby/chruby.sh   # Configure chruby
chruby ruby   # Select default Ruby installation
rampi -f $GEDIT_CURRENT_DOCUMENT_NAME
```

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
