//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александр on 14.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    @IBOutlet weak var avatarImage: UIImageView!

    @IBOutlet weak var showStatusButton: UIButton!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    @IBOutlet weak var statusText: UILabel!

    private var isExpanded = true

    let statusTextChanging = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
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

        statusText.text = "Good news, everyone!"

    }

    private func loadViewFromXib() -> UIView {
        guard let view = Bundle.main.loadNibNamed("ProfileHeaderView", owner: self, options: nil)?.first as? UIView else { return UIView() }

        return view
    }

    @IBAction func buttonIsTyped(_ sender: UIButton) {
        print(statusText.text ?? "OK")

        self.bottomConstraint.constant = self.isExpanded ? 100 : 34
        UIView.animate(withDuration: 1) {
            self.layoutIfNeeded()
        } completion: { _ in
            self.isExpanded.toggle()
            if self.bottomConstraint.constant == 100 {
                self.showStatusButton.setTitle("Set status", for: .normal)
                self.addSubview(self.statusTextChanging)
            } else {
                self.showStatusButton.setTitle("Set status", for: .normal)
            }
        }



    }
}


