//
//  ChoiceMenuTableViewCell.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/06/29.
//

import SnapKit
import Then
import UIKit

final class ChoiceMenuTableViewCell: UITableViewCell {

  // MARK: - Properties

  static let identifier = "ChoiceMenuTableViewCell"
  var isChecked: Bool = false {
    didSet {
      tapped()
    }
  }
  var handler: (() -> (Void))?

  // MARK: - UI Components

  lazy var checkButton = UIButton()
  private lazy var menuLabel = UILabel()

  // MARK: - init

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(
      style: style,
      reuseIdentifier: reuseIdentifier)
    self.backgroundColor = .white
    self.setUI()
    self.setLayout()
  }

  // MARK: - Functions

  private func setUI() {

    checkButton.do {
      $0.addTarget(self, action: #selector(checkButtonIsTapped), for: .touchUpInside)
    }

    menuLabel.do {
      $0.font = .medium(size: 18)
      $0.textColor = .black
      $0.text = "고구마치즈돈까스"
    }

    contentView.addSubviews(
      checkButton,
      menuLabel)
  }

  private func setLayout() {

    checkButton.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().inset(27)
      $0.height.width.equalTo(25)
    }

    menuLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalTo(checkButton.snp.trailing).offset(15)
    }
  }

  @objc
  func checkButtonIsTapped() {
    handler?()
  }
}

extension ChoiceMenuTableViewCell {
  func dataBind(menu: String, isTapped: Bool) {
    menuLabel.text = menu
    isChecked = isTapped
  }

  func tapped() {
    let image = isChecked ? ImageLiteral.Icon.checkedIcon : ImageLiteral.Icon.uncheckedIcon
    checkButton.setImage(image, for: .normal)
  }
}
