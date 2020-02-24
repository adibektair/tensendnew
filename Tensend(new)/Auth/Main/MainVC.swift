//
//  MainVC.swift
//  Tensend(new)
//
//  Created by root user on 1/31/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import DropDown
import SDWebImage
import AKMaskField

let imageUrl = "https://tensend.me/images/"


class MainVC: UIViewController {

      
    var presenter : MainPresenter!
        
    // MARK: Outlets
    
    @IBOutlet weak var tensendLabel: UILabel!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var prefixLabel: UILabel!
    @IBOutlet weak var changeCountryButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var phoneView: UIView!{
        didSet{
            self.phoneView.cornerRadius(radius: 8, width: 0, color: .white)
        }
    }
    @IBOutlet weak var topImageHeightConstraint: NSLayoutConstraint!{
        didSet{
            self.topImageHeightConstraint.constant = UIScreen.main.bounds.height * 0.33
        }
    }
        
    @IBOutlet weak var phoneNumberTextField: AKMaskField!
    @IBOutlet weak var continueButton: UIButton!{
        didSet{
            self.continueButton.cornerRadius(radius: 8, width: 0, color: .white)
        }
    }
    
        // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        self.continueButton.isHidden = true
        phoneNumberTextField.maskExpression = "({ddd}) {ddd} {dd} {dd}"
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    @objc func keyboardWillAppear() {
        self.logoImageView.isHidden = true
        
        self.topImageHeightConstraint.constant = 0
        self.continueButton.isHidden = false
        
        self.bottomConstraint.constant = -170
        self.tensendLabel.isHidden = true
    }

    @objc func keyboardWillDisappear() {
        self.logoImageView.isHidden = false
        self.topImageHeightConstraint.constant = UIScreen.main.bounds.height * 0.33
        self.continueButton.isHidden = true
        self.bottomConstraint.constant = -10
        self.tensendLabel.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
        self.continueButton.isHidden = true
        
    }
    
    
    
    // MARK: Actions
    @IBAction func continueButtonPressed(_ sender: Any) {
        if self.phoneNumberTextField.text != ""{
                        self.presenter.login(phone: self.phoneNumberTextField.text!)
                    }
    }
    @IBAction func changeCountryPressed(_ sender: Any) {
        self.presenter.changeCountry()
        var arr = [String]()
        for country in self.presenter.countries ?? []{
            arr.append(country.phonePrefix!)
        }
        let dropDown = DropDown()

        // The view to which the drop down will appear on
        dropDown.anchorView = self.changeCountryButton  // UIView or UIBarButtonItem

        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = arr

        dropDown.show()
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.flagImageView.sd_setImage(with: URL(string: imageUrl + self.presenter.countries![index].imagePath!), completed: nil)
            self.prefixLabel.text = item
        }
    }
    @IBAction func skipAuth(_ sender: Any) {
     
    }
    @IBAction func loginPressed(_ sender: Any) {
        self.presenter.goToSignInt()
    }
    

}
extension MainVC : MainViewProtocol{
    func success() {
        print("got countries")
    }

    
    
    func keyboardAppeared() {
    }
    
    func changeCountry() {
        
    }
    
    
}

