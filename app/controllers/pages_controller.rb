require 'json'
require 'open-uri'

class PagesController < ApplicationController

  def show
  end

  def api

    #num pokemon a comparer
    num_pokemon1 = params[:id1]
    num_pokemon2 = params[:id2]

    #CALL API WITH POKEMON INFO
    url_pokemon1 = "http://pokeapi.co/api/v2/pokemon/#{num_pokemon1}/"
    pokemon_serialized = open(url_pokemon1).read
    pokemon1 = JSON.parse(pokemon_serialized)
    weight_pokemon1 = pokemon1['weight']
    puts weight_pokemon1

    url_pokemon2 = "http://pokeapi.co/api/v2/pokemon/#{num_pokemon2}/"
    pokemon_serialized = open(url_pokemon2).read
    pokemon2 = JSON.parse(pokemon_serialized)
    weight_pokemon2 = pokemon2['weight']

    difference = 0
    winner = 0
    if weight_pokemon1 > weight_pokemon2
      winner = num_pokemon1
      difference = weight_pokemon1 - weight_pokemon2
    elsif weight_pokemon2 > weight_pokemon1
      winner = num_pokemon2
      difference = weight_pokemon2 - weight_pokemon1
    else
      difference = 0
      winner = 0
    end

    #renvoie le vainqueur
    render json: { Winner: winner,
                   Difference: difference
                  }
  end
end

