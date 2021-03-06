require 'spec_helper'
require 'redmine_limited_visibility/queries_helper_patch'

describe QueriesHelper, type: :helper do

  let(:contractor_role) { Function.where(name: "Contractors").first_or_create }
  let(:project_office_role) { Function.where(name: "Project Office").first_or_create }

  describe 'column_value' do
    it "should return a String with function's names" do
      value = column_value(QueryColumn.new(:authorized_viewers), nil, "|#{contractor_role.id}|#{project_office_role.id}|")
      expect(value).to be_a_kind_of String
      expect(value).to include "#{contractor_role.name}, #{project_office_role.name}"
    end
  end
end
