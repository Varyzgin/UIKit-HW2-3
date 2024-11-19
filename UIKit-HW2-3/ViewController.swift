//
//  ViewController.swift
//  UIKit-HW2-3
//
//  Created by Дима on 11/18/24.
//

import UIKit

class ViewController: UIViewController {
    let appTitle = (text: "App Name", width: CGFloat(147))
    let name = "Name"
    let surname = "Surname"
    let years = 25
    lazy var fullName = (text: "\(name) \(surname)", width: CGFloat(141))

    let backgroundColor: UIColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    let margin : CGFloat = 30
    enum TextStyle: String {
        case bold, italic, regular
    }
    
    var titleLabel = UILabel()
    let profileImageView = UIImageView()
    var fullNameLabel = UILabel()
    let statusImageView = UIImageView()
    var yearsLabel = UILabel()
    var exitButton = UIButton()
    var writeButton = UIButton()
    var likeButton = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel = setupLabel(text: appTitle.text, style: .bold, size: 30, x: margin, y: 100, width: appTitle.width, height: 36)
        view.addSubview(titleLabel)
        
        profileImageView.image = UIImage(named: "profile")
        profileImageView.frame = CGRect(x: margin, y: titleLabel.frame.maxY + margin, width: view.frame.width - 2 * margin, height: view.frame.width - 2 * margin)
        profileImageView.layer.cornerRadius = 40
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        view.addSubview(profileImageView)
        
        fullNameLabel = setupLabel(text: fullName.text, style: .bold, size: 20, color: .white, x: profileImageView.frame.minX + margin, y: profileImageView.frame.maxY - 3 * margin, width: fullName.width, height: 29)
        view.addSubview(fullNameLabel)

        statusImageView.image = UIImage(named: "status")
        statusImageView.frame = CGRect(x: fullNameLabel.frame.maxX + 4, y: fullNameLabel.frame.midY - fullNameLabel.frame.height / 2, width: fullNameLabel.frame.height, height: fullNameLabel.frame.height)
        statusImageView.contentMode = .scaleAspectFill
        statusImageView.clipsToBounds = true
        view.addSubview(statusImageView)

        yearsLabel = setupLabel(text: "\(years) лет", color: .white, x: profileImageView.frame.minX + margin, y: fullNameLabel.frame.maxY, width: 150)
        view.addSubview(yearsLabel)
        
        let iconButtonSize : CGFloat = 63
        let writeButtonWidth : CGFloat = view.frame.width - 2 * margin - 2 * iconButtonSize - 4 * margin / 3

        writeButton = setupTextButton(text: "Написать", bgColor: UIColor(red: 37/255, green: 169/255, blue: 82/255, alpha: 1), radius: 20, x: view.frame.midX - writeButtonWidth / 2, y: profileImageView.frame.maxY + margin, width: writeButtonWidth, height: 50)
        view.addSubview(writeButton)
        
        exitButton = setupIconButton(icon: UIImage(named: "exit"), iconWidth: iconButtonSize / 3, iconHeight: iconButtonSize / 3, bgColor: backgroundColor, radius: 31, x: margin, y: writeButton.frame.midY - iconButtonSize / 2, width: iconButtonSize, height: iconButtonSize)
        view.addSubview(exitButton)
        
        likeButton = setupIconButton(icon: UIImage(named: "like"), iconWidth: iconButtonSize / 2, iconHeight: iconButtonSize / 2, bgColor: backgroundColor, radius: 31, x: view.frame.maxX - margin - iconButtonSize, y: writeButton.frame.midY - iconButtonSize / 2, width: iconButtonSize, height: iconButtonSize)
        view.addSubview(likeButton)

    }
    func resizeImage(image: UIImage, width: CGFloat, height: CGFloat) -> UIImage {
        let size = CGSize(width: width, height: height)
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
    func setupLabel(text: String, style: TextStyle = .regular, size: CGFloat = 16, color: UIColor = .black, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat = 19) -> UILabel {
        let label = UILabel()
        label.text = text
        label.frame = CGRect(x: x, y: y, width: width, height: height)
        label.textColor = color
        
        switch style {
        case .bold: label.font = .boldSystemFont(ofSize: size)
        case .regular: label.font = .systemFont(ofSize: size)
        case .italic: label.font = .italicSystemFont(ofSize: size)
        }
        
        return label
    }
    func setupTextButton(text: String, textColor: UIColor = .white, size: CGFloat = 20, bgColor: UIColor, radius: CGFloat, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat = 19) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: size)
        button.setTitleColor(textColor, for: .normal)
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        button.backgroundColor = bgColor
        button.layer.cornerRadius = radius
        return button
    }
    func setupIconButton(icon: UIImage?, iconWidth: CGFloat, iconHeight: CGFloat, bgColor: UIColor, radius: CGFloat, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat = 19) -> UIButton {
        let button = UIButton()
        
        if let icon {
            button.setImage(resizeImage(image: icon, width: iconWidth, height: iconHeight), for: .normal)
        }
        
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        button.backgroundColor = bgColor
        button.layer.cornerRadius = radius
        return button
    }
}

