//
//  MYPStyleColorCell.swift
//  MYPMarkdownEditor
//
//  Created by wakary redou on 2018/5/26.
//

import UIKit

class MYPStyleColorCell: UITableViewCell {
    
    @IBOutlet var colorPickerView: MYPColorPickerView!
    
    weak var delegate: MYPStyleSettingProtocol?
    
    var colors: [UIColor] = {
        return [UIColor(red: 44.0 / 255.0, green: 62.0 / 255.0, blue: 80.0 / 255.0, alpha: 1.0),
                UIColor(red: 102.0 / 255.0, green: 128.0 / 255.0, blue: 153.0 / 255.0, alpha: 0.05),
                UIColor(red: 51.0 / 255.0, green: 51.0 / 255.0, blue: 51.0 / 255.0, alpha: 1.0),
                UIColor(red: 0.0 / 255.0, green: 119.0 / 255.0, blue: 187.0 / 255.0, alpha: 1.0),
                UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0),
                UIColor(red: 214.0 / 255.0, green: 219.0 / 255.0, blue: 223.0 / 255.0, alpha: 1.0),
                UIColor(red: 0, green: 136.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0),
                UIColor(red: 135.0 / 255.0, green: 135.0 / 255.0, blue: 135.0 / 255.0, alpha: 1.0),
                UIColor(red: 101.0 / 255.0, green: 152.0 / 255.0, blue: 201.0 / 255.0, alpha: 1.0),
                UIColor(red: 244.0 / 255.0, green: 169.0 / 255.0, blue: 135.0 / 255.0, alpha: 1.0),
                UIColor(red: 164.0 / 255.0, green: 195.0 / 255.0, blue: 108.0 / 255.0, alpha: 1.0),
                UIColor(red: 27.0 / 255.0, green: 131.0 / 255.0, blue: 79.0 / 255.0, alpha: 1.0)
        ]
        }() {
        didSet {
            self.colorPickerView.reloadData()
        }
    }
    
    private var lineLayer: CAShapeLayer = CAShapeLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.strokeColor = UIColor.lightGray.cgColor
        lineLayer.lineJoin = kCALineJoinRound
        lineLayer.lineDashPattern = [5, 2]
        lineLayer.lineWidth = 1.0
        
        self.layer.addSublayer(lineLayer)
        
        self.colorPickerView.dataSource = self
        self.colorPickerView.delegate = self
        
        self.colorPickerView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.colorPickerView.isHidden = !selected
        self.lineLayer.isHidden = !selected
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if !self.isSelected {
            return
        }
        
        var layerFrame = rect
        layerFrame.origin.x = 20.0
        layerFrame.origin.y = 60.0
        layerFrame.size.width = layerFrame.size.width - 20.0 * 2.0
        layerFrame.size.height = 1.0
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0.5))
        path.addLine(to: CGPoint(x: layerFrame.width, y: 0.5))
        
        self.lineLayer.path = path.cgPath
        lineLayer.frame = layerFrame
    }

}

extension MYPStyleColorCell: MYPColorPickerViewDataSource {
    func myp_numberOfColors(in pickerView: MYPColorPickerView) -> Int {
        return self.colors.count
    }
    
    func myp_color(for pickerView: MYPColorPickerView, at index: Int) -> UIColor? {
        return self.colors[index]
    }
}

extension MYPStyleColorCell: MYPColorPickerViewDelegate {
    func myp_colorPickerView(_ pickerView: MYPColorPickerView, didSelect index: Int) {
        let color = self.colors[index]
        self.delegate?.mypMarkdownEditor_didTap(styleType: .fontColor, info: ["info": color])
    }
}
