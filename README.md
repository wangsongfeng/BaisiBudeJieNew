# BaisiBudeJieNew
新版的 百思不得姐 练习

第一天 练习：整体框架的搭建 ，cocoapods终于配置好了，，可以开始用了

    2.3日
    sizeToFit的使用心得
        使用sizeToFit的时候，类似于系统会根据内容的帮我布局一个它认为最合适的大小
        另外sizeToFit()声明在UIView中，所以我们的所有的视图控件，都可以调用这个方法
        既然所有的控件都可以调用这个方法，但是实际的开发中，我们好像也不经常使用它，来做一些布局什么的？
        
所以一般是在 不方便手动布局的时候才调用sizeToFit方法：

        1.navigationBar中对navigationItem的设置，（添加两个视图以上的控件到Item）
        2. toolBar中的对UIBarButtonItem的设置（一般我们还要添加弹簧控件）
        上述两种场合就可以用sizeToFit这个方法，来让系统给我们做自动布局。（注意：如果就添加一个控件的话，我们直接设置fram也是可以的）
        3.在tabBar中我们不能手动的添加的子控件，因为tabBar是根据控制器系统默认自动添加的tabBarItem。（猜想系统可能也会自动调用了这个方法）
        4.UILabel中添加文字，然后让调整label的大小来适应文字，我们也调用sizeToFit的方法。


