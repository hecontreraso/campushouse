universities = [
  { name: 'Universidad Nacional', address: 'Carrera 30 #45-05' },
  { name: 'Universidad de los Andes', address: 'Cra 1 #18A-12' },
  { name: 'Universidad Javeriana', address: 'Carrera 7 #40-62' },
  { name: 'Universidad Libre', address: 'Calle 8a #5-80' },
  { name: 'Escuela Colombiana de Ingeniería Julio Garavito', address: 'Carrera 45 #205-59' },
  { name: 'Universidad Sergio Arboleda', address: 'Calle 74 #14-14' },
  { name: 'Universidad Jorge Tadeo Lozano', address: 'Carrera 4 #22-61' },
  { name: 'Fundación Universidad de América', address: 'Avenida Circunvalar #20-53' },
  { name: 'Universidad Santo Tomás', address: 'Carrera 9 #51 - 11' },
  { name: 'Universidad Manuela Beltrán', address: 'Avenida Circunvalar #60-00' },
  { name: 'Universidad Distrital Francisco José de Caldas', address: 'Carrera 7 #40B - 53' },
  { name: 'Universidad de la Salle Norte', address: 'Carrera 7 #172-85' },
  { name: 'Universidad de la Salle Centro', address: 'Carrera 2 #10-70' },
  { name: 'Universidad de la Salle Chapinero', address: 'Cra. 5 #59A-44' },
  { name: 'Universidad Central Centro', address: 'Calle 21 #4-40' },
  { name: 'Universidad Central Norte', address: 'calle 75 #16-03' },
  { name: 'Universidad del Rosario', address: 'Calle 12C #6-25' },
  { name: 'Universidad Católica de Colombia', address: 'Avenida Caracas #46 -72' },
  { name: 'Universidad El Bosque', address: 'Avenida Carrera 9 #131 A-02' },
  { name: 'Fundación Universitaria Los Libertadores', address: 'Carrera 16 #63 A-68' },
  { name: 'Universidad Distrital Francisco José de Caldas', address: 'Carrera 7 #40B - 53'},
  { name: 'Universidad Externado', address: 'Calle 12 #1-17 Este'},
  { name: 'Universidad Militar Nueva Granada', address: 'Carrera 11 #101-80 '},
  { name: 'Fundación Universitaria Konrad Lorenz', address: 'Carrera 9 Bis #62-43'},
  { name: 'Universidad Piloto de Colombia', address: 'Carrera 9 #45A-44'},
  { name: 'Universidad Incca de Colombia', address: 'Carrera 13 #24-15 '},
  { name: 'Universidad Autónoma de Colombia', address: 'Calle 12B #4-31'},
  { name: 'Universidad Pedagógica Nacional', address: 'Calle 72 #11-86'},
  { name: 'Fundación Universitaria San Martín', address: 'Carrera 18#80-45'},
  { name: 'Colegio de Estudios Superiores de Administración', address: 'Cra. 6 #34-51'},
  { name: 'Universidad San Buenaventura', address: 'Carrera 8H #172-20'}
]
University.create!(universities)

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

pictures = [
  { remote_picture_url: "http://www.cuposuniversitarios-premier.com/10.jpg", residence: Residence.first },
  { remote_picture_url: "http://www.cuposuniversitarios-premier.com/12.jpg", residence: Residence.first },
  { remote_picture_url: "http://www.cuposuniversitarios-premier.com/5.jpg", residence: Residence.first }
]
Picture.create!(pictures)
