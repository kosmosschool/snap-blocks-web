class Api::CreationsController < ApplicationController
  skip_forgery_protection

  def index
    creations = Creation.all

    render json: creations
    
  end

  def show
    creation = Creation.find(params[:id]) 
    render json: creation_formatted(creation)
  end

  def create
    # check if user with device id already exists
    user = User.find_or_create_by(device_id: params[:device_id])

    # update username if param is given
    if params[:username].present?
      username = params[:username].strip
      if username.present?
        user.username = username
        user.save
      end
    end

    creation = Creation.new(title: params[:title], user: user)

    file_json = params[:file].to_json

    # create temp file which we'll upload to s3
    temp_file = Tempfile.new('temp.json')
    temp_file.write(file_json)
    temp_file.rewind

    # upload to s3
    creation.file.attach(io: temp_file, filename: "temp.json", content_type: "application/json", identify: false)
    creation.save

    # delete temp file
    temp_file.close
    temp_file.unlink


    render json: creation_formatted(creation)
  end

  def creation_formatted(creation)
    {
      id: creation.id,
      title: creation.title,
      user_name: creation.user.nil? ? nil : creation.user.username,
      file_url: creation.file.service_url,
      created_at: creation.created_at,
      updated_at: creation.updated_at
    }

  end

  private 
    def creation_params
      params.require(:creation).permit(:title, :device_id,)
    end
end
