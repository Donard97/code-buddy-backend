class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  # CUSTOM EXCEPTION HANDLING
  rescue_from Exception do |e|
    error_info = format_error("Internal Server Error",e);
    render :json => error_info.to_json, :status => :internal_server_error
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    error_info = format_error("Record Invalid",e);
    error_info.push record => e.record.errors;
    render :json => error_info.to_json, :status => :not_acceptable
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    error_info = format_error("Record not found",e);
    render :json => error_info.to_json, :status => :not_acceptable
  end

  def format_error(title,e)
    error_info = {
      :error => "#{title}",
      :message => "#{e.message}",
      :exception => "#{e.class.name} : #{e.message}",
    }
    error_info
  end

end
