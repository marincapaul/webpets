// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// require("@rails/ujs").start()
// require("turbolinks").start()
// require("@rails/activestorage").start()
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
require("channels")
require("jquery")

import "flowbite"





Rails.start()
Turbolinks.start()
ActiveStorage.start()

