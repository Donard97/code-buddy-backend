class ApplicationController < ActionController::API
  include ActionController::MimeResponds

    # CUSTOM EXCEPTION HANDLING
    rescue_from Exception do |e|
      error_info = format_error('Internal Server Error', e)
      render json: error_info.to_json, status: :internal_server_error
    end

  rescue_from ActiveRecord::RecordInvalid do |e|
    error_info = format_error('Record Invalid', e)
    error_info['record'] = e.record.errors
    render json: error_info.to_json, status: :not_acceptable
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    error_info = format_error('Record not found', e)
    render json: error_info.to_json, status: :not_found
  end

  def format_error(title, error)
    {
      error: title.to_s,
      message: error.message.to_s,
      exception: "#{error.class.name} : #{error.message}"
    }
  end
end
