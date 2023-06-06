class Role < ActiveRecord::Base
    has_many :auditions

    #  def auditions
    #     Audition.where(role_id: self.id)
    #  end

     def actors 
       

        auditions.map do |item|
           item.actor
        end
     
    end

    def locations
        auditions.map {|item| item.location}
    end

    def lead
    current = auditions.find_by(hired: true)
        if current == nil
            return "no actor has been hired for this role"
        else 
            current
        end
    end

    def understudy
        current = auditions.where(hired:true)
        current.second
    end

    # auditions.find_by(hired: true) || "no actor has been hired for this role"
end