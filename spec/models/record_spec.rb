require 'rails_helper'

RSpec.describe Record, type: :model do
  it 'name should be present' do
    user = User.new(email: 'user@email', password: '753951')
    group = Group.new(name: 'Some Group', icon: 'img_url', user:)
    record = Record.new(amount: 123.45, user:, group:)
    expect(record).to_not be_valid
  end

  it 'amount should be present' do
    user = User.new(email: 'user@email', password: '753951')
    group = Group.new(name: 'Some Group', icon: 'img_url', user:)
    record = Record.new(name: 'New Record', user:, group:)
    expect(record).to_not be_valid
  end

  it 'user should be present' do
    user = User.new(email: 'user@email', password: '753951')
    group = Group.new(name: 'Some Group', icon: 'img_url', user:)
    record = Record.new(name: 'New Record', amount: 123.45, group:)
    expect(record).to_not be_valid
  end

  it 'group should be present' do
    user = User.new(email: 'user@email', password: '753951')
    Group.new(name: 'Some Group', icon: 'img_url', user:)
    record = Record.new(name: 'New Record', amount: 123.45, user:)
    expect(record).to_not be_valid
  end

  it 'name, amount, user, group should be present' do
    user = User.new(email: 'user@email', password: '753951')
    group = Group.new(name: 'Some Group', icon: 'img_url', user:)
    record = Record.new(name: 'New Record', amount: 123.45, user:, group:)
    expect(record).to be_valid
  end
end
