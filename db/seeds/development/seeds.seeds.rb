users = [
  { name: 'Owner Doe', email: 'owner@gmail.com', password: '12345678', password_confirmation: '12345678', owner_enabled: true },
  { name: 'Student Doe', email: 'student@gmail.com', password: '12345678', password_confirmation: '12345678', owner_enabled: false }
]
User.create!(users)

lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
residences = [
  { name: "Cupos universitarios premier", address: "Carrera #25 37-33", price: 600_000, square_meters: 10, description: lorem_ipsum, rooms: 27, user: User.first },
  { name: "Esstudia", address: "Carrera 7 # 43-27", price: 1_500_000, square_meters: 15, description: lorem_ipsum, rooms: 87, user: User.first },
  { name: "Casa loma", address: "Calle 48 #6-40", price: 1_300_000, square_meters: 12, description: lorem_ipsum, rooms: 20, user: User.first },
  { name: "Dormitorios loft", address: "Carrera 5 #58-19", price: 1_000_000, square_meters: 13, description: lorem_ipsum, rooms: 20, user: User.first },
  { name: "La casona", address: "Transversal 25 #60-54", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first }
]
Residence.create!(residences)

for i in 1..residences.count do
  Picture.create!({ 
    remote_picture_url: "https://campus-house-development.s3.amazonaws.com/residence_pictures/545ace7b-a7d8-4de0-a280-f40fd8132728.jpg",
    residence: Residence.find(i)
  })
end
