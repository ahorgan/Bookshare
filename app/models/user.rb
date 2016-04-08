class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :set_codename

  has_many :outgoing_shares,
  				foreign_key: :from_user_id,
  				class_name: "Share"

  has_many :incoming_shares,
  				foreign_key: :to_user_id,
  				class_name: "Share"

  private
  	def set_codename
  		load "#{Rails.root}/db/adjectives.rb"
  		load "#{Rails.root}/db/animals.rb"
  		self.codename = $adjectives.sample + ' ' + $animals.sample
  		self.save
  	end
end
