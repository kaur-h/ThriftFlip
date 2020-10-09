//
//  TutorialViewController.swift
//  ThriftFlip
//
//  Created by Harleen Kaur on 7/23/20.
//  Copyright © 2020 PFS. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var verticalStackView: UIStackView!
    
    var button: UIButton = UIButton()
    var id:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(mainInstance.allTutorials[0].steps.count == 0){
        mainInstance.addSteps(id: 1, step: "1. Put on the pants and pull the waist back to your desired width. Use chalk to mark where the jeans fit.")
        mainInstance.addSteps(id: 1, step: "2. Rip the seam in the part of the jeans that you marked and cut the waistband")
        mainInstance.addSteps(id: 1, step: "3. The jeans should have a cut in them here.")
        mainInstance.addSteps(id: 1, step: "4. Pin the jeans where you marked the chalk with the fold on the inside of the jeans.")
        mainInstance.addSteps(id: 1, step: "5. Sew a single straight stitch on the outside of the jeans on top of the fold you created. Then you can cut off the excess fabric.")
        }
        if(mainInstance.allTutorials[1].steps.count == 0){
            mainInstance.addSteps(id: 2, step: "1. Cut the t-shirt on the dotted lines represented.")
            mainInstance.addSteps(id: 2, step: "2. After the cut the t-shirt should look like this.")
            mainInstance.addSteps(id: 2, step: "3. Lastly, use the cut up strips from the bottom of the shirt to tie the sleeves together.")
        }
        if(mainInstance.allTutorials[2].steps.count == 0){
        mainInstance.addSteps(id: 3, step: "1. Cut a V-neck into a t-shirt that is about 5-in deep.")
        mainInstance.addSteps(id: 3, step: "2. Cut a 3.5 in piece of elastic and sew it with a zigzag stitch while stretching it out on the inside of the shirt where the dotted line indicates.")
        mainInstance.addSteps(id: 3, step: "3. Cut the top layer of the shirt off where the dotted line indicates")
        mainInstance.addSteps(id: 3, step: "4. Sew the back of the rectangular panel where the dotted line indicates.")
        mainInstance.addSteps(id: 3, step: "5. Sew the sides back onto the shirt.")
        mainInstance.addSteps(id: 3, step: "6. Done!")
        }
        if(mainInstance.allTutorials[3].steps.count == 0){
        mainInstance.addSteps(id: 4, step: "1. Mark the dress where you want to cut the top")
        mainInstance.addSteps(id: 4, step: "2. In the skirt part of the dress take an elastic band and sew it to the waist band")
        mainInstance.addSteps(id: 4, step: "3. Hem the bottom of the blouse if desired")
        mainInstance.addSteps(id: 4, step: "4. Done!")
        }
        
        
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.tintColor = UIColor(red: 255, green: 186, blue: 110, alpha: 1)
        button.setTitle("Add to Favorites", for: UIControl.State.normal)
        
        
        
        
        for t in mainInstance.allTutorials{
            if t.selected == true{
                id = t.idNum
                addText(id: t.idNum)
                mainInstance.changeSelected(id: t.idNum)
            }
        }

        
    }
    
    func addText(id:Int){
        var height: CGFloat = 0.0
        var i = 0
        
        let lab = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        lab.numberOfLines = 0
        lab.textColor  = .init(red: 255, green: 186, blue: 110, alpha: 1)
        lab.font = .preferredFont(forTextStyle: .title1)
        lab.textAlignment = .center
        height += lab.bounds.size.height
        lab.text = mainInstance.allTutorials[id-1].name
        verticalStackView.addArrangedSubview(lab)
        
        
        for step in mainInstance.allTutorials[id-1].steps{
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
            label.numberOfLines = 0
            label.textColor = .black
            label.textAlignment = .center
            label.text = step
            height += label.bounds.size.height
            verticalStackView.addArrangedSubview(label)
            
            let newImage = UIImageView()
            newImage.image = mainInstance.allTutorials[id-1].stepImages[i]
            height += label.bounds.size.height
            verticalStackView.addArrangedSubview(newImage)
            i += 1
        }
        
        
        height += button.bounds.size.height
        verticalStackView.addArrangedSubview(button)
        
        func pressed(sender: UIButton!) {
            // do some stuff
            print("your Button was pressed")
        }
        
        // Add a target to your button
        //dbutton.addTarget(self, action: (pressed(sender:)), for .touchUpInside)

        // Create the method you want to call (see target before)

        
        scrollView.bounds.size.height = height
        contentView.bounds.size.height = height
        verticalStackView.bounds.size.height = height
    }
    
    @IBAction func button(_ sender: UIButton) {
        mainInstance.changeFavorite(id: id)
        print(mainInstance.allTutorials[id-1].name)
        print(mainInstance.allTutorials[id-1].favorite)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
