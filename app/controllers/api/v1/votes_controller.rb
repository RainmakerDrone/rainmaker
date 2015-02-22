module Api
    module V1
        class VotesController < ApplicationController
            respond_to :json

            def index
                    respond_with Vote.where(created_at: (Time.now-10.seconds)..(Time.now)).as_json
                    #respond_with Vote.all.as_json(:only => [:description])
            end
            
        end
    end
end