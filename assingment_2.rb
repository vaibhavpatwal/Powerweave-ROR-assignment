class User < ActiveRecord::Base

    def active?
        status == "active"
    end

    def inactive?
        status == "inactive"
    end

    def pending?
        status == "pending"
    end

end
