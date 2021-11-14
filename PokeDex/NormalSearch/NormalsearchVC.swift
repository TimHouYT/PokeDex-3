//
//  NormalsearchVC.swift
//  PokeDex
//
//  Created by 侯彥廷 on 2021/10/24.
//

import Foundation
import UIKit


class NormalsearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    let searchController = UISearchController()
    
    @IBOutlet weak var pokemonTableView: UITableView!
    
    var pokemonList = [Pokemon]()
    var filteredPokemons = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "寶可夢"
        
        initList()
        initSearchController()

    // Do any additional setup after loading the view.
}
    
    func initSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["All", "Grass", "Water", "Fire"]
        searchController.searchBar.delegate = self
    }
    
    func initList()
    {
        let pok1 = Pokemon(id: "001", name: "Bulbasaur", imageName: "pk1", type: "Grass", exp: "牠出生的時候背上就有一個奇怪的種子。這種子跟隨牠發芽成長。")
        pokemonList.append(pok1)
        
        let pok2 = Pokemon(id: "002", name: "Ivysaur", imageName: "pk2", type: "Grass", exp: "沐浴在陽光下越久，身體內會湧出越多力量，背上的花苞也會漸漸成長")
        pokemonList.append(pok2)
        
        let pok3 = Pokemon(id: "003", name: "Venusaur", imageName: "pk3", type: "Grass", exp: "花朵散發出的迷人香味，能安撫激動的心情，甚至消弭鬥爭。")
        pokemonList.append(pok3)
        
        let pok4 = Pokemon(id: "004", name: "Charmander", imageName: "pk4", type: "Fire", exp: "從出生時開始尾巴上就有火焰在燃燒。火焰熄滅時，生命也會結束。")
        pokemonList.append(pok4)
        
        let pok5 = Pokemon(id: "005", name: "Charmeleon", imageName: "pk5", type: "Fire", exp: "如果牠在戰鬥中亢奮起來，就會噴出灼熱的火焰，把周圍的東西燒得一乾二淨。")
        pokemonList.append(pok5)
        
        let pok6 = Pokemon(id: "006", name: "Charizard", imageName: "pk6", type: "Fire", exp: "會噴出彷彿連岩石都能燒焦的灼熱火焰。有時會引發森林火災。")
        pokemonList.append(pok6)
        
        let pok7 = Pokemon(id: "007", name: "Squirtle", imageName: "pk7", type: "Water", exp: "當牠遇到危險的時候，會將四肢收回甲殼裡保護自己，同時從嘴裡噴出水來。")
        pokemonList.append(pok7)
        
        let pok8 = Pokemon(id: "008", name: "Wartortle", imageName: "pk8", type: "Water", exp: "被視為長壽的象徵。如果卡咪龜的殼上長著苔蘚，那就代表牠已經活了非常久。")
        pokemonList.append(pok8)
        
        let pok9 = Pokemon(id: "009", name: "Blastoise", imageName: "pk9", type: "Water", exp: "從甲殼上的大炮裡放出的噴射水流足以貫穿厚實的鐵板。")
        pokemonList.append(pok9)
        
        let pok54 = Pokemon(id: "054", name: "Psyduck", imageName: "pk54", type: "Water", exp: "總是因為頭痛而煩惱著。當牠讓神奇的力量爆發後，似乎就能暫時舒緩疼痛。")
        pokemonList.append(pok54)
        
        let pok55 = Pokemon(id: "055", name: "Golduck", imageName: "pk55", type: "Water", exp: "生活在水流平穩的河川裡。會用長長的手腳划水，展現自己優雅的泳姿。")
        pokemonList.append(pok55)
        
        let pok58 = Pokemon(id: "058", name: "Growlithe", imageName: "pk58", type: "Fire", exp: "能毫不畏懼地去對抗比自己更強更大的對手。性格非常勇敢可靠。")
        pokemonList.append(pok58)
        
        let pok59 = Pokemon(id: "059", name: "Arcanine", imageName: "pk59", type: "Fire", exp: "從古時候起就是擄獲眾多人心的美麗寶可夢。能像飛一樣輕盈地奔跑。")
        pokemonList.append(pok59)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(searchController.isActive)
        {
            return filteredPokemons.count
        }
        return pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! NormalTableViewCell
        let thisPokemon: Pokemon!
        
        if(searchController.isActive)
        {
            thisPokemon = filteredPokemons[indexPath.row]
        }
        else
        {
            thisPokemon = pokemonList[indexPath.row]
        }
        
        tableViewCell.pokemonID.text = thisPokemon.id
        
        tableViewCell.pokemonName.text = thisPokemon.name
        
        tableViewCell.pokemonImage.image = UIImage(named: thisPokemon.imageName)
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "detailSegue")
        {
            let indexPath = self.pokemonTableView.indexPathForSelectedRow!
            
            let tableViewDetail = segue.destination as? NormalTableViewDetail
            
            let selectedPokemon: Pokemon!
            
            if(searchController.isActive)
            {
                selectedPokemon = filteredPokemons[indexPath.row]
            }
            else
            {
                selectedPokemon = pokemonList[indexPath.row]
            }
            
            
            tableViewDetail!.selectedPokemon = selectedPokemon
            
            self.pokemonTableView.deselectRow(at: indexPath, animated: true)
        }
    }

    
    func updateSearchResults(for searchController: UISearchController)
    {
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        
        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }

    
    //過濾條件scopeMatch,搜尋seatchTextMatch
    
    func filterForSearchTextAndScopeButton(searchText: String, scopeButton : String = "All")
    {
        filteredPokemons = pokemonList.filter
        {
            pokemon in
            let scopeMatch = (scopeButton == "All" || pokemon.type.lowercased().contains(scopeButton.lowercased()))
            if(searchController.searchBar.text != "")
            {
                let searchTextMatch = pokemon.name.lowercased().contains(searchText.lowercased())
                
                return scopeMatch && searchTextMatch
            }
            else
            {
                return scopeMatch
            }
        }
        pokemonTableView.reloadData()
    }
    
    
    
    
}
