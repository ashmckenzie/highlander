module DataMigration
  module MigrationFiles
    class OfficeMoveBounties < Base

      def up
        sarah = User.with_email('sarah@hooroo.com')

        bounties = [
          [ 'Label chairs needing repair - by Friday 14th', 10 ],
          [ 'Pack up delivery wall so it can be unpacked easily - by Friday 14th', 10 ],
          [ 'Pack up sunny room - by Thursday 13th', 20 ],
          [ 'Pack kitchen goods (wii, soda stream) - by Friday 14th', 10 ],
          [ 'Pack up stationery (return excess stationery from desks, pack up -> delivery to stationery cupboard) - by Friday 14th', 50 ],
          [ 'Clean out fridge, organise - by Friday 14th', 50 ],
          [ 'Clean out mens change room - by Friday 14th', 50 ],
          [ 'Pack up board room - by Friday 14th', 20 ],
          [ 'Pack up ping pong table - by Thursday 13th', 10 ],
          [ 'Pack up testing station and label - by Thursday 13th', 10 ],
          [ 'Pack up projectors and speaker phone - by Thursday 13th', 20 ],
          [ 'Label plants - by Friday 14th', 10 ],
          [ 'Pack up small meeting room - by Friday 14th', 20 ],
          [ 'Label coat racks - by Friday 14th', 5 ],
          [ 'Clean out delivery cupboards - by Friday 14th', 20 ],
          [ 'Clean out kitchen cupboards (food, etc) - by Friday 14th', 20 ],
          [ 'Pack up unused computer gear - by Friday 14th', 50 ],
          [ 'Pack up marketing items - by Friday 14th', 50 ],
          [ 'Marketing wall pack up - by Friday 14th', 10 ],
          [ 'Contact all providers with new IP addresses - by Friday 14th', 5 ]
        ]

        bounties.each do |b|
          description, reward = b
          bounty = Bounty.new(name: "Office move - #{description}", description: description, reward: reward, created_by_id: sarah.id)
          bounty.save(validate: false)
        end
      end

      def down
      end
    end
  end
end
