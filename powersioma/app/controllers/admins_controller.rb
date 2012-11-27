class AdminsController < ApplicationController
  
 def index
    @users=User.all
    respond_to do|format|
      format.html
      format.xml{render :xml=>@users}
    end
  end
  
  def login
    if request.post?
      user=User.authenticate(params[:name], params[:password])
      if user
        session[:user_id]=user.id
        redirect_to(:action=>'index')
      else
        flash.now[:notice]="Invalid user/password combination"
      end
    end
  end

  def logout
  end

end
