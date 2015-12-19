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

  has_and_belongs_to_many :crockery_kits, class_name: 'Kit', inverse_of: :crockeries
  has_and_belongs_to_many :utensil_kits, class_name: 'Kit', inverse_of: :utensils
  has_and_belongs_to_many :happy_kits, class_name: 'Kit', inverse_of: :happys

  validates :name, presence: true

  def self.permitted_params
    [:name, :stl, :type]
  end

  def set_content_type
    self.stl.instance_write(:content_type, 'application/vnd.ms-pki.stl')
  end
end
