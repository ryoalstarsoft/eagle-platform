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

require 'rails_helper'

RSpec.describe Material, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
