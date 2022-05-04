//
//  DetailsViewController.swift
//  Assignment4
//
//  Created by Yusuke Ishihara on 2022-05-04.
//  Copyright © 2022 Derrick Park. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var city:City!
    
    init(city: City){
        self.city = city
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var stack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            self.createTitleLabel(content: "Country"),
            self.createValueLabel(content: nationalFlag(country: self.city.icon)),
            self.createTitleLabel(content: "City"),
            self.createValueLabel(content: self.city.name),
            self.createTitleLabel(content: "Temperature"),
            self.createValueLabel(content: String(self.city.temp)),
            self.createTitleLabel(content: "Summary"),
            self.createValueLabel(content: self.city.summary),
        ])
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: view.topAnchor, constant:200).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:-200).isActive = true
    }
    
    func createTitleLabel(content:String)->UILabel{
        let lb = UILabel()
        lb.text = content
        lb.textAlignment = .center
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }
    
    func createValueLabel(content:String)->UILabel{
        let lb = UILabel()
        lb.text = content
        lb.textAlignment = .center
        lb.font = lb.font.withSize(25)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }
    
    func nationalFlag(country:String)-> String{
        switch country {
        case "canada":
            return "🇨🇦"
        case "italy":
            return "🇮🇹"
        case "japan":
            return "🇯🇵"
        case "brazil":
            return "🇧🇷"
        case "skorea":
            return "🇰🇷"
        default:
            return "no image"
        }
    }
}
