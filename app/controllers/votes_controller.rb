class VotesController < ApplicationController

	def index
		@votes = Vote.all.order('created_at DESC').limit(20)
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