module Service
  class Deliver
    def sms(recipient)
      puts "delivering sms to #{recipient}"
    end

    def email(recipient)
      puts "delivering email to #{recipient}"
    end
  end
end
