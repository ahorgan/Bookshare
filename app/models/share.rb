class Share < ActiveRecord::Base
  belongs_to :book

  belongs_to :share_from,
  				foreign_key: :from_user_id,
  				class_name: "User"
  belongs_to :share_to,
  				foreign_key: :to_user_id,
  				class_name: "User"
end
