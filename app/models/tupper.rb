class Tupper
  include Mongoid::Document
  include Mongoid::Timestamps

  include Mongoid::Paperclip

  field :name, type: String
  field :type, type: String

  has_mongoid_attached_file :stl, validate_media_type: false,
                            :path => "public/system/:class/:filename",
                            :url => "/system/:class/:basename.:extension"
  do_not_validate_attachment_file_type :stl
  before_post_process :set_content_type




  has_and_belongs_to_many :breakfast_kits, class_name: 'Kit', inverse_of: :breakfasts
  has_and_belongs_to_many :lunch_kits, class_name: 'Kit', inverse_of: :lunchs
  has_and_belongs_to_many :dinner_kits, class_name: 'Kit', inverse_of: :dinners

  def self.permitted_params
    [:name, :stl, :type]
  end

  def set_content_type
    self.stl.instance_write(:content_type, 'application/vnd.ms-pki.stl')
  end
end
