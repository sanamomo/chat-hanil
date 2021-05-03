class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  around_action :switch_locale
  # around_action :set_locale

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :last_name, :first_name, :last_name_eng, :first_name_eng, :sex_id, :area_id, :language_id, :self_introduction, :birthday ]
      )
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  # def default_url_options(options={})
  #   { :locale => I18n.locale }.merge options
  # end

# # リンクの多言語化に対応する
#   def set_locale
#     I18n.locale = params[:locale] || I18n.default_locale
#   end
end
