if defined?(PryNav) || defined?(PryByebug)
  Pry.commands.alias_command('c', 'continue')
  Pry.commands.alias_command('s', 'step')
  Pry.commands.alias_command('n', 'next')
end

Pry.config.color = true

Pry::Commands.create_command('sql', 'Send sql over AR.', :sellwords => false) do
  def process(query)
    if defined?(ActiveRecord)
      puts ActiveRecord::Base.connection.select_all(query)
    else
      puts 'ActiveRecord is not defined'
    end
  end
end

Pry::Commands.create_command('clear', 'clear the screen', :shellwords => false) do
  def process
    system 'clear'
  end
end

def own_methods(object)
  (object.methods - Object.methods).sort
end
