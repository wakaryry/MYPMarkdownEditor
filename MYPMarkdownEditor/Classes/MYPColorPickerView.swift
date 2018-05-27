//
//  MYPColorPickerView.swift
//  MYPMarkdownEditor
//
//  Created by wakary redou on 2018/5/26.
//

import UIKit

class MYPColorPickerView: UIView {
    
    private var scrollView: UIScrollView!
    private var itemViews: [UIView]!
    
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
    }
    
    @objc private func handleTap(gesture: UITapGestureRecognizer) {
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
