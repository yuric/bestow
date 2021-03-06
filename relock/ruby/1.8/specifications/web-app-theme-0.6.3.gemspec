# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{web-app-theme}
  s.version = "0.6.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrea Franz"]
  s.date = %q{2010-12-27}
  s.description = %q{Web app theme generator for rails projects}
  s.email = %q{andrea@gravityblast.com}
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.files = ["LICENSE", "README.md", "Rakefile", "VERSION", "config/locales/de_de.yml", "config/locales/pt_br.yml", "features/step_definitions/layout_steps.rb", "features/step_definitions/themed_steps.rb", "features/support/env.rb", "features/theme_generator.feature", "features/themed_generator.feature", "images/avatar.png", "images/icons/application_edit.png", "images/icons/cross.png", "images/icons/key.png", "images/icons/tick.png", "index.html", "javascripts/jquery-1.3.min.js", "javascripts/jquery.localscroll.js", "javascripts/jquery.scrollTo.js", "lib/generators/web_app_theme/theme/templates/layout_admin.html.erb", "lib/generators/web_app_theme/theme/templates/layout_sign.html.erb", "lib/generators/web_app_theme/theme/theme_generator.rb", "lib/generators/web_app_theme/themed/templates/view_edit.html.erb", "lib/generators/web_app_theme/themed/templates/view_form.html.erb", "lib/generators/web_app_theme/themed/templates/view_new.html.erb", "lib/generators/web_app_theme/themed/templates/view_show.html.erb", "lib/generators/web_app_theme/themed/templates/view_sidebar.html.erb", "lib/generators/web_app_theme/themed/templates/view_signin.html.erb", "lib/generators/web_app_theme/themed/templates/view_signup.html.erb", "lib/generators/web_app_theme/themed/templates/view_tables.html.erb", "lib/generators/web_app_theme/themed/templates/view_text.html.erb", "lib/generators/web_app_theme/themed/themed_generator.rb", "lib/web_app_theme.rb", "stylesheets/base.css", "stylesheets/override.css", "stylesheets/themes/amro/style.css", "stylesheets/themes/bec-green/style.css", "stylesheets/themes/bec/style.css", "stylesheets/themes/blue/style.css", "stylesheets/themes/default/images/arrow.png", "stylesheets/themes/default/images/boxbar-background.png", "stylesheets/themes/default/images/button-background-active.png", "stylesheets/themes/default/images/button-background.png", "stylesheets/themes/default/images/menubar-background.png", "stylesheets/themes/default/style.css", "stylesheets/themes/djime-cerulean/style.css", "stylesheets/themes/drastic-dark/style.css", "stylesheets/themes/kathleene/style.css", "stylesheets/themes/olive/style.css", "stylesheets/themes/orange/style.css", "stylesheets/themes/red/style.css", "stylesheets/themes/reidb-greenish/style.css", "stylesheets/themes/warehouse/style.css", "test/spec_helper.rb", "test/themed_generator_spec.rb", "web-app-theme.gemspec"]
  s.homepage = %q{http://github.com/pilu/web-app-theme}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{Web app theme generator}
  s.test_files = ["test/spec_helper.rb", "test/themed_generator_spec.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
