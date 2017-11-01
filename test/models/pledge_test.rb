require_relative '../test_helper'

class PledgeTest < ActiveSupport::TestCase

  test 'A pledge can be created' do
    user = create(:user)
    project = create(:project)
    pledge = create(:pledge, project: project, user: user)
    assert pledge.valid?
    assert pledge.persisted?
  end

  test 'owner cannot back own project' do
    owner = create(:user)
    project = build(:project)
    project.user = owner
    project.save
    pledge = build(:pledge, project_id: project.id)
    pledge.user = owner
    pledge.save
    assert pledge.invalid?, 'Owner should not be able to pledge towards own project'
  end
end
