class Status < ActiveRecord::Base
  attr_accessible :flex_project_code, :status_code, :message
  belongs_to :project
end
