SinnerDrawer
====
 * Convenient drawer, can be placed on top of tablebar and navigation, for example, operates at the window
 


![](https://raw.githubusercontent.com/sinneryun/SinnerDrawer/master/Simulator%201.png)

![](https://raw.githubusercontent.com/sinneryun/SinnerDrawer/master/Simulator%202.png)

Manually
====
 * Drag the SinnerDrawer/LeftView/leftView.m folder into your project.

Usage
====
 * (see sample Xcode project in /Demo)

* can use this to push other ViewController

-(void)mainTypeBtnClicks:(UIButton *)mainTypeBtn{
    NSInteger btnTag = mainTypeBtn.tag;
    
    if (btnTag == 10) {
        NSLog(@">>>>>>>>>>>>>>>>>= 1 =<<<<<<<<<<<<<<<");
      
    }else if (btnTag==11) {
        NSLog(@">>>>>>>>>>>>>>>>>= 2 =<<<<<<<<<<<<<<<");
      
    }else if (btnTag==12) {
        NSLog(@">>>>>>>>>>>>>>>>>= 3 =<<<<<<<<<<<<<<<");
       
    }else if (btnTag==13) {
        NSLog(@">>>>>>>>>>>>>>>>>= 4 =<<<<<<<<<<<<<<<");
        
    }else if (btnTag==14) {
        NSLog(@">>>>>>>>>>>>>>>>>= 5 =<<<<<<<<<<<<<<<");
    }
 }
 
* and this

-(void) loginBtnClick:(UIButton *) loginBtnClick{
    NSLog(@"UserName");
}

PS
====
There is no package is complete, and are free to continue to collate

