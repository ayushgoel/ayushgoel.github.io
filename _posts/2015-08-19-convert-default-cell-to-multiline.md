---
tags: ios uitableview uitableviewcell ARCHIVE
---
Convert a normal `UITableViewCell` of style `UITableViewCellStyleDefault` to a multiline cell.

1. Go to your storyboard and select the underlying label in the cell.
2. Open the Utilities section and change the number of lines to 0.

*edit* : This is not it, you will have to handle the cell height for this and make the cell height `Automatic`. A google search should take you to a better answer. Pardon me for not writing the whole steps here.

![Reference Image](/assets/tableview-cell-number-of-lines-0.png)
![Demo Image](/assets/tableview-cell-number-of-lines-0-demo.png)
