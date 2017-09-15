class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
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
