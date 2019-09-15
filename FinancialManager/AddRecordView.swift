//
//  AddRecordView.swift
//  FinancialManager
//
//  Created by Мирошниченко Марина on 14/09/2019.
//  Copyright © 2019 Мирошниченко Марина. All rights reserved.
//

import UIKit

class AddRecordView: UIView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return _categoriesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return _categoriesArray[row]
    }
    
    
    init(Viewcontroller vc: AddRecordViewController?, categoriesArray ctgArr: [String]) {
        super.init(frame: CGRect.zero)
        self._vc = vc
        
        self._categoriesArray = ctgArr
        
        _setAppearence()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _setAppearence() {
        
        self.backgroundColor = UIColor.white
        
        _valueTF.translatesAutoresizingMaskIntoConstraints = false
        _valueTF.layer.borderColor = UIColor.gray.cgColor
        _valueTF.layer.borderWidth = 1.0
        _valueTF.placeholder = "Enter the sum"
        _valueTF.textAlignment = .center
        addSubview(_valueTF)
        
        _categoryP.translatesAutoresizingMaskIntoConstraints = false
        _categoryP.dataSource = self
        _categoryP.delegate = self
        addSubview(_categoryP)
        
        _descriptionTF.translatesAutoresizingMaskIntoConstraints = false
        _descriptionTF.layer.borderColor = UIColor.gray.cgColor
        _descriptionTF.layer.borderWidth = 1.0
        _descriptionTF.placeholder = "Enter the description"
        _descriptionTF.textAlignment = .center
        addSubview(_descriptionTF)

        _dateP.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_dateP)
        
        _btnAdd.translatesAutoresizingMaskIntoConstraints = false
        _btnAdd.layer.borderWidth = 1.0
        _btnAdd.setTitle("Add", for: .normal)
        _btnAdd.setTitleColor(.white, for: .normal)
        _btnAdd.backgroundColor = .blue
        addSubview(_btnAdd)

        
        NSLayoutConstraint.activate(
            [
              _valueTF.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
                _valueTF.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                _valueTF.heightAnchor.constraint(equalToConstant: 50),
                _valueTF.widthAnchor.constraint(equalToConstant: 300),
                
                
                _categoryP.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                _categoryP.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -170),
                _categoryP.heightAnchor.constraint(equalToConstant: 100),
                _categoryP.widthAnchor.constraint(equalToConstant: 300),
                
                _descriptionTF.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                _descriptionTF.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                _descriptionTF.heightAnchor.constraint(equalToConstant: 50),
                _descriptionTF.widthAnchor.constraint(equalToConstant: 300),
                
                _dateP.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                _dateP.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 170),
                _dateP.heightAnchor.constraint(equalToConstant: 100),
                _dateP.widthAnchor.constraint(equalToConstant: 300),
                
                _btnAdd.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                _btnAdd.centerYAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
                _btnAdd.heightAnchor.constraint(equalToConstant: 50),
                _btnAdd.widthAnchor.constraint(equalToConstant: 300)
            ])
    }
    
    private func _onBtnAdd() {
        let fr = FinancialRecord(value: Double(_valueTF.text!)!, category: _categoriesArray[_categoryP.selectedRow(inComponent: 0)], desription: _descriptionTF.text!, date: _dateP.date)
        
        _vc!.onBtnAdd(financialRecord: fr)
        
    }
    
    private var _valueTF = UITextField(frame: .zero)
    
    private var _categoryP = UIPickerView(frame: .zero)
    
    private var _descriptionTF = UITextField(frame: .zero)
    
    private var _dateP = UIDatePicker(frame: .zero)
    
    private let _btnAdd = UIButton(type: .roundedRect)
    
    private var _categoriesArray: [String] = []
    
    private weak var _vc: AddRecordViewController?
}
