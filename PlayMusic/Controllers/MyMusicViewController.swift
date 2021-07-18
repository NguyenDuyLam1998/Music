//
//  MyMusicViewController.swift
//  PlayMusic
//
//  Created by Lâm Nguyễn on 06/07/2021.
//  Copyright © 2021 Lâm Nguyễn. All rights reserved.
//

import UIKit
import AVFoundation

class MyMusicViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var listMusic: [Music] = myMusic
    var searchMusic = [Music]()
    var searching = false
    var player:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "mh")!)
        setupTableView()
        tableView.keyboardDismissMode = .onDrag
    }
    
    func setupTableView(){
        let niCel = UINib(nibName: "MyMusicTableViewCell",bundle: nil)
        tableView.register(niCel, forCellReuseIdentifier: "MyMusicTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension MyMusicViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchMusic.count
        } else {
            return self.listMusic.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyMusicTableViewCell", for: indexPath) as? MyMusicTableViewCell
        if searching {
            cell!.lbnameSong.text = searchMusic[indexPath.row].nameSong
            cell!.lbnameSinger.text = searchMusic[indexPath.row].nameSinger
            cell!.imageSinger.image = UIImage(named: searchMusic[indexPath.row].imageSinger!)
            return cell!
        } else {
            cell!.lbnameSong.text = listMusic[indexPath.row].nameSong
            cell!.lbnameSinger.text = listMusic[indexPath.row].nameSinger
            cell!.imageSinger.image = UIImage(named: listMusic[indexPath.row].imageSinger!)
            return cell!
        }
        return UITableViewCell()
    }
}

extension MyMusicViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var playViewController = storyboard.instantiateViewController(identifier: "PlayViewController") as! PlayViewController
        playViewController.namesong = listMusic[indexPath.row].nameSong
        playViewController.namesinger = listMusic[indexPath.row].nameSinger
        playViewController.imgSinger = listMusic[indexPath.row].imageSinger
        playViewController.imgSingerSmall = listMusic[indexPath.row].imageSinger
        playViewController.song = listMusic[indexPath.row].song
        self.navigationController?.pushViewController(playViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension MyMusicViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchMusic = listMusic.filter({$0.nameSong!.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
