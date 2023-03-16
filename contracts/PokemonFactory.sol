// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract PokemonFactory {
    struct Hability {
        string name;
        string description;
    }

    struct PokemonType {
        string name;
        string description;
    }

    struct PokemonWeaknesses {
        string name;
        string description;
    }

    struct Pokemon {
        uint id;
        string name;
        uint[] habilitys;
        uint[] pokemonType;
        uint[] pokemonWeaknesses;
    }

    Pokemon[] private pokemons;
    Hability[] private habilitys;
    PokemonType[] private pokemontype;
    PokemonWeaknesses[] private pokemonweaknesses;

    mapping(uint => address) public pokemonToOwner;
    mapping(address => uint) ownerPokemonCount;

    mapping(uint => uint[]) pokemonHabilityIds;
    mapping(uint => Hability) public habilityById;

    mapping(uint => PokemonType) public pokemontypeById;
    mapping(uint => PokemonWeaknesses) public pokemonWeaknessesById;

    event eventNewPokemon(address sender, string message);

    function createPokemon(
        string memory _name,
        uint _id,
        uint[] memory _habilityIds,
        uint[] memory _pokemonType,
        uint[] memory _pokemonWeaknesses
    ) public {
        bytes memory namePokemon = bytes(_name);

        require(_id > 0, "Id is invalid, enter a valid id");
        require(
            namePokemon.length > 2,
            "The name must have more than two characters"
        );

        pokemons.push(
            Pokemon(_id, _name, _habilityIds, _pokemonType, _pokemonWeaknesses)
        );
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;

        emit eventNewPokemon(msg.sender, "new pokemon created successfully!");
    }

    function createHability(
        string memory _name,
        string memory _description,
        uint _id
    ) public {
        Hability memory newHability = Hability(_name, _description);
        habilitys.push(newHability);
        habilityById[_id] = newHability;
    }

    function createType(
        string memory _name,
        string memory _description,
        uint _id
    ) public {
        PokemonType memory newPokemonType = PokemonType(_name, _description);
        pokemontype.push(newPokemonType);
        pokemontypeById[_id] = newPokemonType;
    }

    function createWeaknesses(
        string memory _name,
        string memory _description,
        uint _id
    ) public {
        PokemonWeaknesses memory newWeak = PokemonWeaknesses(
            _name,
            _description
        );
        pokemonweaknesses.push(newWeak);
        pokemonWeaknessesById[_id] = newWeak;
    }

    function getAllPokemons() public view returns (Pokemon[] memory) {
        return pokemons;
    }

    function getAllHabilities() public view returns (Hability[] memory) {
        return habilitys;
    }

    function getAllTypes() public view returns (PokemonType[] memory) {
        return pokemontype;
    }

    function getAllWeaknesses()
        public
        view
        returns (PokemonWeaknesses[] memory)
    {
        return pokemonweaknesses;
    }

    function getResult() public pure returns (uint product, uint sum) {
        uint a = 1;
        uint b = 2;
        product = a * b;
        sum = a + b;
    }
}
