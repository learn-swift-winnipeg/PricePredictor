//
//  ViewController.swift
//  Demo-CoreML
//
//  Created by Steven Prichard on 2017-07-15.
//  Copyright © 2017 Steven Prichard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let model = BostonPricer()
    let roomsDataSource = RoomsDataSource()
    let crimeDataSource = CrimeDateSource()
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var priceLabel: UILabel!
    
    let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.usesGroupingSeparator = true
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Alternatively this can be done in Main.storyboard.
        picker.dataSource = self
        picker.delegate = self
        
        generatePrediction()
    }
    
    fileprivate func generatePrediction(){
        let selectedCrimeRow = picker.selectedRow(inComponent: Predictor.crime.rawValue)
        guard let crime = crimeDataSource.value(for: selectedCrimeRow) else {
            return
        }
        
        let selectedRoomsRow = picker.selectedRow(inComponent: Predictor.rooms.rawValue)
        guard let rooms = roomsDataSource.value(for: selectedRoomsRow) else {
            return
        }
        
        guard let modelOuput = try? model.prediction(crime: crime, rooms: rooms) else {
            fatalError("Something went wring generating your prediction")
        }
        
        // Estimate price is in $1K increments (Data is from 1970s...)
        priceLabel.text = priceFormatter.string(for: modelOuput.price)
    }
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
                    inComponent component: Int) {
        generatePrediction()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
        guard let predictor = Predictor(rawValue: component) else{
            fatalError("Could not find predictor for compenent")
        }
        switch predictor {
        case .crime:
            return crimeDataSource.title(for: row)
        case .rooms:
            return roomsDataSource.title(for: row)
        }
    }
}
    
extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        guard let predictor = Predictor(rawValue: component) else {
            fatalError("Could not find predictor for component")
        }
        switch predictor {
        case .crime:
            return crimeDataSource.count
        case .rooms:
            return roomsDataSource.count
        }
    }
}
    
enum Predictor: Int{
    case crime = 0
    case rooms
}



