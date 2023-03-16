const {expect} = require("chai");

describe("Pokemon Contract", function (){
  it("Pokemon Factory count 2 pokemons ", async function() {
    const PokemonFactory = await ethers.getContractFactory("PokemonFactory");
    const hardhatPokemon = await PokemonFactory.deploy();

    await hardhatPokemon.createHability("Aprender", "Nunca para de aprender",2);
    await hardhatPokemon.createPokemon( "platziChu", 2, [23], [23,12], [11,7]);
    await hardhatPokemon.createPokemon( "Fredyzar", 7, [5], [55], [1, 2,3]);

    const pokemons = await hardhatPokemon.getAllPokemons();
    const habilitys = await hardhatPokemon.getAllHabilities();
    console.log(pokemons);
    console.log(habilitys);
    /* expect(pokemons.length).to.equal(0); */
    expect(pokemons.length).to.equal(2) ;
  });

})