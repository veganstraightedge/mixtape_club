# Pin npm packages by running ./bin/importmap

pin 'application'

# hotwire.js
pin '@hotwired/turbo-rails',      to: 'turbo.min.js'
pin '@hotwired/stimulus',         to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'

# bootstrap
pin 'popper',    to: 'popper.js',        preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true

# stimulus controllers
pin_all_from 'app/javascript/controllers', under: 'controllers'
