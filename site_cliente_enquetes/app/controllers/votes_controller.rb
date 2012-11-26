class VotesController < ApplicationController
  def create
    # Vote.expensive_call_in_client
    # logger.info '--> Executing POST in Poll domain...'
    # response = HTTParty.post 'http://localhost:3001/votes', { body: { when: params[:when] || Time.now } }

    ClientVotesWorker.perform_async params[:when] || Time.now
    
    # if response.code == 201
    #   head :created
    # else
    #   head :internal_server_error
    # end
    
    head :created
  end
end
