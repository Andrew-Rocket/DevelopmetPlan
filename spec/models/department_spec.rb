# frozen_string_literal: true

require 'rails_helper'

describe Department, 'association' do
  it { should have_many(:users) }
  it { should have_many(:plans) }
end

describe Department, 'column_specification' do
  it { should have_db_column(:title).of_type(:string) }
end

describe Department, '.search_by_name' do
  before(:each) do
    FactoryBot.create(:department, title: 'Ruby on Rails')
  end

  it 'returns Department that match with title' do
    Department.search_by_title('Ruby on Rails').count.should eql 1
  end

  it 'returns Department that like title' do
    Department.search_by_title('ruby on rails').count.should eql 0
  end

  it 'returns Department when title is blank' do
    Department.search_by_title('').count.should eql 1
  end

  it 'returns empty when title is not match' do
    Department.search_by_title('not match').count.should eql 0
  end
end
