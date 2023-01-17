module Pnrs
  class CreatePnrService
    def initialize(flight)
      @flight = flight
    end

    def call
      pnrs = []
      # @type [AeroplaneClassSeat] class_seat_config
      @flight.aeroplane_class_seats.each do |class_seat_config|
        class_seats = class_seat_config.row_numbers * class_seat_config.row_seats
        class_seats.times.each do
          pnrs << { aeroplane_class_id: class_seat_config.aeroplane_class_id,
                    aeroplane_class_seat_id: class_seat_config.id,
                    pnr: 8.times.map { Random.rand(9) }.join }
        end
      end
      @flight.pnrs.insert_all pnrs
    end
  end
end
