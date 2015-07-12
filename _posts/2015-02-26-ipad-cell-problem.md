---
title:  "Setting background color of UITableViewCell in UINib doesn't work for iPad"
categories: iOS issue
---

Using a [UINib][UINib] to create a [UITableViewCell][UITableViewCell] was one of the best conveniences I had in long time. The problem started when the `backgroundColor` set in the [UINib][UINib] didn't take effect for iPad builds.
I had to set the `backgroundColor` explicitly in code for each cell.
Here is the relevant [commit](https://github.com/mx4492/wily/commit/dddca4fd5188c030d45d766888bd70e50bd3ee7f).

[UINib]: https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UINib_Ref/index.html
[UITableViewCell]: https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UITableViewCell_Class/index.html
