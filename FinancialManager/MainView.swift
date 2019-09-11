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
      
    
       _btnMenu.translatesAutoresizingMaskIntoConstraints = false
        _btnMenu.backgroundColor = UIColor(red: 0, green: 0.7, blue: 0, alpha: 0.5)
        _btnMenu.layer.cornerRadius = 7.0
        _btnMenu.imageView?.contentMode = .scaleAspectFill
        _btnMenu.setBackgroundImage(UIImage(named: "btnMenu")?.withAlignmentRectInsets(UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10))
, for: .normal)
        //_btnAdd.addTarget(self, action: #selector(_onAddItemButton), for: .touchUpInside)
        addSubview(_btnMenu)
        
        _lblBalance.translatesAutoresizingMaskIntoConstraints = false
        _lblBalance.text = "Balance: "
        _lblBalance.font = UIFont.boldSystemFont(ofSize: 30)
        addSubview(_lblBalance)
        
        _lblBalancaValue.translatesAutoresizingMaskIntoConstraints = false
        _lblBalancaValue.font = UIFont.boldSystemFont(ofSize: 30)
        addSubview(_lblBalancaValue)
        
        NSLayoutConstraint.activate(
            [
                _btnMenu.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
                _btnMenu.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                _btnMenu.widthAnchor.constraint(equalToConstant: 50),
                _btnMenu.heightAnchor.constraint(equalToConstant: 50),
                
                _lblBalance.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
                _lblBalance.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
                _lblBalance.trailingAnchor.constraint(equalTo: self.centerXAnchor),
                _lblBalance.heightAnchor.constraint(equalToConstant: 50),
                
                _lblBalancaValue.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
                _lblBalancaValue.leadingAnchor.constraint(equalTo: self.centerXAnchor),
                _lblBalancaValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15),
                _lblBalancaValue.heightAnchor.constraint(equalToConstant: 50)
                
            ])
        
    }
    
    public func setBalanceValue(value v: Double) {
        _lblBalancaValue.text = String(v)
    }
    
    private let _lblBalance = UILabel(frame: CGRect.zero)
    private var _lblBalancaValue = UILabel(frame: CGRect.zero)
    
    private let _btnMenu = UIButton(type: .roundedRect)

    private weak var _vc: MainViewController?
}
