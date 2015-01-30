//
//  TestCell.h
//  TestKVO
//
//  Created by gfan on 15/1/30.
//  Copyright (c) 2015年 gfan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCell : UITableViewCell<UITextFieldDelegate>

@property(nonatomic, retain)IBOutlet UITextField  *testField;
@end
