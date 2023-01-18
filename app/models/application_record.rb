class ApplicationRecord < ActiveRecord::Base
  include PrintableAttributes

  primary_abstract_class
end
