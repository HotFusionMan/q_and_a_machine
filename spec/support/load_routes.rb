RSpec.configure do |c|
  c.include QAndAMachine::Engine.routes.url_helpers, :example_group => { :file_path => /\bspec\/integration\// }
end