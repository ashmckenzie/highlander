class UserObserver < ActiveRecord::Observer

  def after_save(user)
    update_slug(user)
  end

  private

  def update_slug(user)
    user.update(slug: user.name.parameterize) unless user.slug == user.name.parameterize
  end

end
