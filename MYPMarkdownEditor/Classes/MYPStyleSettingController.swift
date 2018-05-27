//
//  MYPStyleSettingController.swift
//  MYPMarkdownEditor
//
//  Created by wakary redou on 2018/5/26.
//

import UIKit

open class MYPStyleSettingController: UITableViewController {
    
    weak var delegate: MYPStyleSettingProtocol?
    
    private var selectedIndexPath: IndexPath?
    private var shouldScrollToSelectedRow = false

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    open func reload() {
        self.tableView.reloadData()
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MYPStyleSettingController: MYPStyleSettingProtocol {
    public func mypMarkdownEditor_didTap(styleType: MYPMarkdownEditorFormattingStyle, info: [String : Any]?) {
        
    }
}

extension MYPStyleSettingController {
    // MARK: - Table view data source
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    open override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == self.selectedIndexPath {
            switch indexPath.row {
            case 0:
                return 120.0
            case 3:
                return 120.0
            case 4:
                return 180.0
            default:
                break
            }
        }
        return 60.0
    }
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerID", for: indexPath) as! MYPStyleHeaderCell
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fontStyleID", for: indexPath) as! MYPStyleFontStyleCell
            cell.delegate = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "paragraphID", for: indexPath) as! MYPStyleParagraphCell
            cell.delegate = self
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fontSizeID", for: indexPath) as! MYPStyleFontSizeCell
            cell.delegate = self
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "colorID", for: indexPath) as! MYPStyleColorCell
            cell.delegate = self
            return cell
        default:
            break
        }
     
     // Configure the cell...
     let cell = UITableViewCell(style: .default, reuseIdentifier: "XX")
     return cell
     }
    
    open override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath == self.selectedIndexPath {
            cell.isSelected = true
        }
    }
    
    open override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.shouldScrollToSelectedRow && indexPath == self.selectedIndexPath {
            tableView.scrollToRow(at: indexPath, at: .none, animated: true)
            self.shouldScrollToSelectedRow = false
        }
    }
    
    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var indexPaths = [IndexPath]()
        if indexPath == self.selectedIndexPath {
            self.selectedIndexPath = nil
        }
        else {
            if self.selectedIndexPath != nil {
                indexPaths.append(self.selectedIndexPath!)
            }
            self.selectedIndexPath = indexPath
        }
        indexPaths.append(indexPath)
        self.shouldScrollToSelectedRow = true
        tableView.reloadRows(at: indexPaths, with: .automatic)
    }
    
    
}
