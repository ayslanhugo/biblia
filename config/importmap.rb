# config/importmap.rb

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "flatpickr" # @4.6.13
pin "flatpickr/dist/l10n/pt.js", to: "https://ga.jspm.io/npm:flatpickr@4.6.13/dist/l10n/pt.js"
pin "flatpickr/dist/themes/dark.css", to: "flatpickr--dist--themes--dark.css.js" # @4.6.13
