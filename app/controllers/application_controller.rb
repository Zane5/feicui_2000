class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale]|| I18n.default_locale
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_user
    redirect_to sign_in_path unless current_user
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def set_type
    @type = type
  end

  def type
    params.include?(:type) ? params[:type] : "Product"
  end

  def type_class
    type.constantize
  end

  def sti_params_id
    if !params[:type]
      return params[:id]
    else
      return params[type.underscore + "_id"] 
    end
  end

  def set_product
    @product = type_class.find(sti_params_id)
  end
  
  def sti_product_path(type = "product", product = nil, action = nil)
    send "#{ format_sti(aciton, type, product) }_path", product
  end

  def format_sti(action, type, product)
    action || product ? "#{ format_action(action) }#{ type.undersocre }" : "#{ type.undersocre.pluralize }"
  end

  def format_action(action)
    action ? "#{ aciton }_" : ""
  end


  helper_method :current_user
end
