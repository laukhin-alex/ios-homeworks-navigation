//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александр on 14.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    @IBOutlet weak var avatarImage: UIImageView!

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
        view.backgroundColor = .gray
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.masksToBounds = false
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.layer.cornerRadius = avatarImage.frame.width/2
        avatarImage.clipsToBounds = true

    }

    private func loadViewFromXib() -> UIView {
        guard let view = Bundle.main.loadNibNamed("ProfileHeaderView", owner: self, options: nil)?.first as? UIView else { return UIView() }

        return view
    }
}
