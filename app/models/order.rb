class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :age, type: Integer
  field :gender, type: String
  field :target, type: String
  field :daily_cals, type: Integer
  field :daily_activity, type: String
  field :diet, type: String
  field :chef, type: Boolean
  field :supervised, type: Boolean

  has_one :kit, dependent: :nullify

  def self.order_params
    [:name, :age, :target, :daily_cals, :daily_activity, :diet, :chef, :supervised]
  end
end
