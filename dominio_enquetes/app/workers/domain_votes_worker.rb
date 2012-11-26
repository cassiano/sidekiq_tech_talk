class DomainVotesWorker
  include Sidekiq::Worker
  sidekiq_options queue: :domain
  
  def perform(timestamp)
    logger.info "--> [Poll domain] Creating vote with timestamp #{timestamp}..."
    
    Vote.expensive_call_in_domain
  end
end
