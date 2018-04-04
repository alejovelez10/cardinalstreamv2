# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  names                  :string
#  last_names             :string
#  account_domain         :string
#  super_admin            :boolean
#  count                  :integer
#  avatar                 :string
#  rol_id                 :integer
#  state                  :boolean
#  is_account             :boolean
#  admin_user             :integer
#  group_id               :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :rol , optional: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :crear_admin



        def crear_admin

            if self.is_account
              self.admin_user = self.id
              self.count = 1
              Account.create(domain: self.account_domain, admin_user: self.id, user_id: self.id)
              
                
            end  
              
        end       
end
