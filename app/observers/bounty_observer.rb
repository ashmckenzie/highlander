class BountyObserver < ActiveRecord::Observer

  def after_save bounty
    if bounty.claimed?
      Event.create(metric: metric, user: bounty.claimed_by, value: bounty.reward, data: { tag: bounty.description })
    end
  end

  private

  def metric
    Metric.find_by_name('bounty')
  end
end
