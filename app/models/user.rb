# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
#kell egy get/setter a passwordre
#magat a pw nem mentjuk hanem a pw + confimationbol ami kijon
#nev alapjan talalja meg a confirmation h egyenlo a pw vel
# a passwordot ugy validalja h egyezik e e confirmationnal h veszi a password ot majd alahuzas confirmation
#
# ez mar a has_sec_pw api miatt nem kell, sot osszeakad
#  attr_accessor :password
  attr_accessible :email, :name, :password, :password_confirmation
	has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50}

  validates :email, 
					presence: true,
					format:{ with: VALID_EMAIL_REGEX},
					uniqueness: {case_sensitive: false}

#nev alapjan torteno egyezes
	validates :password, 
					confirmation: true,
					presence: true,
					length: { minimum: 6}

  validates :password_confirmation, presence: true 


  before_save { |user| user.email = email.downcase }

end
