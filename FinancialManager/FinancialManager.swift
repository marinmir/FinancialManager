//
//  FinancialManager.swift
//  FinancialManager
//
//  Created by Мирошниченко Марина on 11/09/2019.
//  Copyright © 2019 Мирошниченко Марина. All rights reserved.
//

import UIKit

class FinancialManager{
   private init() {     //for singleton
        self._balance = 0
        
    }
    
    public func getBalance () -> Double {
        return _balance
    }
    
    public func addIncome (Value v: Double) {
        _balance += v
    }
    
    public func AddExpense (Value v: Double) {
        _balance -= v
    }
    
    public static func getInstance() -> FinancialManager {
        return _fn
    }
    
    public func addRecord(financialRecord fr: FinancialRecord) {
    
      _fr.append(fr)
    }
   
    private var _balance: Double
    
    public private(set) var _incomeCategories: [String] = ["salary", "saving", "deposits", "other"]
    public private(set) var _expenseCategories: [String] = ["food", "medicines", "transport", "clothes", "entertaiment", "hygiene", "presents", "housing", "pets", "other"]
    
    private static var _fn = FinancialManager()
    private var _fr: [FinancialRecord] = []
}
