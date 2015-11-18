class Tupper
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :stl, type: String
  field :type, type: String

  belongs_to :kit
end
