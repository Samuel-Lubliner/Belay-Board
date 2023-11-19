# == Schema Information
#
# Table name: guests
#
#  id              :bigint           not null, primary key
#  status          :string           default("pending")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  availability_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_guests_on_availability_id              (availability_id)
#  index_guests_on_user_id                      (user_id)
#  index_guests_on_user_id_and_availability_id  (user_id,availability_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (availability_id => availabilities.id)
#  fk_rails_...  (user_id => users.id)
#
class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :availability

  enum status: { pending: 'pending', accepted: 'accepted', rejected: 'rejected' }

  validates :user_id, uniqueness: { scope: :availability_id, 
                                    message: 'already a guest' }
end
