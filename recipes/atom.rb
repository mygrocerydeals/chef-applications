include_recipe "homebrewalt::default"

homebrewalt_cask "atom"

if node["atom_packages"] and node["atom_packages"].kind_of?(Array)
    node["atom_packages"].each do |package|
        applications_atom_package package["name"]
    end
end
