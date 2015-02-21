class VotesController < ApplicationController

	def index
		@votes = Vote.all
	end

	def new
      @vote = Vote.new
	end

	def create
	  @vote = Vote.new(:name => parsed["From"], :description => parsed["Body"])
	  @vote.save
	end

end