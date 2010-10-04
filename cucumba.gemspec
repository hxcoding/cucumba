# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cucumba}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["kucaahbe"]
  s.date = %q{2010-10-04}
  s.description = %q{If you develop more than one rails applications
that communicate with each other and you need to test them
with something like capybara and also whant to communicate with database -
this gem will help you}
  s.email = ["kucaahbe@ukr.net"]
  s.extra_rdoc_files = ["Manifest.txt", "PostInstall.txt", "website/index.txt"]
  s.files = ["History.md", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "config/website.yml.sample", "cucumba.gemspec", "generators/cucumba/USAGE", "generators/cucumba/cucumba_generator.rb", "generators/cucumba/templates/config.yml", "generators/cucumba/templates/cucumba", "lib/cucumba.rb", "lib/cucumba/drb.rb", "lib/cucumba/rails.rb", "lib/cucumba/rails/model.rb", "lib/cucumba/rails/runner.rb", "lib/cucumba/server.rb", "script/console", "script/destroy", "script/generate", "script/txt2html", "spec/cucumba_configuration_spec.rb", "spec/cucumba_spec_rails.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/support/sample_app/README", "spec/support/sample_app/Rakefile", "spec/support/sample_app/app/controllers/application_controller.rb", "spec/support/sample_app/app/controllers/users_controller.rb", "spec/support/sample_app/app/helpers/application_helper.rb", "spec/support/sample_app/app/helpers/users_helper.rb", "spec/support/sample_app/app/models/user.rb", "spec/support/sample_app/app/views/layouts/users.html.erb", "spec/support/sample_app/app/views/users/edit.html.erb", "spec/support/sample_app/app/views/users/index.html.erb", "spec/support/sample_app/app/views/users/new.html.erb", "spec/support/sample_app/app/views/users/show.html.erb", "spec/support/sample_app/config/boot.rb", "spec/support/sample_app/config/database.yml", "spec/support/sample_app/config/environment.rb", "spec/support/sample_app/config/environments/development.rb", "spec/support/sample_app/config/environments/production.rb", "spec/support/sample_app/config/environments/test.rb", "spec/support/sample_app/config/initializers/cookie_verification_secret.rb", "spec/support/sample_app/config/initializers/new_rails_defaults.rb", "spec/support/sample_app/config/initializers/session_store.rb", "spec/support/sample_app/config/routes.rb", "spec/support/sample_app/db/schema.rb", "spec/support/sample_app/public/404.html", "spec/support/sample_app/public/422.html", "spec/support/sample_app/public/500.html", "spec/support/sample_app/public/favicon.ico", "spec/support/sample_app/public/images/rails.png", "spec/support/sample_app/public/index.html", "spec/support/sample_app/public/javascripts/application.js", "spec/support/sample_app/public/javascripts/controls.js", "spec/support/sample_app/public/javascripts/dragdrop.js", "spec/support/sample_app/public/javascripts/effects.js", "spec/support/sample_app/public/javascripts/prototype.js", "spec/support/sample_app/public/robots.txt", "spec/support/sample_app/public/stylesheets/scaffold.css", "spec/support/sample_app/script/about", "spec/support/sample_app/script/console", "spec/support/sample_app/script/dbconsole", "spec/support/sample_app/script/destroy", "spec/support/sample_app/script/generate", "spec/support/sample_app/script/performance/benchmarker", "spec/support/sample_app/script/performance/profiler", "spec/support/sample_app/script/plugin", "spec/support/sample_app/script/runner", "spec/support/sample_app/script/server", "spec/support/sample_app_run.sh", "tasks/rspec.rake", "tasks/yard.rake", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb"]
  s.homepage = %q{http://github.com/hxcoding/cucumba}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{cucumba}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{If you develop more than one rails applications that communicate with each other and you need to test them with something like capybara and also whant to communicate with database - this gem will help you}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<yard>, [">= 0.6.1"])
      s.add_development_dependency(%q<bluecloth>, ["= 2.0.9"])
      s.add_development_dependency(%q<rails>, ["= 2.3.8"])
      s.add_development_dependency(%q<sqlite3-ruby>, ["= 1.3.1"])
      s.add_development_dependency(%q<rspec>, ["= 1.3.0"])
      s.add_development_dependency(%q<hoe>, [">= 2.6.2"])
    else
      s.add_dependency(%q<yard>, [">= 0.6.1"])
      s.add_dependency(%q<bluecloth>, ["= 2.0.9"])
      s.add_dependency(%q<rails>, ["= 2.3.8"])
      s.add_dependency(%q<sqlite3-ruby>, ["= 1.3.1"])
      s.add_dependency(%q<rspec>, ["= 1.3.0"])
      s.add_dependency(%q<hoe>, [">= 2.6.2"])
    end
  else
    s.add_dependency(%q<yard>, [">= 0.6.1"])
    s.add_dependency(%q<bluecloth>, ["= 2.0.9"])
    s.add_dependency(%q<rails>, ["= 2.3.8"])
    s.add_dependency(%q<sqlite3-ruby>, ["= 1.3.1"])
    s.add_dependency(%q<rspec>, ["= 1.3.0"])
    s.add_dependency(%q<hoe>, [">= 2.6.2"])
  end
end
