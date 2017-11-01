require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test 'project_goal_amount_must_be_positive' do
    owner = create(:user)
    project = build(:project)
    project.user = owner
    project.goal = -500
    project.save
    refute project.valid?
    refute project.persisted?
  end

  test "project start_date must be in future" do
    owner = create(:user)
    project = build(:project)
    project.start_date = Date.today.prev_day
    project.user = owner
    project.save
    assert project.invalid?
  end

  test "project_end_date must later than start_date" do
    owner = create(:user)
    project = build(:project)
    project.user = owner
    project.end_date = Date.today.prev_day
    project.save
    assert project.invalid?
  end


  test 'valid project can be created' do
    owner = create(:user)
    project = build(:project)
    project.user = owner
    project.save
    assert project.valid?
    assert project.persisted?
    assert project.user
  end

  test 'project is invalid without owner' do
    project = build(:project)
    project.user_id = nil
    project.save
    assert project.invalid?
  end

end
