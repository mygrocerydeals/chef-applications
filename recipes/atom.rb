include_recipe "homebrewalt::default"

homebrewalt_cask "atom"

node["atom_packages"].each do |package|
    applications_atom_package package["name"]
end
