class ClientVotesWorker
  include Sidekiq::Worker
  sidekiq_options queue: :client
  
  def perform(timestamp)
    Vote.expensive_call_in_client
    
    logger.info '--> Perform async call in Poll domain...'
    # response = HTTParty.post 'http://localhost:3001/votes', { body: { when: timestamp } }
    DomainVotesWorker.perform_async timestamp
  end
end
