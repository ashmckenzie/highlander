module PayloadAdapters

  class PagerDutyAck < Base

    def user
      @user ||= User.point_earner.with_email(email)
    end

    def ack_id
      payload[:id]
    end

    def email
      payload[:agent][:email]
    end

  end

end
