class User < ApplicationRecord
    def self.find_or_create_from_auth_hash!(auth_hash)
        provider = auth_hash[:provider]
        uid = auth_hash[:uid]
        nickname = auth_hash[:info][:nickname]
        image_url = auth_hash[:info][:image]
    end
end
