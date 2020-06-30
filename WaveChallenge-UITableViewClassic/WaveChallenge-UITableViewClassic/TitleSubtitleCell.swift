//
//  TitleSubtitleCell.swift
//  WaveChallenge-UITableViewClassic
//
//  Created by John De Guzman on 2020-06-30.
//  Copyright © 2020 John De Guzman. All rights reserved.
//

import UIKit

class TitleSubtitleCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    func setup(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
}
