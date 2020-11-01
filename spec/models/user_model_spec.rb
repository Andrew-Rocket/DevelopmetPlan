# frozen_string_literal: true

require 'spec_helper'

describe User, 'validation' do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
end

describe User, 'association' do
  it { should have_many(:task_states) }
end

describe User, 'column_specification' do
  it { should have_db_column(:first_name).of_type(:string).with_options(presence: true) }
  it { should have_db_column(:last_name).of_type(:string).with_options(presence: true) }
  it { should have_db_column(:role).of_type(:integer).with_options(null: false) }
  it { should have_db_column(:level).of_type(:integer).with_options(null: false) }
end
