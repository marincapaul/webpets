// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";


import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
require("channels")
require("jquery")

import "flowbite"

// import { Fancybox } from "@fancyapps/ui/dist/fancybox/fancybox.esm.js";
// import "@fancyapps/ui/dist/fancybox/fancybox.css";


Rails.start()
Turbolinks.start()
ActiveStorage.start()

// window.addEventListener('turbolinks:load', () => {
//     Fancybox.bind('[data-fancybox="gallery"]');
// });

// const application = Application.start()
// const context = require.context("controllers", true, /.js$/)
// application.load(definitionsFromContext(context))