Resize a UITableView footerView using autolayout
================================================

My goal is to create a tableFooterView that does resize itself by being connected to the contained UILabel.

If I put the layout constraints on the UILabel to keep a constant space to all four edges plus that the height of the label can extend.

![layout constraints in Interface Builder](./ibconstraints1.png "layout constraints")

Using the constraints shown above, the label won't resize at all, as you can see from the first screenshot.

![tableFooterView with autolayout constraints](./screenshot1.png "screenshot 1")

But if I remove the bottom constraint so that the label view can increase it's height, the label is growing as I would expect.

![removed layout constraint in Interface Builder](./ibconstraints2.png "layout constraints")


![tableFooterView with missing bottom autolayout constraints](./screenshot2.png "screenshot 2")

The table view does get the size of the footer view by assigning the footer to the table:

<code>
[self.tableView setTableFooterView:_footerView]
</code>

Resizing the footer view won't inform the table view about the new height.

What am I missing? At what point should I update and inform the tableview about the new height of the footer view?

Update
======

Thanks to the pull request (https://github.com/cmittendorf/TableViewFooterResize/commit/81b96fe667d34ca0eb9208a11cfdc8e3fe6dd463) of https://github.com/phaibin the problem described above is solved. It is now working:

![tableFooterView with fixed autolayout](./screenshot3.png "screenshot 3")

For further details see: http://prod.lists.apple.com/archives/cocoa-dev/2014/Jun/msg00127.html