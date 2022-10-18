require_relative './user_interface/app'

def main
  app = App.new
  app.run_app
end

main