module PayloadAdapters

  class DishWash < Base

    def user
      @user ||= User.find payload[:user_id]
    end

  end

end
