module PrintableAttributes
  extend ActiveSupport::Concern
  included do
    class_attribute :printable_attribute_names

    def printable_attributes
      self.attributes.slice(*self.printable_attribute_names&.map(&:to_s))
    end
  end

  class_methods do
    def set_printable_attributes(*attrs)
      self.printable_attribute_names = attrs
    end
  end
end
