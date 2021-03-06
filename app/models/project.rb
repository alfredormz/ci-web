class Project < ActiveRecord::Base
  belongs_to :minute
  set_table_name 'Project'
  
  has_many :project_elements
  
  has_and_belongs_to_many :votes, :foreign_key => 'Project_id', :join_table => 'Project_Vote', :association_foreign_key => 'voters_id'  

  def to_param
    if self.title
      "#{id}-#{self.title.gsub(/[^a-z0-9]+/i, '-')}"      
    else
      id
    end
  end
  
  def summary_link
    java_net_url_string = self.summary.to_s
    
    debugger
    if /numexp=(.*)q/ =~ java_net_url_string
      $1
    else
      "#"
    end
  end
end