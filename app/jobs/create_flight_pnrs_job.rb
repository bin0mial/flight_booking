class CreateFlightPnrsJob < ApplicationJob
  queue_as :default

  def perform(flight)
    ::Pnrs::CreatePnrService.new(flight).call
  end
end
