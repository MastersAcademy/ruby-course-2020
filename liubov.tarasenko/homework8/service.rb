module Service
  class Deliver
    def sms(recepient)
      p "delivering sms to #{recepient}"
    end

    def email(recepient)
      p "delivering email to #{recepient}"
    end
  end
end
