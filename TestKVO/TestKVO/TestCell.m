//
//  TestCell.m
//  TestKVO
//
//  Created by gfan on 15/1/30.
//  Copyright (c) 2015年 gfan. All rights reserved.
//

#import "TestCell.h"

@implementation TestCell

- (void)awakeFromNib {
    // Initialization code
    self.testField.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"tag : %ld text : %@",textField.tag,textField.text);
}

- (void)dealloc
{
    NSLog(@" dealloc tag : %ld text : %@",self.testField.tag,self.testField.text);
    self.testField.delegate = nil;
}


@end
