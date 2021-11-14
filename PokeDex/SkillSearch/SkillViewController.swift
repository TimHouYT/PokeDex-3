//
//  SkillViewController.swift
//  PokeDex
//
//  Created by 侯彥廷 on 2021/10/27.
//

import Foundation
import UIKit

class SkillViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    let searchController = UISearchController()
    
    @IBOutlet weak var skillTableView: UITableView!
    
    var skillList = [Skill]()
    var filteredSkills = [Skill]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "技能"
        
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
        searchController.searchBar.scopeButtonTitles = ["All", "Grass", "Water", "Fire", "Normal", "Fighting", "Ice"]
        searchController.searchBar.delegate = self
    }
    
    func initList()
    {
        let sk1 = Skill(skillid: "001", skillname: "Pound", skillimageName: "pk1", skilltype: "Normal",
            skillexp: "使用長長的尾巴或手等拍打對手進行攻擊。", skillpow:40, skillacc:100, skillpp: 35)
        skillList.append(sk1)
        
        let sk2 = Skill(skillid: "002", skillname: "Karate Chop", skillimageName: "pk1", skilltype: "Fighting",
            skillexp: "用鋒利的手刀劈向對手進行攻擊。容易擊中要害。", skillpow:50, skillacc:100, skillpp: 25)
        skillList.append(sk2)
        
        let sk3 = Skill(skillid: "003", skillname: "Double Slap", skillimageName: "pk1", skilltype: "Normal",
            skillexp: "用連環巴掌拍打對手進行攻擊。會連續攻擊２～５次。", skillpow:15, skillacc:85, skillpp: 10)
        skillList.append(sk3)
        
        let sk4 = Skill(skillid: "007", skillname: "Fire Punch", skillimageName: "pk1", skilltype: "Fire",
            skillexp: "用帶有火焰的拳頭攻擊對手。有時會讓對手陷入灼傷狀態。", skillpow:75, skillacc:100, skillpp: 15)
        skillList.append(sk4)
        
        let sk5 = Skill(skillid: "008", skillname: "Ice Punch", skillimageName: "pk1", skilltype: "Ice",
            skillexp: "牠出生的時候背上就有一個奇怪的種子。這種子跟隨牠發芽成長。", skillpow:75, skillacc:100, skillpp: 15)
        skillList.append(sk5)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(searchController.isActive)
        {
            return filteredSkills.count
        }
        return skillList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "skilltableViewCellID") as! SkillTableViewCell
        let thisSkill: Skill!
        
        if(searchController.isActive)
        {
            thisSkill = filteredSkills[indexPath.row]
        }
        else
        {
            thisSkill = skillList[indexPath.row]
        }
        
        tableViewCell.skilltitle.text = thisSkill.skid
       

       
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "skdetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "skdetailSegue")
        {
            let indexPath = self.skillTableView.indexPathForSelectedRow!
            
            let tableViewDetail = segue.destination as? SkillTableViewDetail
            
            let selectedSkill: Skill!
            
            if(searchController.isActive)
            {
                selectedSkill = filteredSkills[indexPath.row]
            }
            else
            {
                selectedSkill = skillList[indexPath.row]
            }
            
            
            tableViewDetail!.selectedSkill = selectedSkill
            
            self.skillTableView.deselectRow(at: indexPath, animated: true)
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
        filteredSkills = skillList.filter
        {
            skill in
            let scopeMatch = (scopeButton == "All" || skill.sktype.lowercased().contains(scopeButton.lowercased()))
            if(searchController.searchBar.text != "")
            {
                let searchTextMatch = skill.skname.lowercased().contains(searchText.lowercased())
                
                return scopeMatch && searchTextMatch
            }
            else
            {
                return scopeMatch
            }
        }
        skillTableView.reloadData()
    }
    
    
}

