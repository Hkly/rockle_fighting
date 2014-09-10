# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  gold            :integer          default(100)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
end
