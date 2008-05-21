Gem::Specification.new do |s|
  s.name = "titlecase"
  s.version = "0.0.1"
  s.date = "2008-05-21"
  s.summary = "Title case string munging for Ruby."
  s.email = "jim@jimlindley.com"
  s.homepage = "http://github.com/jlindley/title_case"
  s.description = "Based on John Gruber's title case script."
  s.has_rdoc = false
  s.authors = ["John Gruber", "Jim Lindley"]
  s.files = %w[
    History.txt
    License.txt
    Manifest.txt
    PostInstall.txt
    README.txt
    Rakefile
    config/hoe.rb
    config/requirements.rb
    lib/title_case.rb
    lib/title_case/version.rb
    script/console
    script/destroy
    script/generate
    script/txt2html
    setup.rb
    spec/spec.opts
    spec/spec_helper.rb
    spec/title_case_spec.rb
    tasks/deployment.rake
    tasks/environment.rake
    tasks/rspec.rake
    tasks/website.rake
    title_case.gemspec
    website/index.html
    website/index.txt
    website/javascripts/rounded_corners_lite.inc.js
    website/stylesheets/screen.css
    website/template.html.erb
  ]
  s.test_files = %w[
    spec/spec.opts
    spec/spec_helper.rb
    spec/title_case_spec.rb
  ]
  s.rdoc_options = ["--main", "README.txt"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
end