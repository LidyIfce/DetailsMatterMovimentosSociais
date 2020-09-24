//
//  TestCellTableViewCell.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Gustavo Lemos on 23/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class TestCellTableViewCell: UITableViewCell {

    @IBOutlet weak var cellText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellText.text = "GitDay Fortaleza Hacktoberfest 2019"

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
