def find_kevin_bacon(starting_actor)
  result_array = []
  number_of_films = 0

  if starting_actor.name == "Kevin Bacon"
    return result_array
  end

  starting_actor.film_actor_hash.each do |film|
    if starting_actor.film_actor_hash[film].any? { |actor| actor == Kevin_Bacon }
      result_array << film
      find_kevin_bacon(Kevin_Bacon)
    else
      unless number_of_films > 6
        starting_actor.film_actor_hash[film].each do |actor|
          number_of_films += 1
          result_array << film
          find_kevin_bacon(actor)
        end
      else
        result_array = []
        number_of_films = 0
      end
    end
  end
end
