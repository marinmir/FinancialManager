//
//  AddRecordViewController.swift
//  FinancialManager
//
//  Created by Мирошниченко Марина on 14/09/2019.
//  Copyright © 2019 Мирошниченко Марина. All rights reserved.
//

import UIKit

class AddRecordViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView()
    {
        self.view = AddRecordView(Viewcontroller: self, categoriesArray: _ctgArray )
    }
    
    init(categoriesArray ctgArr: [String], mainVC vc: MainViewController ) {
        super.init(nibName: nil, bundle: nil)
        self._ctgArray = ctgArr
        
        self._mainVC = vc
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func onBtnAdd(financialRecord fr: FinancialRecord) {
        _mainVC?.addRecord(financialRecord: fr)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    private var _ctgArray: [String] = []
    
    private weak var _mainVC: MainViewController?
}
