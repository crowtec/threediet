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

  field :status, type: String, default: 'Pending'

  has_one :kit, dependent: :nullify

  def self.order_params
    [:name, :age, :target, :daily_cals, :daily_activity, :diet, :chef, :supervised]
  end

  def self.statuses
    %w(Incomplete
    Pending
    Processed
    Shipping
    Shipped
    Returned
    Canceled)
  end
end
