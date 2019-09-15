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
        _lblBalance.textAlignment = .center
        addSubview(_lblBalance)
        
        _lblBalancaValue.translatesAutoresizingMaskIntoConstraints = false
        _lblBalancaValue.font = UIFont.boldSystemFont(ofSize: 30)
        _lblBalancaValue.layer.borderColor = UIColor.gray.cgColor
        _lblBalancaValue.layer.borderWidth = 1
        _lblBalancaValue.textAlignment = .center
        addSubview(_lblBalancaValue)
        
        _expenseList.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_expenseList)
        
        _btnAddIncome.translatesAutoresizingMaskIntoConstraints = false
        _btnAddIncome.setBackgroundImage(UIImage(named: "btnAddIncome"), for: .normal)
        _btnAddIncome.addTarget(self, action: #selector(_onBtnAddIncome), for: .touchUpInside)
        addSubview(_btnAddIncome)
        
        _btnAddExpense.translatesAutoresizingMaskIntoConstraints = false
        _btnAddExpense.setBackgroundImage(UIImage(named: "btnAddExpense"), for: .normal)
        _btnAddExpense.addTarget(self, action: #selector(_onBtnAddExpense), for: .touchUpInside)
        addSubview(_btnAddExpense)
        
        NSLayoutConstraint.activate(
            [
                _btnMenu.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
                _btnMenu.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                _btnMenu.widthAnchor.constraint(equalToConstant: 50),
                _btnMenu.heightAnchor.constraint(equalToConstant: 50),
                
                _lblBalance.topAnchor.constraint(equalTo: self.topAnchor, constant: 130),
                _lblBalance.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
                _lblBalance.trailingAnchor.constraint(equalTo: self.centerXAnchor),
                _lblBalance.heightAnchor.constraint(equalToConstant: 50),
                
                _lblBalancaValue.topAnchor.constraint(equalTo: self.topAnchor, constant: 130),
                _lblBalancaValue.leadingAnchor.constraint(equalTo: self.centerXAnchor),
                _lblBalancaValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
                _lblBalancaValue.heightAnchor.constraint(equalToConstant: 50),
                
                //place for chart
                
                _expenseList.topAnchor.constraint(equalTo: self.centerYAnchor),
                _expenseList.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                _expenseList.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                _expenseList.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
                
                _btnAddIncome.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25),
                _btnAddIncome.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 75),
                _btnAddIncome.heightAnchor.constraint(equalToConstant: 70),
                _btnAddIncome.widthAnchor.constraint(equalToConstant: 70),
                
                _btnAddExpense.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25),
                _btnAddExpense.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -75),
                _btnAddExpense.heightAnchor.constraint(equalToConstant: 70),
                _btnAddExpense.widthAnchor.constraint(equalToConstant: 70)
                
                
            ])
        
    }
    
    public func setBalanceValue(value v: Double) {
        _lblBalancaValue.text = String(v)
    }
    
    @objc
    private func _onBtnAddExpense() {
        _vc!.onBtnAddExpense()
    }
    
    @objc
    private func _onBtnAddIncome() {
        _vc!.onBtnAddIncome()
    }
    
    private let _lblBalance = UILabel(frame: CGRect.zero)
    private var _lblBalancaValue = UILabel(frame: CGRect.zero)
    
    private let _btnMenu = UIButton(type: .roundedRect)
    
    private var _expenseList = UITableView(frame: CGRect.zero, style: .plain)
    
    private let _btnAddIncome = UIButton(type: .roundedRect)
    private let _btnAddExpense = UIButton(type: .roundedRect)

    private weak var _vc: MainViewController?
}
