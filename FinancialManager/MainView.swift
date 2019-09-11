//
//  MainView.swift
//  FinancialManager
//
//  Created by Мирошниченко Марина on 09/09/2019.
//  Copyright © 2019 Мирошниченко Марина. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    init(_ vc: MainViewController?) {
        super.init(frame: CGRect.zero)
        self._vc = vc
        
        _setAppearence()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _setAppearence(){
        self.backgroundColor = UIColor.white
      
    
        _btnAdd.translatesAutoresizingMaskIntoConstraints = false
        _btnAdd.backgroundColor = UIColor(red: 0, green: 0.2, blue: 1, alpha: 0.5)
        _btnAdd.layer.cornerRadius = 7.0
        _btnAdd.setTitle("Add", for: .normal)
        _btnAdd.setTitleColor(.white, for: .normal)
        //_btnAdd.setBackgroundImage(UIImage(named: "btnAdd"), for: .normal)
        //_btnAdd.addTarget(self, action: #selector(_onAddItemButton), for: .touchUpInside)
        addSubview(_btnAdd)
        
        NSLayoutConstraint.activate(
            [
                _btnAdd.topAnchor.constraint(equalTo: self.topAnchor),
                _btnAdd.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                _btnAdd.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
                _btnAdd.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            ])
    }
    
    
    private let _btnAdd = UIButton(type: .roundedRect)
    private weak var _vc: MainViewController?
}
