require_relative 'user.rb'
require_relative 'admin.rb'
require_relative 'mainadmin.rb'

class Session

  def initialize(login, password)
    @login = login
    @password = password
  end

  def log_in
    if is_admin?
      user = Admin.new 
    elsif  is_mainadmin?
      user = Mainradmin.new
    else
      user = User.new(@login, @password)
      if user.exists?(user.load_users)
        if user.correct?(user.load_users)
          p "your pet here"
        else 
          p 'incorrect user'
          return nil
        end
      else
        user.save
      end
    end
    user
  end

  private 

  def is_admin?
    @login == 'admin' && @password == 'admin007'
  end

  def is_mainadmin?
    @login == 'mainadmin' && @password == 'mainadmin123'
  end
end