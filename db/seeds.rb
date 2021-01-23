Document.delete_all
Project.delete_all
Team.delete_all
User.delete_all

user_one = User.create!(email: 'soph2@example.com', user_name:'sophia', display_name: 'soph', password: '123456', avatar_url: "https://avatars0.githubusercontent.com/u/70213059?v=4.jpg")
team_one = Team.create!(team_name:'team_one', description: 'marketing team', avatar_url: "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTN8fHRlYW18ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60")
project_one = Project.create!(project_name:'project_one', description: 'campaigning project', creation_date: 'date')
document_one = Document.create!(file_name:'document_one', file_type: '.pdf', creation_date: "date", file_size: '30', project: project_one, user: user_one)
linked_connection_one = LinkedConnection.create(user_id: user_one.id, team_id: team_one.id)

user_two = User.create!(email: 'anna2@example.com', user_name:'anna-maria', display_name: 'anna', password: '123456', avatar_url: "https://avatars.githubusercontent.com/u/71718597?s=400&u=5b0bc18350d47b6266234a829a1e83159042d7a6&v=4" )
team_two = Team.create!(team_name:'team_two', description: 'HR team for recruiting', avatar_url: "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTl8fHRlYW18ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60")
project_two = Project.create!(project_name:'project_two', description: 'potential employees', creation_date: 'date')
document_two = Document.create!(file_name:'document_two', file_type: '.pdf', creation_date: "date", file_size: '30', project: project_two, user: user_two)
linked_connection_two = LinkedConnection.create!(user_id: user_two.id, team_id: team_two.id)

user_three = User.create!(email: 'ilies2@example.com', user_name:'ilies', display_name: 'ilies', password: '123456', avatar_url: "https://images.unsplash.com/photo-1571249104671-f5537fb3e137?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjV8fGF2YXRhcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60")
team_three = Team.create!(team_name:'team_three', description: 'finance department', avatar_url: "https://images.unsplash.com/photo-1475506631979-72412c606f4d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzF8fHRlYW18ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60" )
project_three = Project.create!(project_name:'project_three', description: 'finances 101', creation_date: 'date')
document_three = Document.create!(file_name:'document_three', file_type: '.pdf', creation_date: "date", file_size: '30', project: project_three, user: user_three)
linked_connection_three = LinkedConnection.create!(user_id: user_three.id, team_id: team_three.id)

assignment_one = Assignment.create(user_id: user_three.id, project_id: project_two.id)