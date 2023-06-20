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

require 'rails_helper'

RSpec.describe Truck, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
