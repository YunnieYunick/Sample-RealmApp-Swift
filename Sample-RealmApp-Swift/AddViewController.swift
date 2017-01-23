//
//  AddViewController.swift
//  Sample-RealmApp-Swift
//
//  Created by Yunnie Yunick on 2017/01/22.
//  Copyright © 2017年 yunnieyunick. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var addNameField: UITextField!
    @IBOutlet weak var addScoreField: UITextField!
    
    var SampleItems:Results<Sample>?{
        do{
            let realm = try! Realm()
            return realm.objects(Sample)
        }catch{
            print("エラー")
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addNameField.delegate = self
        self.addScoreField.delegate = self

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addNameField.resignFirstResponder()
        addScoreField.resignFirstResponder()
        return true
    }

    @IBAction func add(_ sender: Any) {
        
        let data = Sample()
        data.name = addNameField.text!
        data.score = Int(addScoreField.text!)!
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(data)
        }
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
