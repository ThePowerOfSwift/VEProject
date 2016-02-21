//
//  VEDTableViewController.swift
//  VietED
//
//  Created by Phung Long on 12/24/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import UIKit

enum GBItemsTableViewViewState: Int {
    case GBItemsTableViewStateNormal = 0
    case GBItemsTableViewStateLoadingMoreContent // 1
}

class VEDBaseTableViewController: VEDBaseViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var itemsTableView: UITableView!
    var items = ["We", "Heart", "Swift"]
    var pullToRefreshView : VEDRefreshView = VEDRefreshView(frame: CGRect.zero)
    var loadMoreView : UIView = UIView()
    var indicatorView :UIActivityIndicatorView = UIActivityIndicatorView()
    var skip :Int = 0
    var isShowLoadingView:Bool?
    var canLoadMore:Bool?
    var tableViewState:GBItemsTableViewViewState = GBItemsTableViewViewState.GBItemsTableViewStateNormal {
        didSet {
            switch tableViewState {
            case .GBItemsTableViewStateNormal:
                itemsTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
                itemsTableView.tableFooterView = UIView(frame: CGRectZero)
                pullToRefreshView.endRefreshing()
                break
            case .GBItemsTableViewStateLoadingMoreContent:
                self.loadMoreDatas()
                break
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemsTableView.dataSource = self
        self.itemsTableView.delegate = self
        self.itemsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.creatRefreshView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func creatRefreshView()->Void {
        let customRefreshControlHeight:CGFloat = 50.0
        let customRefreshControlWidth:CGFloat = CGRectGetWidth(self.itemsTableView.frame)
        pullToRefreshView.frame = CGRect(x: 0, y: -customRefreshControlHeight, width: customRefreshControlWidth, height: customRefreshControlHeight)
        pullToRefreshView .addTarget(self, action: "reloadView", forControlEvents: UIControlEvents.ValueChanged)
        self.itemsTableView .addSubview(pullToRefreshView)
        
    }
    
    func reloadView(){
        self.refetchData()
    }
    
    func refetchData () {
        skip = 0
        self.items .removeAll()
        self.itemsTableView .reloadData()
        self.getData()
        
    }
    
    func getData (){
        if self.skip == 0 {
            isShowLoadingView = true;
        } else if (self.skip > 0) {
            isShowLoadingView = false;
        }
    }

    // MARK: public
    func refreshView() {
        self.itemsTableView .reloadData()
        pullToRefreshView.endRefreshing()
        tableViewState = GBItemsTableViewViewState.GBItemsTableViewStateNormal
    }
    
    
    // MARK: tableview
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    // MARK: loadmore function
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // UITableView only moves in one direction, y axis

        let currentOffset = scrollView.contentOffset.y
        let maxiumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if maxiumOffset - currentOffset <= 0 {
            if tableViewState == GBItemsTableViewViewState.GBItemsTableViewStateNormal {
                tableViewState = GBItemsTableViewViewState.GBItemsTableViewStateLoadingMoreContent
            }
        }

    }
    
    func loadMoreDatas () {
        loadMoreView.frame = CGRect(x: 0, y: 0, width: itemsTableView.frame.size.width, height: 50)
        loadMoreView.backgroundColor = UIColor.lightGrayColor()
        indicatorView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        indicatorView.center = loadMoreView.center
        loadMoreView.addSubview(indicatorView)
        indicatorView.startAnimating()
        
        if (canLoadMore != nil) {
            self.itemsTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
            self.itemsTableView.tableFooterView = loadMoreView
            skip = skip + 1
            self.getData()
        }
    }
    
}
