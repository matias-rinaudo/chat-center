module Orders
  module Shipment
    class Organizer
      include Interactor::Organizer

      organize UpdateStatus, SendEmail
    end
  end
end
