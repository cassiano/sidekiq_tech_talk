class Vote
  def self.expensive_call_in_domain
    logger = Logger.new(STDOUT)
    logger.info '--> Executing expensive_call_in_domain...'

    sleep 0.5
  end
end
