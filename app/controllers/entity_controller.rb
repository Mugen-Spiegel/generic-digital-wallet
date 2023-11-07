class EntityController < ApplicationController

    skip_before_action :user_signed_in?
    def show

        render json: {
            user: current_user,
            transaction: {
                deposit: [current_user.deposit],
                withdraw: [current_user.withdraw],
            },
            balance: current_user.balance
        },
        status: :ok
    end

    def login
        entity = Entity.find_by(email: login_param[:email])
        puts entity, entity.authenticate(login_param[:password]), "asdasdasadsad"
        if entity.authenticate(login_param[:password])
            entity.regenerate_auth_token
            render json: {auth_token: get_entity(entity).auth_token}, status: :ok
        else
            render json: {errors: ["Invalid Credential"]}, status: :bad_request
        end
    end


    private

    def login_param
        params.permit(:email, :password)
    end
    
end
