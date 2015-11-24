class Color
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :rgb_profile, type: String
  field :intensity, type: Float

  def self.permitted_params
    [:name, :rgb_profile, :intensity]
  end
end
