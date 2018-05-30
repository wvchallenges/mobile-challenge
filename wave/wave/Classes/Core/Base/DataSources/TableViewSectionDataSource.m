//
//  TableViewSectionDataSource.m
//  Core
//
//  Created by Armen Mkrtchian on 01/12/14.
//  Copyright (c) 2014 Armen Mkrtchian. All rights reserved.
//

#import "TableViewSectionDataSource.h"

@interface TableViewSectionDataSource ()

@end

@implementation TableViewSectionDataSource

//- (instancetype)initWithItems:(NSArray *)anItems
//                     sections:(NSArray *)aSections
//               cellIdentifier:(NSString *)aCellIdentifier
//           configureCellBlock:(TableViewCellBlock)aConfigureCellBlock {
//    
//    self = [super initWithItems:anItems
//                 cellIdentifier:aCellIdentifier
//             configureCellBlock:aConfigureCellBlock];
//    return self;
//}

- (void)setItems:(NSMutableArray *)items
{
    [super setItems:items];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.sectionIndexTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    //sectionForSectionIndexTitleAtIndex: is a bit buggy, but is still useable
    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.items isKindOfClass:[NSArray class]] ? [self.items count] : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section < self.items.count ? [[self.items objectAtIndex:section] count] : 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //only show the section title if there are rows in the section
    
    if (self.items.count > section) {
        
        BOOL showSection = [[self.items objectAtIndex:section] count] != 0;
    }
    
    NSString *title = @"";
    if (section < self.sectionTitles.count) {
        
        title = [self.sectionTitles objectAtIndex:section];// (showSection) ? [self.sectionTitles objectAtIndex:section] : @"-";
    }
    return title;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    id item = nil;
    if (indexPath.section < [self.items count]) {
        NSArray *sectionItems = [self.items objectAtIndex:indexPath.section];
        if (indexPath.row < [sectionItems count]) {
            item = sectionItems[(NSUInteger) indexPath.row];
        }
    }
    return item;
}

- (NSIndexPath *)indexOfObject:(id)anObject {
    
    NSIndexPath *indexPath;
    NSInteger section = 0;
    for (NSArray *sectionItems in self.items) {
        
        NSUInteger row = [sectionItems indexOfObject:anObject];
        if (row != NSNotFound) {
            
            indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            break;
        }
        section++;
    }
    return indexPath;
}

- (void)removeItem:(id)item {
    
    for (NSMutableArray *sectionItems in self.items) {
     
        if([sectionItems containsObject:item]){
            
            [sectionItems removeObject:item];
        }
    }
}

- (void)removeItemAtIndex:(NSIndexPath *)indexPath {
    
    if (indexPath.section < [self.items count]) {
        NSMutableArray *sectionItems = [[self.items objectAtIndex:indexPath.section] mutableCopy];
        if (indexPath.row < [sectionItems count]) {
            
            [sectionItems removeObjectAtIndex:(NSUInteger)indexPath.row];
//            if (sectionItems.count == 0) {
//                
//                [self.items removeObjectAtIndex:indexPath.section];
//                sectionItems = nil;
//            }
        }
        
        if (sectionItems) {
            
            self.items[indexPath.section] = sectionItems;
        }
    }
}

- (id)headerAtIndex:(NSUInteger)index {
    
    id item = nil;
    if (index < [self.sectionTitles count]) {
       
        item = self.sectionTitles[index];
    }
    return item;
}

@end
