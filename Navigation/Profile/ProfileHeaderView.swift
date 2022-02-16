//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александр on 14.02.2022.
//

import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {

    @IBOutlet weak var avatarImage: UIImageView!

    @IBOutlet weak var showStatusButton: UIButton!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    @IBOutlet weak var statusTextChanging: UITextField!

    @IBOutlet weak var statusText: UILabel!

    private var isExpanded = true

    private var statusTextPrivate: String = " "


    //    let statusTextChanging = UITextField(frame: CGRect(x: 150, y: 145, width: 200, height: 40))

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.statusTextChanging.isHidden = true

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)


    }

    private func setupView() {
        let view = self.loadViewFromXib()
        self.addSubview(view)
        view.frame = self.bounds
        view.backgroundColor = .systemGray4
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.masksToBounds = false
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.layer.cornerRadius = avatarImage.frame.width/2
        avatarImage.clipsToBounds = true
        showStatusButton.layer.masksToBounds = false
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.layer.shadowOffset = .init(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.tag = 0

        statusText.text = "Good news, everyone!"

    }

    private func loadViewFromXib() -> UIView {
        guard let view = Bundle.main.loadNibNamed("ProfileHeaderView", owner: self, options: nil)?.first as? UIView else { return UIView() }

        return view
    }

    @IBAction func buttonIsTyped(_ sender: UIButton) {
        print(statusText.text ?? "OK")
        self.bottomConstraint.constant = self.isExpanded ? 100 : 34
        UIView.animate(withDuration: 0.1) {
            self.layoutIfNeeded()
        } completion: { _ in
            self.isExpanded.toggle()
            if self.bottomConstraint.constant == 100 {
                self.showStatusButton.setTitle("Set status", for: .normal)
                self.statusTextChangingSetup()
                self.statusTextChanging.isHidden = false
            } else {
                self.showStatusButton.setTitle("Show status", for: .normal)

                self.statusText.text = self.statusTextChanging.text ?? "Wrong type"
                self.statusTextChanging.isHidden = true
            }
        }
    }
    private func statusTextChangingSetup() {


        self.statusTextChanging.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.statusTextChanging.layer.cornerRadius = 12
        self.statusTextChanging.backgroundColor = .white
        self.statusTextChanging.placeholder = "type your status here"
        self.statusTextChanging.font = UIFont.systemFont(ofSize: 15)
        self.statusTextChanging.autocorrectionType = UITextAutocorrectionType.no
        self.statusTextChanging.keyboardType = .default
        self.statusTextChanging.returnKeyType = UIReturnKeyType.done
        self.statusTextChanging.clearButtonMode = UITextField.ViewMode.whileEditing
        self.statusTextChanging.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.statusTextChanging.keyboardAppearance = .default
        self.statusTextChanging.layer.borderColor = UIColor.black.cgColor
        self.statusTextChanging.borderStyle = .none
        self.statusTextChanging.layer.borderWidth = 1
        self.statusTextChanging.delegate = self

    }
}


