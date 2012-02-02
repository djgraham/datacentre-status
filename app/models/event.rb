class Event < ActiveRecord::Base
  belongs_to :status
  has_many :comments, :dependent => :destroy

  accepts_nested_attributes_for :comments

  validates_presence_of :title, :content, :status

  after_save :check_if_closed_status



  scope :all_open, where(:resolved_at => nil) 
  scope :all_resolved, where("resolved_at > 0")

  scope :recently_updated, :order => "updated_at desc"
  scope :recently_created, :order => "created_at desc"


  def active?
    scheduled_at < Time.now && !resolved?
  end

  def resolved?
    resolved_at?
  end

  def resolved_status
    resolved_at.nil? ?  "open" : "resolved at #{resolved_at.to_s}"
  end


  protected

  def  check_if_closed_status
    if status.resolved? && resolved_at.nil?
      update_attribute(:resolved_at, Time.now)
    end
  end

end
