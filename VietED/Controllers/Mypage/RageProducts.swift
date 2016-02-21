//
//  VEDPayMentWithPurcharseViewController.swift
//  VietED
//
//  Created by Phung Long on 12/28/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import Foundation

// Use enum as a simple namespace.  (It has no cases so you can't instantiate it.)
public enum RageProducts {
  
  /// TODO:  Change this to whatever you set on iTunes connect
  private static let Prefix = "VietED."
  
  /// MARK: - Supported Product Identifiers
    public static let BeginnerCourse = Prefix + "BeginnerCourse"
    public static let SecondCourse          = Prefix + "SecondCourse"

  
  
  // All of the products assembled into a set of product identifiers.
  private static let productIdentifiers: Set<ProductIdentifier> = [RageProducts.BeginnerCourse,RageProducts.SecondCourse]
  
  /// Static instance of IAPHelper that for rage products.
  public static let store = IAPHelper(productIdentifiers: RageProducts.productIdentifiers)
}

/// Return the resourcename for the product identifier.
func resourceNameForProductIdentifier(productIdentifier: String) -> String? {
  return productIdentifier.componentsSeparatedByString(".").last
}