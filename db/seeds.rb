# User.create!(email: 'joker@gmail.com', password: 'asdf1234', password_confirmation: 'asdf1234')
ct = Catalogue.create!(title: "This is test catalogue", description: "Description for catalogue")
EducationMaterial.create(catalogue_id: ct.id, title: "Test education material")
