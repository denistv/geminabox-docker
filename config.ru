require "rubygems"
require "geminabox"

Geminabox.data = "./data"
Geminabox.rubygems_proxy = true

run Geminabox::Server
