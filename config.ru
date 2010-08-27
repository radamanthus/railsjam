# This file is used by Rack-based servers to start the application.
#ENV["GEM_HOME"]=%x{"source ~/.bash_profile ; rvm 1.9.2-preview3 ;"}.strip
require ::File.expand_path('../config/environment',  __FILE__)
run Railsjam::Application
