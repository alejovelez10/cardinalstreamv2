module ApplicationHelper

def portal_background

    return Account.where(domain: request.subdomain).first.background_stream_url
    
end

end
