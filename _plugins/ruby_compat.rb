# _plugins/ruby_compat.rb
class Object
  def tainted?
    false
  end
end
