# Encoding: UTF-8

class VotesController < ApplicationController
  def create
    # logger.info "--> [Poll domain] Creating vote with timestamp #{params[:when] || Time.now}..."
    # Vote.expensive_call_in_domain
    
    DomainVotesWorker.perform_async params[:when] || Time.now

    head :created
  end
end
