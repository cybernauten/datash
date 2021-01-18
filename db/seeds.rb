Document.delete_all
Project.delete_all
Team.delete_all
User.delete_all


user_one = User.create!(email: 'soph2@example.com', user_name:'sophia', display_name: 'soph', password: '123456', avatar_url: "https://avatars0.githubusercontent.com/u/70213059?v=4.jpg")

user_two = User.create!(email: 'anna2@example.com', user_name:'anna-maria', display_name: 'anna', password: '123456', avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1601933188/aowdwrdop6xuksfrwhus.jpg" )

user_three = User.create!(email: 'ilies2@example.com', user_name:'ilies', display_name: 'ilies', password: '123456', avatar_url: "https://avatars0.githubusercontent.com/u/68535384?v=4.jpg")

team_one = Team.create!(team_name:'team_one', description: 'hjdksabhdfjkbhjkbhdjs', avatar_url: "https://avatars0.githubusercontent.com/u/68535384?v=4.jpg")

team_two = Team.create!(team_name:'team_two', description: 'DSBAJBDFJSLBDSHJA', avatar_url: "https://avatars0.githubusercontent.com/u/68535384?v=4.jpg")

team_three = Team.create!(team_name:'team_three', description: 'il213543265436T54ies', avatar_url: "https://avatars0.githubusercontent.com/u/68535384?v=4.jpg" )

project_one = Project.create!(project_name:'project_one', description: 'hjdksabhdfjkbhjkbhdjs', creation_date: 'date')

project_two = Project.create!(project_name:'project_two', description: 'DSBAJBDFJSLBDSHJA', creation_date: 'date')

project_three = Project.create!(project_name:'project_three', description: 'il213543265436T54ies', creation_date: 'date')

document_one = Document.create!(project_id: 1, user_id: 1, file_name:'document_one', file_type: '.pdf', creation_date: "date", file_size: 'size')

document_two = Document.create!(project_id: 2, user_id: 2, file_name:'document_two', file_type: '.pdf', creation_date: "date", file_size: 'size')

document_three = Document.create!(project_id: 2, user_id: 3, file_name:'document_three', file_type: '.pdf', creation_date: "date", file_size: 'size')

