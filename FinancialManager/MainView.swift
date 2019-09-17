//
//  MainView.swift
//  FinancialManager
//
//  Created by Мирошниченко Марина on 09/09/2019.
//  Copyright © 2019 Мирошниченко Марина. All rights reserved.
//

import UIKit

class MainView: UIView, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let fr = _financialRecords {
        return  fr.count
        }
        else {
           return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
       
        dateFormatter.dateFormat = "MMM d, h:mm a"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "1", for: indexPath)
        
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        
        cell.textLabel?.text = "Category: " + _financialRecords![indexPath.row].category + ", description: " + _financialRecords![indexPath.row].desription + ", sum = " + String(_financialRecords![indexPath.row].value) + ", date: " +        (dateFormatter.string(from: _financialRecords![indexPath.row].date))
        return cell
    }
    
    
    init(_ vc: MainViewController?) {
        super.init(frame: CGRect.zero)
        self._vc = vc
        
        _setAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _setAppearance(){
        self.backgroundColor = UIColor.white
        
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
        _expenseList.register(UITableViewCell.self, forCellReuseIdentifier: "1")
        _expenseList.dataSource = self
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
    
    public func update(financialRecords records: [FinancialRecord]) {
        _financialRecords = records
        
        _expenseList.reloadData()
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
    
    private var _expenseList = UITableView(frame: CGRect.zero, style: .plain)
    
    private let _btnAddIncome = UIButton(type: .roundedRect)
    private let _btnAddExpense = UIButton(type: .roundedRect)
    
    private var _financialRecords: [FinancialRecord]?

    private weak var _vc: MainViewController?
}
