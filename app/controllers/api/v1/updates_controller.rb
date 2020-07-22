module Api
    module V1
        class UpdatesController < ApplicationController
            skip_before_action :verify_authenticity_token
            def index
                @updates = Update.all
                render json:@updates
            end

            def create
                return head:forbidden unless has_valid_api_key?
                data={
                    uptime:params[:uptime],
                    load:params[:load],
                    free_mem:params[:free_mem],
                    device_id:params[:device_id]
                }
                device=Device.find(data[:device_id])
                update= device.updates.create(uptime:data[:uptime], load:data[:load], free_mem:data[:free_mem])
                redirect_back(fallback_location: root_path)
            end

            private

            def has_valid_api_key?
                x_api_key = request.headers['X-Api-Key']
                device = Device.find_by(api_key:x_api_key)
                if device.nil?
                    return false
                else
                    return true
                end
            end


            

            



        end
    end
end