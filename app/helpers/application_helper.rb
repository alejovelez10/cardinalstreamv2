module ApplicationHelper

def portal_background

    return Account.where(domain: request.subdomain).first.background_stream_url
    
end

def get_account

    return Account.where(admin_user: current_user.admin_user).first.id
    
end

end
