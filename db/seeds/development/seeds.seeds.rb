users = [
  { name: 'Owner Doe', email: 'owner@gmail.com', password: '12345678', password_confirmation: '12345678', owner_enabled: true },
  { name: 'Student Doe', email: 'student@gmail.com', password: '12345678', password_confirmation: '12345678', owner_enabled: false }
]
User.create!(users)



bogota = City.find_by(name: "Bogotá")
lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
residences = [
  { latitude: 4.6271056, longitude: -74.0785303, city: bogota, name: "Test residence 1", address: "Carrera 25 #37-33", price: 600_000, square_meters: 10, description: lorem_ipsum, rooms: 27, user: User.first },
  { latitude: 4.6304182, longitude: -74.0667035, city: bogota, name: "Test residence 2", address: "Carrera 7 # 43-27", price: 1_500_000, square_meters: 15, description: lorem_ipsum, rooms: 87, user: User.first },
  { latitude: 4.6345981, longitude: -74.0656789, city: bogota, name: "Test residence 3", address: "Calle 48 #6-40", price: 1_300_000, square_meters: 12, description: lorem_ipsum, rooms: 20, user: User.first },
  { latitude: 4.6431502, longitude: -74.0629527, city: bogota, name: "Test residence 4", address: "Carrera 5 #58-19", price: 1_000_000, square_meters: 13, description: lorem_ipsum, rooms: 20, user: User.first },
  { latitude: 4.6468791, longitude: -74.0758454, city: bogota, name: "Test residence 5", address: "Transversal 25 #60-54", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first },
  { latitude: 4.6281402, longitude: -74.0800102, city: bogota, name: "Test residence 6", address: "Cra. 28 #39-27", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first },
  { latitude: 4.596766, longitude: -74.0753341, city: bogota, name: "Test residence 7", address: "Calle 11 # 4-41", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first },
  { latitude: 4.6019973, longitude: -74.0743017, city: bogota, name: "Test residence 8", address: "Cra. 6 #15-88", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first },
  { latitude: 4.6154977, longitude: -74.0704757, city: bogota, name: "Test residence 9", address: "Ak. 7 #28", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first },
  { latitude: 4.6104456, longitude: -74.0714412, city: bogota, name: "Test residence 10", address: "Cl. 24 #6A-06", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first },
  { latitude: 4.5998633, longitude: -74.0680067, city: bogota, name: "Test residence 11", address: "Calle 18 # 1-05 E", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first },
  { latitude: 4.6088434, longitude: -74.0730985, city: bogota, name: "Test residence 12", address: "Ak. 7 #22-47", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first },
  { latitude: 4.5920315, longitude: -74.0725718, city: bogota, name: "Test residence 13", address: "Cl. 10 #0-25E", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first },
  { latitude: 4.6013004, longitude: -74.0701345, city: bogota, name: "Test residence 14", address: "Calle 17 Nro. 3 - 40", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first },
  { latitude: 4.5938365, longitude: -74.0772745, city: bogota, name: "Test residence 16", address: "Calle 10 # 5-32", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first },
  { latitude: 4.5981356, longitude: -74.0760085, city: bogota, name: "Test residence 17", address: "Cra. 5 #12B-46", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first },
  { latitude: 4.6305624, longitude: -74.0686448, city: bogota, name: "Test residence 18", address: "Cra. 13 #45-19", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first },
  { latitude: 4.6273873, longitude: -74.0954358, city: bogota, name: "Test residence 20", address: "Cl. 24a #44A-57", price: 750_000, square_meters: 13, description: lorem_ipsum, rooms: 17, user: User.first },
  { latitude: 4.6671381, longitude: -74.0479949, city: bogota, name: "Test residence 21", address: "Carrera 7 #86-50", price: 760_000, square_meters: 9, description: lorem_ipsum, rooms: 12, user: User.first }
]
Residence.create!(residences)

for i in 1..residences.count do
  Picture.create!({ 
    remote_picture_url: "https://campus-house-development.s3.amazonaws.com/residence_pictures/545ace7b-a7d8-4de0-a280-f40fd8132728.jpg",
    residence: Residence.find(i)
  })
end
