#encoding: utf-8
FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :formulario do
    id 1
    user
    estado 2
  end

  factory :principal do
    provincia
    localidad
    grupo
    registro
    nombre "Los Chaquenos"
    formulario
  end

  factory :provincia do
    id 1
    detalle "Buenos Aires"
    region
  end

  factory :region do
    id 1
    detalle "Centro"
  end

  factory :localidad do
    id 1
    detalle "Capital Federal"
  end

  factory :grupo do
    id 1
    detalle "Grupo"
  end

  factory :condicion do
    codigo "ic2014"
    detalle "Espectáculo Integrante Catálogo 2014"
  end

  factory :registro do
    id 1
    detalle "Ya registrado"
  end

  factory :elenco_en_gira do
    id 1
    formulario
  end

  factory :datos_grupo do
    nombre_grupo     "Michael Hartl"
    historia    "asdadfasdfsdfsfdgfagafsdgafdgadfgdfagdafgdfagdfagafdgdfagdfgdfagadsfgdfagdfg"
    formulario
  end
end
