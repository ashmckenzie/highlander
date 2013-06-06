module PayloadAdapters

  class PagerDutyAck < Base

    def user
      @user ||= Services::PagerDuty.find_by_email(email).try(:user)
    end

    def ack_id
      payload[:id]
    end

    def email
      payload[:agent][:email]
    end

  end

end
