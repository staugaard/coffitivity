//
//  main.m
//  Coffitivity
//
//  Created by Mick Staugaard on 3/11/13.
//  Copyright (c) 2013 Mick Staugaard. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
