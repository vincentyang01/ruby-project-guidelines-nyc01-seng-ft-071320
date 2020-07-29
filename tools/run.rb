require 'json'
require 'pry'
require_relative '../config/environment'

a = Trainer.create(name: "A")
b = Trainer.create(name: "B")
# a1 = Instance.create()

cli = CLI.new
cli.start

binding.rpy