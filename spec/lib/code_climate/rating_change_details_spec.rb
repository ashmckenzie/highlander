require 'spec_helper'

module CodeClimate

  describe RatingChangeDetails do

    subject { RatingChangeDetails.new(entry_title) }

    context 'when the class improved from a C to a A' do
      let(:entry_title) { 'OfferDetails has improved from a C to a A.' }

      its(:improvement?) { should be_true }
      its(:old_rating)   { should == 'C' }
      its(:new_rating)   { should == 'A' }
      its(:rating_jump)  { should == 2 }
    end

    context 'when the class declined from a C to a D' do
      let(:entry_title) { 'Inventory::Pegasus::Api has declined from a C to a D.' }

      its(:improvement?) { should be_false }
      its(:old_rating)   { should == 'C' }
      its(:new_rating)   { should == 'D' }
      its(:rating_jump)  { should == 1 }
    end

  end

end
