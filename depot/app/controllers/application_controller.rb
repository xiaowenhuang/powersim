# Filters added to this controller apply to all controllers in the application.

# Likewise, all the methods added will be available for all controllers.


class ApplicationController < ActionController::Base
      layout "stores"

helper :all # include all helpers, all the time

  
# See ActionController::RequestForgeryProtection for details
  
# Uncomment the :secret if you're not using the cookie session store
   #protect_from_forgery :secret => 'ca57eb4460c05dbb602a59ccbca48715'
   #see ActionController::RequestForgeryProtection for details
   #Uncomment this to filter the contents of submitted sensitive data parameters
   #from your application log (in this case,all fields with names like "password")
  before_filter :set_locale
  before_filter :authorize, :except => :login
 
  #...
    protected
    def set_locale
      session[:locale]=params[:locale] if params[:locale]
      I18n.locale=session[:locale]||I18n.default_locale
      
      locale_path="#{LOCALES_DIRECTORY}#{I18n.locale}.yml"
      unless I18n.load_path.include? locale_path
        I18n.load_path<<locale_path
        I18n.backend.send(:init_translations)
        
      end
    rescue Exception=>err
      logger.error err
      flash.now[:notice]="#{I18n.locale} translation not available"
      I18n.load_path -= [locale_path]
      I18n.locale=session[:locale]=I18n.default_locale
    end
    

   protected 
     def authorize
       unless User.find_by_id(session[:user_id])
         flash[:notice]=:"Please log in"
         redirect_to :controller=>'admins', :action=>'login'
       end
   end

end