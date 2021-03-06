
def pet_shop_name(petshop)
 return petshop[:name]
end

def total_cash(petshop)
  return petshop[:admin][:total_cash]
end

def add_or_remove_cash(petshop,amount)
  petshop[:admin][:total_cash] += amount
  return true
end

def pets_sold(petshop)
  return petshop[:admin][:pets_sold]
end

def increase_pets_sold(petshop,pets_sold_today)
  petshop[:admin][:pets_sold] += pets_sold_today
  return true
end

def stock_count(petshop)
  return petshop[:pets].length
end

def pets_by_breed(petshop,breed)
  petsbybreed = []
  counter = 0
  for pet in petshop[:pets]
    petsbybreed << petshop[:pets][counter][:breed] if petshop[:pets][counter][:breed] == breed
    counter += 1
  end
  return petsbybreed
end

def find_pet_by_name(petshop,name)
  counter = 0
  for pet in petshop[:pets]
    return pet if petshop[:pets][counter][:name] == name
    counter += 1
  end
  return nil
end

def remove_pet_by_name(petshop,name)
  counter = 0
  for pet in petshop[:pets]
    petshop[:pets].delete_at(counter) if petshop[:pets][counter][:name] == name
    counter += 1
  end
end

def add_pet_to_stock(petshop, newpet)
  petshop[:pets] << newpet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer,amount)
  customer[:cash] = customer[:cash] - amount
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer,newpet)
  customer[:pets] << newpet[:name]
  return true
end

# OPTIONAL

def customer_can_afford_pet(customer,newpet)
  return true if customer[:cash] >= newpet[:price]
  return false
end

def sell_pet_to_customer(petshop,pet,customer)
  if pet != nil
    if find_pet_by_name(petshop,pet[:name]) != nil
      if customer_can_afford_pet(customer,pet)
        remove_customer_cash(customer,pet[:price])
        add_or_remove_cash(petshop,pet[:price])
        remove_pet_by_name(petshop,pet[:name])
        add_pet_to_customer(customer,pet)
        increase_pets_sold(petshop,1)
      end
    end
  end
end 
