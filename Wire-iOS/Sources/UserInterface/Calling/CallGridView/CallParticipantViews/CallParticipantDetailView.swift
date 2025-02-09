//
// Wire
// Copyright (C) 2021 Wire Swiss GmbH
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
//

import Foundation
import UIKit

final class CallParticipantDetailsView: RoundedBlurView {
    private let nameLabel = UILabel(
        key: nil,
        size: .medium,
        weight: .semibold,
        color: .textForeground,
        variant: .dark
    )

    private let microphoneIconView = PulsingIconImageView()

    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }

    var microphoneIconStyle: MicrophoneIconStyle = .hidden {
        didSet {
            microphoneIconView.set(style: microphoneIconStyle)
        }
    }

    override func setupViews() {
        super.setupViews()
        setCornerRadius(12)
        microphoneIconView.set(size: .tiny, color: .white)

        [microphoneIconView, nameLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }

    override func createConstraints() {
        super.createConstraints()

        NSLayoutConstraint.activate([
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: microphoneIconView.trailingAnchor, constant: 4),
            microphoneIconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            microphoneIconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            microphoneIconView.widthAnchor.constraint(equalToConstant: 16),
            microphoneIconView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
