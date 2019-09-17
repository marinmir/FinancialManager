//
//  ViewController.swift
//  FinancialManager
//
//  Created by Мирошниченко Марина on 09/09/2019.
//  Copyright © 2019 Мирошниченко Марина. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        self.view = MainView(self)
    }
    
    func onBtnAddExpense() {
        let newVC = AddRecordViewController(categoriesArray: _fm.expenseCategories, mainVC: self)
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    func onBtnAddIncome() {
        let newVC = AddRecordViewController(categoriesArray: _fm.incomeCategories, mainVC: self)
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    public func addRecord(financialRecord fr: FinancialRecord) {
        _fm.addRecord(financialRecord: fr)
        
        (self.view as! MainView).update(financialRecords: _fm.getRecords())
        (self.view as! MainView).setBalanceValue(value: _fm.getBalance())
    }
    
    private var _fm = FinancialManager.getInstance()
}

