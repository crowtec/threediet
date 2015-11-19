class Tupper
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :stl, type: String
  field :type, type: String

  belongs_to :kit

  def self.tupper_params
    [:name, :stl, :type]
  end
end
