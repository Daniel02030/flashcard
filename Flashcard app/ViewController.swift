//
//  ViewController.swift
//  Flashcard app
//
//  Created by iD Student on 7/4/17.
//  Copyright © 2017 com.idtech.daniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    //Outlets
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answerPickerView: UIPickerView!
    @IBOutlet weak var questionLabel: UILabel!
    
    //Actions
    @IBAction func submitButtonPressed(_ sender: Any) {
        var alert: UIAlertController
        if CardCollection.instance.checkAnswer(selectedAnswer: answerPickerView.selectedRow(inComponent: 0)){
            // answer is correct
            alert = UIAlertController(title: "Correct", message: "Yee", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Yee yay", style: UIAlertActionStyle.default, handler: nil))
        } else {
            // anser is incorrect
            alert = UIAlertController(title: "Inorrect", message: "U stupid", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "How could this happen to me", style: UIAlertActionStyle.default, handler: nil))
        }
        present(alert, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        answerPickerView.dataSource = self
        answerPickerView.delegate = self
        
        setupCardUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupCardUI() {
        questionTextView.text = CardCollection.instance.currentCard.question
    
        questionLabel.text = "Question \(CardCollection.instance.currentIndex + 1) /\(CardCollection.instance.cards.count)"
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CardCollection.instance.currentCard.options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CardCollection.instance.currentCard.options[row]
    }
    
}

