//
//  MYPColorPickerView.swift
//  MYPMarkdownEditor
//
//  Created by wakary redou on 2018/5/26.
//

import UIKit

class MYPColorPickerView: UIView {
    
    private var scrollView: UIScrollView!
    private var itemViews = [UIView]()
    
    private(set) var selectedIndex = -1
    var spacingBWColors: CGFloat = 20.0
    
    weak var dataSource: MYPColorPickerViewDataSource? {
        didSet {
            // did not consider the same dataSource
            self.reloadData()
        }
    }
    
    weak var delegate: MYPColorPickerViewDelegate?
    
    var numberOfColors: Int {
        return self.dataSource?.myp_numberOfColors(in: self) ?? 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    private func setup() {
        self.backgroundColor = .white
        self.scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        self.addSubview(scrollView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(gesture:)))
        self.addGestureRecognizer(tap)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var rect = CGRect.zero
        rect.size.height = (self.bounds.height - self.spacingBWColors) / 2.0
        rect.size.width = rect.size.height
        
        var numberOfColorsInRow = self.numberOfColors / 2 + (self.numberOfColors % 2)
        let contentWidth = CGFloat(numberOfColorsInRow) * rect.width + CGFloat(numberOfColorsInRow - 1) * self.spacingBWColors
        
        if contentWidth < self.bounds.width {
            rect.origin.y = self.spacingBWColors
            rect.size.height = self.bounds.height - self.spacingBWColors * 2.0
            rect.size.width = rect.size.height
            numberOfColorsInRow = self.numberOfColors
        }
        
        for index in 0..<self.itemViews.count {
            if index == numberOfColorsInRow {
                rect.origin.x = 0
                rect.origin.y = rect.height + self.spacingBWColors
            }
            
            let itemView = self.itemViews[index]
            let transform = itemView.transform
            itemView.transform = CGAffineTransform.identity
            itemView.frame = rect
            itemView.layer.cornerRadius = rect.width / 2
            itemView.transform = transform
            rect.origin.x += rect.width + self.spacingBWColors
        }
        var contentSize = CGSize.zero
        contentSize.width = CGFloat(numberOfColorsInRow) * rect.width + CGFloat(numberOfColorsInRow - 1) * self.spacingBWColors
        contentSize.height = self.bounds.height
        self.scrollView.contentSize = contentSize
        self.scrollView.frame = self.bounds
    }
    
    @objc private func handleTap(gesture: UITapGestureRecognizer) {
        let point = gesture.location(in: self.scrollView)
        
        for index in 0..<self.itemViews.count {
            let item = itemViews[index]
            if item.frame.contains(point) {
                self.select(index: index)
                self.delegate?.myp_colorPickerView(self, didSelect: index)
                self.delegate?.myp_colorPickerView(self, didSelect: item.backgroundColor!)
                break
            }
        }
    }
    
    func reloadData() {
        self.itemViews.forEach {
            $0.removeFromSuperview()
        }
        self.itemViews.removeAll()
        self.selectedIndex = -1
        if self.dataSource == nil {
            return
        }
        
        for index in 0..<self.numberOfColors {
            let item = UIView()
            item.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            item.backgroundColor = self.dataSource?.myp_color(for: self, at: index)
            self.scrollView.addSubview(item)
            self.itemViews.append(item)
        }
        self.setNeedsLayout()
    }
    
    func select(index: Int) {
        if self.selectedIndex >= 0 && self.selectedIndex < self.itemViews.count {
            let last = itemViews[self.selectedIndex]
            last.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        }
        
        self.selectedIndex = index
        let selected = self.itemViews[self.selectedIndex]
        selected.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}

protocol MYPColorPickerViewDelegate: NSObjectProtocol {
    func myp_colorPickerView(_ pickerView: MYPColorPickerView, didSelect index: Int)
    func myp_colorPickerView(_ pickerView: MYPColorPickerView, didSelect color: UIColor)
}

protocol MYPColorPickerViewDataSource: NSObjectProtocol {
    func myp_numberOfColors(in pickerView: MYPColorPickerView) -> Int
    func myp_color(for pickerView: MYPColorPickerView, at index: Int) -> UIColor?
}

extension MYPColorPickerViewDelegate {
    func myp_colorPickerView(_ pickerView: MYPColorPickerView, didSelect index: Int) {
        // do nothing
    }
    
    func myp_colorPickerView(_ pickerView: MYPColorPickerView, didSelect color: UIColor) {
        // do nothing
    }
}

extension MYPColorPickerViewDataSource {
    func myp_numberOfColors(in pickerView: MYPColorPickerView) -> Int {
        return 0
    }
    
    func myp_color(for pickerView: MYPColorPickerView, at index: Int) -> UIColor? {
        return nil
    }
}
