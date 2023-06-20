# == Schema Information
#
# Table name: trucks
#
#  id                 :bigint(8)        not null, primary key
#  vendor_id          :integer
#  number             :string
#  is_owned           :boolean          default(FALSE)
#  last_maintained_on :date
#  maintenance_period :integer
#  owner_name         :string
#  is_active          :boolean          default(TRUE)
#  is_available       :boolean          default(TRUE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Truck < ApplicationRecord
  # ######################
  # CONSTANTS
  # ######################

  # ######################


  # ######################
  # SCOPES
  # ######################
  scope :is_private, -> { where(is_owned: true) }
  scope :is_indie, -> { where(is_owned: false) }
  scope :is_available, -> { where(is_available: true) }
  scope :is_active, -> { where(is_active: true) }
  scope :not_active, -> { where(is_active: false) }
  # ######################

  
  # ######################
  # SEARCH SCOPES
  # ######################

  # ######################


  # ######################
  # PLUGINS / MODULES
  # ######################

  # ######################


  # ######################
  # ASSOCIATIONS
  # ######################
  belongs_to :vendor
  # ######################


  # ######################
  # VALIDATIONS
  # ######################
  validates :number, presence: true, uniqueness: true
  # ######################


  # ######################
  # ENUMERATORS
  # ######################

  # ######################


  # ######################
  # CALLBACKS
  # ######################

  # ######################


  def next_maintenance_date
    last_maintained_on && maintenance_period && last_maintained_on+maintenance_period.months
  end

  def last_activity_date
    
  end

  def all_time_earnings
    rand(1000..20000)
  end
  
  private

end
