class VotesController < ApplicationController
  def create
    Vote.expensive_call_in_client
    
    logger.info '--> Executing POST in Poll domain...'
    response = HTTParty.post 'http://localhost:3001/votes', { query: { when: params[:when] || Time.now } }
    
    if response.code == 201
      head :created
    else
      head :internal_server_error
    end
  end
end
