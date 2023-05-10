import sqlite3
import sys
import xml.etree.ElementTree as ET

if len(sys.argv) < 2:
    print("You must pass at least one XML file name containing Pokemon to insert")
    sys.exit(1)

for i, arg in enumerate(sys.argv):
    if i == 0:
        continue

    xml_file = arg

    conn = sqlite3.connect("pokemon.sqlite")
    cursor = conn.cursor()
    tree = ET.parse(xml_file)
    root = tree.getroot()

    for pokemon_elem in root.findall("pokemon"):
        name = pokemon_elem.find("name").text
        pokedex_number = pokemon_elem.get("pokedexNumber")
        generation = pokemon_elem.get("generation")
        hp = pokemon_elem.find("hp").text
        attack = pokemon_elem.find("attack").text
        defense = pokemon_elem.find("defense").text
        speed = pokemon_elem.find("speed").text
        sp_attack = pokemon_elem.find("sp_attack").text
        sp_defense = pokemon_elem.find("sp_defense").text
        height_m = pokemon_elem.find("height").text
        weight_kg = pokemon_elem.find("weight").text

    for pokemon_elem in root.findall("pokemon_types_view"):
        type1name = pokemon_elem.find("type").text
        type2name = pokemon_elem.find("type2").text

    for pokemon_elem in root.findall("classification"):
        classification = pokemon_elem.get("classification")

        try:
            cursor.execute("INSERT INTO pokemon (name, pokedex_number, generation, hp, attack, defense, speed, sp_attack, sp_defense, height_m, weight_kg) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                           (name, pokedex_number, generation, hp, attack, defense, speed, sp_attack, sp_defense, height_m, weight_kg))
            cursor.execute("INSERT INTO pokemon_types_view (type1name, type2name) VALUES (?, ?)",
                            (type1name, type2name))
            cursor.execute("INSERT classification (classification) VALUES (?)",
                           (classification))
            print(f"Inserted {name} (Pokedex: {pokedex_number}) into the database.")
        except sqlite3.IntegrityError:
            print(f"Skipped {name} (Pokedex: {pokedex_number}) - already exists in the database.")

    conn.commit()
    conn.close()
