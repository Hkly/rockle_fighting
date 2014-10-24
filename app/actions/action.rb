class Action
  #This is a parent class for actions. Actions are a good way to keep logic out of controllers and models.
  def self.execute(*args)
    self.new.execute(*args)
  end

  def execute
    raise "execute must be implemented by the subclassing action"
  end

end
