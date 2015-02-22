class VotesController < ApplicationController

    def show
      @vote = Vote.find(params[:id])
    end

	def index
		@votes = Vote.all.order('created_at ASC')
	end

	def new
      @vote = Vote.new
	end

	def create
	  @vote = Vote.new
	  @vote = Vote.new(:name => parsed["From"], :description => parsed["Body"])
	  @vote.save
	end

end