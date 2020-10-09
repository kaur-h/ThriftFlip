//
//  ThriftFlipController.swift
//  ThriftFlip
//
//  Created by Harleen Kaur on 7/22/20.
//  Copyright © 2020 PFS. All rights reserved.
//

import Foundation
import UIKit

public struct tutorials{
    var tutorialCover: UIImage
    var idNum: Int
    var name: String
    var stepNum = 1
    var steps: [String]
    var stepImages: [UIImage]
    var selected:Bool
    var favorite: Bool
}

public class thriftFlipGlobal{

    private var num = 1
    public var allTutorials: [tutorials] = []
    
    public func addTutorial(tutorial_name:String){
        let cover = UIImage(named:"\(tutorial_name)")
        let id = num
        num += 1
        let st: [String] = []
        let stIm:[UIImage] = []
        let t:tutorials = tutorials(tutorialCover: cover!, idNum:id, name:tutorial_name, steps: st, stepImages: stIm, selected: false, favorite: false)
        allTutorials.append(t)
    }
    
    public func addSteps(id:Int, step:String){
        allTutorials[id-1].steps.append(step)
        allTutorials[id-1].stepImages.append(UIImage(named: "\(allTutorials[id-1].name)" + "\(String(allTutorials[id-1].stepNum))")!)
        allTutorials[id-1].stepNum += 1
    }
    
    public func printTutorialNames(){
        for t in allTutorials{
            print(t.name)
        }
    }
    
    public func changeSelected(id:Int){
        let select = allTutorials[id-1].selected
        if(select == true){
            allTutorials[id-1].selected = false
        }
        else if(select == false){
            allTutorials[id-1].selected = true
        }
    }
    
    public func changeFavorite(id: Int){
        let fav = allTutorials[id-1].favorite
        if(fav == true){
            allTutorials[id-1].favorite = false
        }
        else if(fav == false){
            allTutorials[id-1].favorite = true
        }
    }
    
}

let mainInstance:ThriftFlip.thriftFlipGlobal = thriftFlipGlobal()



