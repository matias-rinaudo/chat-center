module Fedex
  class ShipmentNotFound < StandardError; end

  class Shipment
    attr_accessor :status, :id

    @@all = []
    @@next_id = 0

    STATUS = [
      'awaiting_pickup',
      'in_transit',
      'out_for_delivery',
      'delivered'
    ].freeze

    def initialize()
      @@all << self
    end

    def self.find(fedex_id)
      byebug
      shipments = Fedex::Shipment.all
      shipment = shipments.select{|shipment| shipment.id == fedex_id}.last

      raise ShipmentNotFound, "Shipment not found: #{fedex_id}" unless shipment.present?

      shipment.status = STATUS.shuffle.first

      shipment
    end

    def self.all
      @@all
    end

    def create
      self.status = 'awaiting_pickup'
      self.id = (@@next_id += 1)

      self
    end
  end
end
