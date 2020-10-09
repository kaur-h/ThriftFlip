//
//  FirstViewController.swift
//  ThriftFlip
//
//  Created by Harleen Kaur on 6/15/20.
//  Copyright © 2020 PFS. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var featured: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var randomInt = 0
    
    // let tutorials = ["jeansTooWide", "razorback"]
   // let tutorialCovers : [UIImage] = [UIImage(named: "jeansTooWide")!, UIImage(named: "razorback")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        ThriftFlip.mainInstance.addTutorial(tutorial_name: "jeansTooWide")
        ThriftFlip.mainInstance.addTutorial(tutorial_name: "razorback")
        ThriftFlip.mainInstance.addTutorial(tutorial_name: "GinaTop")
        ThriftFlip.mainInstance.addTutorial(tutorial_name: "maxi")
        //randomInt = Int.random(in: 0..<mainInstance.allTutorials.count)
        featured.setImage(mainInstance.allTutorials[randomInt].tutorialCover, for: UIControl.State.normal)
      /*  let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20)/2, height: self.collectionView.frame.size.height/3)*/
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ThriftFlip.mainInstance.allTutorials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCells", for: indexPath) as! CollectionViewCell
        cell.explore1.image = ThriftFlip.mainInstance.allTutorials[indexPath.item].tutorialCover
        
        cell.explore1.backgroundColor = UIColor.init(patternImage: UIImage(named:"background")!)
        cell.explore1.layer.borderColor = UIColor.clear.cgColor
        //cell.explore1.setImage(tutorialCovers[indexPath.item], for: UIControl.State.normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ThriftFlip.mainInstance.allTutorials[indexPath.item].selected = true
        let storyboard = UIStoryboard(name: "Tutorial", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "secondScreen")
        self.present(vc, animated: true, completion: nil)
    }

    @IBAction func FeaturedButton(_ sender: UIButton) {
        mainInstance.allTutorials[randomInt].favorite = true
        let storyboard = UIStoryboard(name: "Tutorial", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "secondScreen")
        self.present(vc, animated: true, completion: nil)
    }
    
}

