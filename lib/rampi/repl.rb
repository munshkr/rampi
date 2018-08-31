require 'pry'
require 'io/console'

module Rampi
  module REPL
    extend self

    CONFIG_PATH = File.expand_path('~/.config/rampi')
    HISTORY_FILE = 'history'
    INIT_SCRIPT_FILE = 'init.rb'

    DEFAULT_INIT_SCRIPT =
      "# Here you can customize or define functions \n" \
      "# that will be available in Rampi\n\n"

    def start(port: nil)
      configure
      load_init_script

      dsl = DSL.new(port: port)
      dsl.pry
    end

    def configure
      prepare_config_dir

      if ENV['INSIDE_EMACS']
        Pry.config.correct_indent = false
        Pry.config.pager = false
        Pry.config.prompt = [ proc { '' }, proc { '' }]
      else
        Pry.config.prompt = [ proc { '>> ' }, proc { '.> ' }]
      end

      Pry.config.history.file = history_path
    end

    def red(string)
      "\e[31m\e[1m#{string}\e[22m\e[0m"
    end

    def load_init_script
      require(init_script_path)
    end

    def prepare_config_dir
      FileUtils.mkdir_p(CONFIG_PATH)

      unless File.exists?(init_script_path)
        File.write(init_script_path, DEFAULT_INIT_SCRIPT)
      end
    end

    def history_path
      File.join(CONFIG_PATH, HISTORY_FILE)
    end

    def init_script_path
      File.join(CONFIG_PATH, INIT_SCRIPT_FILE)
    end
  end
end
