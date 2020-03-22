//
//  ProfileVC.swift
//  Tensend(new)
//
//  Created by root user on 3/1/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy
import SDWebImage

class ProfileVC: ScrollStackController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let leftView = UIStackView()
    let rightView = UIStackView()
    let centerView = UIStackView()
    var isLeft = false
    let innerView = UIView()
    let textField = UITextField()
    var link = String()
    var profile : Profile?
    var materials = [MarketingMaterial]()
    var usernameLabel = UILabel()
    var imagePicker = UIImagePickerController()
    let profileImageView = UIImageView()
    
    var tableView = UITableView(){
        didSet{
            self.tableView.backgroundColor = .white
        }
    }
    var ratings = [Rating]()
    let network = NetworkLayer()

    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 15, distribution: .fill)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "RatingTVC", bundle: nil), forCellReuseIdentifier: "RatingTVC")
        self.getData()
    }
    
    func getData(){
        
        network.getLink { (link) in
            guard let link = link?.link else{
                return
            }
            self.textField.text = link
            self.link = link
        }
        network.getProfile { (prof) in
            self.profile = prof?.profile
            self.setUpView()
        }
        network.getMaterials { (result) in
            if let array = result?.materials{
                self.materials = array
                self.fillMaterials()
            }
        }
        
    }
    
    @objc func openSettings(){
        SettingsVC.open(vc: self)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatingTVC", for: indexPath) as! RatingTVC
        cell.data = ratings[indexPath.row]
        cell.backgroundColor = .white
        if let profile = self.profile{
            if profile.id! == ratings[indexPath.row].id!{
                cell.backgroundColor = #colorLiteral(red: 0, green: 0.4, blue: 0.8745098039, alpha: 1)
                cell.amountLabel.textColor = .white
                cell.nameLabel.textColor = .white
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ratings.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
extension ProfileVC{
    func setUpView(){
        guard let prof = profile else{

            return
        }
        
        let buttonStackView = UIStackView()
        buttonStackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 0, distribution: .fill)
        buttonStackView.setSpacing(right: 20)
        buttonStackView.addArrangedSubview(UIView())
        let settingsButton = UIButton()
        settingsButton.setImage(#imageLiteral(resourceName: "Exclusion 1"), for: .normal)
        settingsButton.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        buttonStackView.addArrangedSubview(settingsButton)
        settingsButton.easy.layout(Height(20), Width(20))
        self.stackView.addArrangedSubview(buttonStackView)
        
        let view = UIView()
        if let avatar = prof.avatar{
            profileImageView.sd_setImage(with: URL(string: imageUrl + avatar.encodeUrl), completed: nil)
        }else{
            profileImageView.image = #imageLiteral(resourceName: "depositphotos_137014128-stock-illustration-user-profile-icon")
        }
        
        profileImageView.contentMode = .scaleAspectFill
        view.addSubview(profileImageView)
        self.stackView.addArrangedSubview(view)
        profileImageView.addTapGestureRecognizer {
            self.pickPhoto()
        }
        
        let labelView = UIView()
        if let surname = profile?.surname{
            usernameLabel.text = surname
        }
        if let name = profile?.name{
            usernameLabel.text = usernameLabel.text! + " " + name
        }
        usernameLabel.font = usernameLabel.font.withSize(16)
        usernameLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        usernameLabel.textAlignment = .center
        labelView.addSubview(usernameLabel)
        usernameLabel.easy.layout(Edges(5))
        self.stackView.addArrangedSubview(labelView)
        
        
        
        profileImageView.easy.layout(Height(130), Width(130), CenterX(), Top(), Bottom())
        profileImageView.cornerRadius(radius: 65, width: 5, color: .white)

        
        let threeButtons = ThreeButtons(leftPressed: {
            self.innerView.isHidden = true
            self.rightView.isHidden = true
            self.leftView.isHidden = false
            
        }, rightPressed: {
            self.innerView.isHidden = true
            self.leftView.isHidden = true
            self.rightView.isHidden = false
            
        }, centedPressed: {
            self.rightView.isHidden = true
            self.innerView.isHidden = false
            self.leftView.isHidden = true
            
        })
        
        self.stackView.addArrangedSubview(threeButtons)
        self.setUpLeftView()
        self.setUpCenterView()
        self.setUpRightView()
        self.innerView.isHidden = true
        self.rightView.isHidden = true

        
        network.getRatings { (response) in
            if let data = response?.ratings{
                self.ratings = data
                self.addTableView()
            }else{
                // log out
            }
        }
    }
    
    
    func setUpLeftView(){
        
            
            leftView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
            let horSV = UIStackView()
            horSV.setProperties(axis: .horizontal, alignment: .fill, spacing: 10, distribution: .fill)
            let smallView = SmallView(title: "Белсенділік", amount: profile!.activity!, image: #imageLiteral(resourceName: "purple"))
            let smallView1 = SmallView(title: "Рейтинг", amount: profile!.rating!, image: #imageLiteral(resourceName: "yellow"))
            horSV.addArrangedSubview(UIView())
            horSV.addArrangedSubview(smallView)
            horSV.addArrangedSubview(smallView1)
            horSV.addArrangedSubview(UIView())

            leftView.addArrangedSubview(horSV)
            
            let horSV1 = UIStackView()
            horSV1.setProperties(axis: .horizontal, alignment: .fill, spacing: 10, distribution: .fill)
        let smallView2 = SmallView(title: "Өткен\nсабақ саны", amount: profile!.passed!, image: #imageLiteral(resourceName: "red"))
        let smallView3 = SmallView(title: "TENSEND САНЫ", amount: profile!.tensend!, image: #imageLiteral(resourceName: "green"))
            horSV1.addArrangedSubview(UIView())
            horSV1.addArrangedSubview(smallView2)
            horSV1.addArrangedSubview(smallView3)
            horSV1.addArrangedSubview(UIView())

            leftView.addArrangedSubview(horSV1)
            self.stackView.addArrangedSubview(leftView)
            
        
    }
    
    func setUpCenterView(){

            centerView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
            let titleLabel = UILabel()
            titleLabel.text = "САТУ ТРЕНАЖЕРЫ"
            titleLabel.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
            centerView.addArrangedSubview(titleLabel)
            let textLabel = UILabel()
            textLabel.text = "Сату тренажеры сізге сату қабілетіңізді\nарттыруға және де қосымша табыс тауып,\nTensend ұтыс ойындарына қатысуға\nмүмкіндік береді.\n\nЖеке сілтемеңізді достарыңызға жіберіңіз немесе жарнамалау\nарқылы ақшалай табыс табыңыз"
            textLabel.numberOfLines = 0
            textLabel.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
            centerView.addArrangedSubview(textLabel)
            let hSV = UIStackView()
            hSV.setProperties(axis: .horizontal, alignment: .fill, spacing: 0, distribution: .fill)
            textField.isEnabled = false
            textField.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
            textField.borderStyle = .roundedRect
            textField.backgroundColor = .white
            let button = UIButton()
            button.backgroundColor = #colorLiteral(red: 0, green: 0.3803921569, blue: 0.8901960784, alpha: 1)
            button.setTitleColor(.white, for: .normal)
            button.setTitle("Бөлісу", for: .normal)
            button.addTarget(self, action: #selector(self.share), for: .touchUpInside)
            button.cornerRadius(radius: 7, width: 0)
            hSV.addArrangedSubview(textField)
            hSV.addArrangedSubview(button)
            button.easy.layout(Width(120))
            centerView.addArrangedSubview(hSV)
        
        let imageView = UIView()
            let image = UIImageView()
        image.image = #imageLiteral(resourceName: "pizda")
        imageView.addSubview(image)
        image.easy.layout(Edges(20))
        let clicks = UILabel()
        clicks.text = "\(self.profile!.clicks_count!)"
        clicks.textColor = .white
        imageView.addSubview(clicks)
        clicks.easy.layout(Top(75), CenterX())
        centerView.addArrangedSubview(imageView)
        
        let requests = UILabel()
        requests.text = "\(self.profile!.requests_count!)"
        requests.textColor = .white
        imageView.addSubview(requests)
        requests.easy.layout(Top(45).to(clicks), CenterX())
        
        let requests1 = UILabel()
        requests1.text = "\(self.profile!.registrations_count!)"
        requests1.textColor = .white
        imageView.addSubview(requests1)
        requests1.easy.layout(Top(45).to(requests), CenterX())
        
        
        let requests2 = UILabel()
        requests2.text = "\(self.profile!.subscriptions_count!)"
        requests2.textColor = .white
        imageView.addSubview(requests2)
        requests2.easy.layout(Top(50).to(requests1), CenterX())
        
        
        
            innerView.addSubview(centerView)
        
            centerView.easy.layout(Edges(10))
            self.stackView.addArrangedSubview(innerView)
        
    }
    func setUpRightView(){
        rightView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        
        let view = UIView()
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
        label.text = "МЕНІҢ ДЕҢГЕЙІМ"
        view.addSubview(label)
        label.easy.layout(Edges(10))
        
        let view1 = UIView()
         let label1 = UILabel()
         label1.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
         label1.text = "Келесі деңгейге жетy үшін 10 tensend қалды"
        label1.font = label1.font.withSize(15)
        label1.numberOfLines = 0
         view1.addSubview(label1)
         label1.easy.layout(Left(10))
         
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Group 305")
        imageView.addTapGestureRecognizer {
            LevelsVC.open(vc: self, levels: self.profile!.levels!, id: self.profile!.levelId!)
        }
        
        let view2 = UIView()
        let label2 = UILabel()
        label2.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
        label2.text = "МАРКЕТИНГ МАТЕРИАЛДАРЫ"
        label1.numberOfLines = 0
        view2.addSubview(label2)
        label2.easy.layout(Edges(10))
        
        let view3 = UIView()
         let label3 = UILabel()
         label3.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
         label3.text = "Жанрамa жасауға арналған арнайы\nматериалдарды өз телефоныңызға\nжүктеп алыңыз"
        label3.font = label3.font.withSize(15)
        label3.numberOfLines = 0
         view3.addSubview(label3)
         label3.easy.layout(Left(10), Bottom(10), Top(10))
        
    

        self.rightView.addArrangedSubview(view)
        self.rightView.addArrangedSubview(view1)
        self.rightView.addArrangedSubview(imageView)
        self.rightView.addArrangedSubview(view2)
        self.rightView.addArrangedSubview(view3)
        
        
        
        self.stackView.addArrangedSubview(rightView)
        
    }
    
    func fillMaterials(){
 
        for materail in materials{
            let Iview = UIView()
            let imageView = UIImageView()
            imageView.sd_setImage(with: URL(string: imageUrl + materail.imagePath!), completed: nil)
            Iview.addSubview(imageView)
            imageView.easy.layout(Edges(10), Height(103))
            imageView.cornerRadius(radius: 10, width: 0)
            imageView.contentMode = .scaleToFill
            imageView.addTapGestureRecognizer {
                guard let url = materail.url else{
                    return
                }
                DocReaderVC.open(vc: self, url: url)
            }
            self.rightView.addArrangedSubview(Iview)
        }
    }
    
    func addTableView(){
        let labelView = UIView()
        
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
        label.text = "РЕЙТИНГ"
        labelView.addSubview(label)
        label.easy.layout(Edges(20))
        self.leftView.addArrangedSubview(labelView)
        let view = UIView()
        view.addSubview(tableView)
        tableView.easy.layout(Edges(10))
        let h = self.ratings.count * 50
        self.tableView.easy.layout(Height(CGFloat(h)))
        self.tableView.reloadData()
        self.tableView.cornerRadius(radius: 10, width: 1)
        self.tableView.allowsSelection = false
        self.leftView.addArrangedSubview(view)
        
    }
    
    func pickPhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        self.uploadImage(image: image)
    }
    

    func uploadImage(image: UIImage) {
        let url = URL(string: "https://tensend.me/api/v1/profile/avatar")
        
        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString
        
        let session = URLSession.shared
        
        // Set the URLRequest to POST and to the specified URL
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        
     
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer " + TokenHeaders.shared().getToken(), forHTTPHeaderField: "Authorization")

        var data = Data()
        
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"avatar\"; filename=\"filename\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)
        
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
                if let json = jsonData as? [String: Any] {
                    print(json)
                }
                self.profileImageView.image = image
            }else{
                self.showAlert(title: "Қате", message: "Бір-екі миніттан кейін қайталаңыз")
            }
        }).resume()
    }
    
    @objc func share(){
        UIGraphicsBeginImageContext(view.frame.size)
               view.layer.render(in: UIGraphicsGetCurrentContext()!)
               let image = UIGraphicsGetImageFromCurrentImageContext()
               UIGraphicsEndImageContext()

               let textToShare = "Check out my app"

               if let myWebsite = URL(string: link) {
                   let objectsToShare = [textToShare, myWebsite, image ?? #imageLiteral(resourceName: "app-logo")] as [Any]
                   let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

                   //Excluded Activities
                   activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
                   

                activityVC.popoverPresentationController?.sourceView = self.view
                   self.present(activityVC, animated: true, completion: nil)
               }
    }
}
