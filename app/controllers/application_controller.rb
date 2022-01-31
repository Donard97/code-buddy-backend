class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  # CUSTOM EXCEPTION HANDLING
  rescue_from Exception do |e|
    error_info = format_error("internal-server-error",e);
    render :json => error_info.to_json, :status => 500
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    error_info = format_error("RecordInvalid",e);
    render :json => error_info.to_json, :status => 406
  end

  def format_error(error, e)
    error_info = {
      :error => error,
      :message => "#{e.message}",
      :class => "#{e.class.name}",
      :record => e.record.errors,
    }
    error_info
  end

end
