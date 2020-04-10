//
//  FAQViewController.swift
//  Tensend(new)
//
//  Created by root user on 4/5/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy


class FAQViewController: ScrollStackController {

    let networkLayer = NetworkLayer()
    var faqs = [Faq]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeNCTranslucent()
        self.title = "Сұрақ/Жауап"
        self.networkLayer.getFaq { (response) in
            if let faqs = response?.faqs{
                self.faqs = faqs
                self.setView()
            }else{
                Helper.shared().makeUserResponse(response: response!) { (title, text) in
                    self.showAlert(title: title, message: text)
                }
            }
        }
    }
    
    func setView(){
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        let infoView = InfoTextView(title: "Tensend жайлы, немеcе оны қалай қолдану\nжайлы негізгі сұрақтар мен оларға берілген\nжауаптар осы бөлімде жиналған.")
        self.stackView.addArrangedSubview(infoView)
        
        for faq in faqs{
            let view = FAQView()
            view.questionLabel.text = faq.question!
            view.addTapGestureRecognizer {
                view.showAnswer(text: faq.answer!)
            }
            self.stackView.addArrangedSubview(view)
        }
    }
     
     static func open(vc: UIViewController) {
         let viewController = self.init()
         if let nav = vc.navigationController {
             nav.pushViewController(viewController, animated: true)
         }
     }
     
}


class FAQView : UIView{
    
    var stackView = UIStackView()
    var questionLabel = UILabel()
    var separatorView = UIView()
    var answerLabel = UILabel()
    var shown = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        self.addSubview(stackView)
        stackView.easy.layout(Edges())
        questionLabel.numberOfLines = 0
        questionLabel.font =  questionLabel.font.withSize(15)
        let v = UIView()
        v.addSubview(questionLabel)
        self.stackView.addArrangedSubview(v)
        questionLabel.easy.layout(Edges(10))
        self.backgroundColor = .white
        self.cornerRadius(radius: 10, width: 0)
        
    }
    
    func showAnswer(text : String){
        if !shown{
            separatorView.backgroundColor = .gray
            self.stackView.addArrangedSubview(separatorView)
            separatorView.easy.layout(Height(1))
            answerLabel.numberOfLines = 0
            answerLabel.text = text
            answerLabel.font =  questionLabel.font.withSize(15)

            let v = UIView()
            v.addSubview(answerLabel)
            self.stackView.addArrangedSubview(v)
            answerLabel.easy.layout(Edges(10))
        }else{
            self.separatorView.removeFromSuperview()
            self.answerLabel.removeFromSuperview()
        }
        shown = !shown
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
