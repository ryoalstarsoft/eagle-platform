# == Schema Information
#
# Table name: materials
#
#  id               :bigint(8)        not null, primary key
#  supplier_id      :integer
#  cost_ton         :decimal(8, 2)
#  is_active        :boolean          default(TRUE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  material_type_id :integer
#  cost_load        :decimal(8, 2)
#  cost_yard        :decimal(8, 2)
#

class Material < ApplicationRecord
  # ######################
  # CONSTANTS
  # ######################

  # ######################


  # ######################
  # SCOPES
  # ######################
  scope :is_active, -> { where(is_active: true) }
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
  belongs_to :supplier
  belongs_to :material_type
  delegate :name, to: :material_type
  has_one :vendor, through: :supplier
  # ######################


  # ######################
  # VALIDATIONS
  # ######################
  validate :cost_present
  # ######################


  # ######################
  # ENUMERATORS
  # ######################

  # ######################


  # ######################
  # CALLBACKS
  # ######################

  # ######################


  private

  def cost_present
    if cost_ton.blank? && cost_yard.blank? && cost_load.blank?
      errors.add :base, "Cost per Ton, Cost per Yard or Cost per Load must be present."
    end
  end
  
end
