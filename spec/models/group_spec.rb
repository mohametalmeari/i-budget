require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'name should be present' do
    user = User.new(email: 'user@email', password: '753951')
    group = Group.new(icon: 'img_url', user:)
    expect(group).to_not be_valid
  end

  it 'icon should be present' do
    user = User.new(email: 'user@email', password: '753951')
    group = Group.new(name: 'New Group', user:)
    expect(group).to_not be_valid
  end

  it 'user should be present' do
    group = Group.new(name: 'New Group', icon: 'img_url')
    expect(group).to_not be_valid
  end

  it 'name, icon, user should be present' do
    user = User.new(email: 'user@email', password: '753951')
    group = Group.new(name: 'New Group', icon: 'img_url', user:)
    expect(group).to be_valid
  end
end
