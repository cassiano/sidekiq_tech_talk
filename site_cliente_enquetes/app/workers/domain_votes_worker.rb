class DomainVotesWorker
  include Sidekiq::Worker
  sidekiq_options queue: :domain
end
