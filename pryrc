Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'

Pry.config.color = true

default_command_set = Pry::CommandSet.new do
  command "sql", "Send sql over AR." do |query|
    if ENV['RAILS_ENV'] || defined?(Rails)
      pp ActiveRecord::Base.connection.select_all(query)
    else
      pp "No rails env defined"
    end
  end
end

Pry::Commands.create_command 'clear', 'clear the screen', :shellwords => false do
  def process
    system 'clear'
  end
end

def own_methods(object)
  (object.methods - Object.methods).sort
end
