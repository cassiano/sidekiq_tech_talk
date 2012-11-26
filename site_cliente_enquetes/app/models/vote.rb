class Vote
  def self.expensive_call_in_client
    logger = Logger.new(STDOUT)
    logger.info '--> Executing expensive_call_in_client...'

    sleep 0.250
  end
end
