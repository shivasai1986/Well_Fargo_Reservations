//
//  ViewController.m
//  Reservation
//
//  Created by Shiva Sai Rudra on 31/01/17.
//  Copyright © 2017 Shiva. All rights reserved.
//

#import "ViewController.h"
#import "PageContentViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //loaded images to array to process scroll view
    _pageImages = @[@"image1.png", @"image2.png", @"image3.png"];
    
    //Initiating Page View controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    //Bring all the subview to front so that scrolling effect lies behind the subviews
    [self.view bringSubviewToFront:self.pageControl];
    [self.view bringSubviewToFront:self.btnReserve];
    [self.view bringSubviewToFront:self.tblServices];
    
    //Setting properties for Page Control
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.backgroundColor = [UIColor clearColor];
    [_pageControl setOpaque:NO];
    _pageControl.frame = CGRectMake(110,5,100,100);
    _pageControl.numberOfPages=[self.pageImages count];
    _pageControl.currentPage=0;
    [self.view addSubview:_pageControl];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Page View Controller Datasource methods
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    
    if (index == [self.pageImages count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

NSUInteger currentIndex = 0;

#pragma mark - Page View Controller delegate methods to Calculate the current index
- (void)pageViewController:(UIPageViewController *)pageViewController
willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers{
    
    currentIndex = ((PageContentViewController*) pendingViewControllers[0]).pageIndex;
}

- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers
       transitionCompleted:(BOOL)completed{
    if (completed) {
        [self.pageControl setCurrentPage:currentIndex ? currentIndex : 0];
        
        [self setReserveButtonState];
    }
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageImages count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageImages count] == 0) || (index >= [self.pageImages count])) {
        return nil;
    }
    //Creating instance to Page content control and setting upi properties for image file and page index
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.pageIndex = index;
    return pageContentViewController;
}

//Page Changed event to change the page when click on Page Control
- (IBAction)pageChanged:(id)sender {
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:_pageControl.currentPage];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    currentIndex = _pageControl.currentPage;
    
    [self setReserveButtonState];
}

//Setting Reserve button state to only Hot Stone Massage
-(void)setReserveButtonState
{
    if (currentIndex == 0 || !currentIndex) {
        _btnReserve.enabled = YES;
        _btnReserve.backgroundColor = [UIColor colorWithRed:57.0/255.0f green:92.0/255.0f blue:209.0/255.0f alpha:1.0f];
    }
    else{
        _btnReserve.enabled = NO;
        _btnReserve.backgroundColor = [UIColor grayColor];
    }
}
@end
