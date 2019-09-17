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
    
    public func addExpense (Value v: Double) {
        _balance -= v
    }
    
    public static func getInstance() -> FinancialManager {
        return _fm
    }
    
    public func addRecord(financialRecord fr: FinancialRecord) {
    
        _financialRecords.append(fr)
        
        if incomeCategories.contains(fr.category)
        {
            addIncome(Value: fr.value)
        }
        else {
            addExpense(Value: fr.value)
        }
    }
    
   /* public func getRecordsForCategory(Category ctg: String) -> [FinancialRecord] {
        return _financialRecords.filter { $0.category == ctg }
    } */
   
    /*public func getExpenses() -> [FinancialRecord] {
        return _financialRecords.filter {_expenseCategories.contains($0.category)}
    }*/
    
    public func getRecords() ->[FinancialRecord] {
        return _financialRecords
    }
    
    private var _balance: Double
    
    public private(set) var incomeCategories: [String] = ["salary", "saving", "deposits", "other"]
    public private(set) var expenseCategories: [String] = ["food", "medicines", "transport", "clothes", "entertaiment", "hygiene", "presents", "housing", "pets", "other"]
    
    private static var _fm = FinancialManager()
    private var _financialRecords: [FinancialRecord] = []
}
