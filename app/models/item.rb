# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Item < ActiveRecord::Base
  belongs_to :user

  validates :name, length: { minimum: 2 }, presence: true


  def days_left
    7 - (DateTime.now.to_date - created_at.to_date).to_i
  end
  
  default_scope { order(created_at: :asc) }
end
