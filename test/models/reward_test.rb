require 'test_helper'

class RewardTest < ActiveSupport::TestCase

  test 'reward dollar amount must be positive number' do
    project = create(:project)
    reward = build(:reward, dollar_amount: -350, project: project)
    refute reward.valid?
    refute reward.persisted?
  end

  test 'A reward can be created' do
    project = create(:project)
    reward = create(:reward, dollar_amount: 99.00, project: project)
    assert reward.valid?
    assert reward.persisted?
  end

  test 'A reward cannot be created without a dollar amount' do
    project = create(:project)
    reward = build(:reward, dollar_amount: nil, project: project)
    assert reward.invalid?, 'Reward should be invalid without dollar amount'
    assert reward.new_record?, 'Reward should not save without dollar amount'
  end

  test 'A reward cannot be created without a description' do
    project = create(:project)
    reward = build(:reward, description: nil, project: project)
    assert reward.invalid?, 'Reward should be invalid without a description'
    assert reward.new_record?, 'Reward should not save without a description'
  end

end
