//
//  SelectPackageVC.swift
//  American Changer
//
//  Created by iMac on 06/03/21.
//

import UIKit

class SelectPackageVC: BaseVC {

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar(title: "Select Your Packages", titleImage: nil, leftImage: nil, rightImage: UIImage(named: "icoMenu"), leftTitle: nil, rightTitle: nil, isLeft: true, isRight: true, isLeftMenu: false, isRightMenu: true, bgColor: UIColor(named: "ThemeColor")!, textColor: .white) { (btn) in
            
        } rightClick: { (btn) in
            
        }
    }
}


extension SelectPackageVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier., for: <#T##IndexPath#>)
    }
}
