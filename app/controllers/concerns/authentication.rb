# app/controllers/concerns/authentication.rb
module Authentication
    extend ActiveSupport::Concern

    def current_user
        entity = Entity.find_by(auth_token: request.headers['Authorization'].split(' ').last)
        unless entity.nil?
          get_entity(entity)
        end
    end
  
    def user_signed_in?
      if current_user.present?

      elsif
        render json: {errors: ["Invalid Credential"]}, status: :bad_request
      end
    end

    def get_entity(entity)
        if  entity.type == 'User'
            User.where(id: entity).first
        elsif entity.type == 'Team'
            Team.where(id: entity).first
        elsif entity.type == 'Stock'
            Stock.where(id: entity).first
        end
    end
  end
  