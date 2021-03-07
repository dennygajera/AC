//
//  Constant.swift
//  Whislte
//
//  Created by Darshan Gajera on 5/14/18.
//  Copyright © 2020. All rights reserved.
//
import UIKit
struct GlobalConstants {
    static let APPNAME = "Golf"
    static let spreadSheetID = "15tuICf8aQrDcTJIi_7clfvNaVY00A-QdNQeL53Hf4Kg"
    static let apiKey = "AIzaSyC_AC3OMZwoYigZdvkbjMd55XmRpelLv4c"
    static let clientId = "787090180691-f0qc3v72uf2frqul8mr6o7s6nlsnvju0.apps.googleusercontent.com"
    static let w9FormLink = "https://loyalfansonly.com/welcome/w9form/"
    static let SiteURL = "https://loyalfansonly.com/"
    static let wFormLink = "https://loyalfansonly.com/wform/"
    
    static let privacy = "https://loyalfansonly.com/privacy-policy"
    static let terms = "https://loyalfansonly.com/terms-service"
}

enum Storyboard: String {
    case main    = "Main"
    case comment    = "Comment"
    case bank    = "Bank"
    case Calendar    = "WWCalendarTimeSelector"
    case VideoPreview  = "VideoPreview"
    case SinglePost  = "SinglePost"
    
    func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

enum Color: String {
    case SliderSelction  = "0080ff"
    case SliderDefault  = "0048b1"
    case SliderTextSelection  = "ffffff"
    case SliderTextDefault  = "7887b5"
    case AppColorCode  = "7142E3"
    case SupporterColorCode  = "e9dae7"
    case errorRed  = "EA2E31"
    case errorGreen  = "5DC15D"
    case TransactionFailed  = "ff4e4e"
    case TransactionSuccess  = "00a71c"
    case TransactionPending  = "ffbf00"
    case WalletFailed  = "ff3b3b"
    case WhiteDarkMode  = "feffff"
    func color() -> UIColor {
        return UIColor.hexStringToUIColor(hex: self.rawValue)
    }
}

struct NotificationType {
    static let tip  = "tip" // Notification Tip
    static let comment  = "comment" // Comment
    static let payPPV  = "payPPV" //Notification ALL
    static let ppvToUser  = "ppvToUser" // PPV history
    static let seenPPV  = "seenPPV" //  Notification ALL
    static let subscribe  = "subscribe" // Other profile
    static let following  = "following" // Other profile
    static let likeComment  = "likeComment" //Comment
    static let likePost  = "likePost" // SinglePost
}

enum Identifier: String {
    // Main Storyboard
    case rightMenu = "RightMenuVC"
    case rightMenuCell = "RightMenuCell"
    
    case ConfirmationPopUp = "ConfirmationPopUpVC"
    case ViewController = "ViewController"
    case signup = "SignUpVC"
    case login = "LoginVC"
    case forgotPassword = "ForgotVC"
    case home = "HomeVC"
    case selectPackage = "SelectPackageVC"
    case packageTVC = "PackageTVC"
    case shoppingCart = "ShoppingCartVC"
    case cartTVC = "CartTVC"
    case cartTotalTVC = "CartTotalTVC"
    case payment = "PaymentVC"
    
    
    
    
    case sendOtp = "SendOTPVC"
    case side = "SideVC"
    case PPVHistory = "PPVHistoryVC"
    case AddPPL = "AddPPLVC"
    case Followers = "FollowersVC"
    case SendToFan = "SendToFanVC"
    
    case MyProfile = "MyProfileVC"
    case MyProfileTab = "MyProfileTabVC"
    case MyProfilePost = "MyProfilePostVC"
    case EditPost = "EditPostVC"
    case Notification = "Notification"
    case EditProfile = "EditProfileVC"
    case AddSubscription = "AddSubscriptionVC"
    case FanChild = "FanChildVC"
    case Fan = "FanVC"
    case Following = "FollowingVC"
    case FollowingChild = "FollowingChildVC"
    case Favourite = "FavouriteVC"
    case FavouriteChild = "FavouriteChildVC"
    case ChangePassword = "ChangePasswordVC"
    case ProfileNotification = "ProfileNotificationVC"
    case Security = "SecurityVC"
    case AddCard = "AddCardVC"
    case OtherProfile = "OtherProfileVC"
    case OtherProfileTab = "OtherProfileTabVC"
    case OtherProfilePost = "OtherProfilePostVC"
    case Comment = "CommentVC"
    case AddBank = "AddBankVC"
    case Bank = "BankVC"
    case W9 = "W9VC"
    case W9FormStatus = "W9FormStatusVC"
    case BankTransfer = "BankTransferVC"
    case NotificationData = "NotificationDataVC"
    case Zoom = "ZoomVC"
    case Statement = "StatementVC"
    case WithdrawRequest = "WithdrawRequestVC"
    case PaymentHistory = "PaymentHistoryVC"
    case OtherMessageDetail = "OtherMessageDetailVC"
    case VideoPreview = "VideoPreviewVC"
    case AnalyticsData = "AnalyticsDataVC"
    case Analytics = "AnalyticsVC"
    case OtherProfileVC = "OtherProfile"
    case SinglePost = "SinglePostVC"
    case Help = "HelpVC"
    case ReportAbuse = "ReportAbuseVC"
    case BlockedUser = "BlockedUserVC"
    
    //Tab bar
    case tab = "TabBar"
    
    //Tableview cell
    case HomeCell = "HomeCell"
    case SearchCell = "SearchCell"
    case SideCell = "SideCell"
    case PpvHeader = "cellHeader"
    case PpvData = "cellPpvData"
    case OtherMessage = "OtherMessageCell"
    case FollowersCell = "FollowersCell"
    case FanCell = "FanCell"
    case FanChildCell = "FanChildCell"
    case FollowingChildCell = "FollowingChildCell"
    case FavouriteProfile = "FavouriteProfileCell"
    case SuggestionCell = "SuggestionCell"
    case CommentCell = "CommentCell"
    case NotificationDataCell = "NotificationDataCell"
//    Collectionview cell
    case SelectImage = "SelectImageCell"
    case AddPPLCell = "AddPPLCell"
    case BankInfoCell = "BankInfoCell"
    case TypeCell = "TypeCell"
    case EarningCell = "EarningCell"
    case PayoutRequestCell = "PayoutRequestCell"
    case EarningStatisticsCell = "EarningStatisticsCell"
    case PaymentHistoryCell = "PaymentHistoryCell"
    case OtherMessageDetailCell = "OtherMessageDetailCell"
    case MyMessageCell = "MyMessageCell"
    case EarningAnalyticsCell = "EarningAnalyticsCell"
    case SeenCell = "SeenCell"
    case OtherProfileData = "OtherProfileData"
    case OtherProfileHeaderCell = "OtherProfileHeaderCell"
}

struct TabbarIcon {
    static let Home = "icoHome"
    static let HomeSelected = "icoSelectedHome"
    
    static let Search = "icoSearch"
    static let SearchSelected = "icoSelectedSearch"
    
    static let Add = "icoAdd"
    static let AddSelected = "icoAdd"
    
    static let Notification = "icoNotification"
    static let NotificationSelected = "icoSelectedNotification"
    
    static let Profile = "icoAvatarUnselected"
    static let ProfileSelected = "icoAvatar"
}


struct FirebaseCollection {
    // Main Storyboard
    static let User  = "Users"
    static let Feedback  = "Feedback"
    static let Food  = "Food Vendors"
    static let Floor  = "Floor Plan"
    static let Exhibitor  = "Exhibit Vendors"
    static let Sponsors  = "Sponsors"
    static let Schedule  = "Schedule"
}

struct FirebaseLogEvent {
    static let Login  = "iOS_Login"
    static let ProfileAccept  = "iOS_ProfileAccept"
    static let BuyAddOn  = "iOS_BuyAddOn"
    static let UseSpeakOn  = "iOS_UseSpeakOn"
    static let UseReverse  = "iOS_UseReverse"
}

struct FirebaseLogParameter {
    static let loginUsername  = "loginUsername"
    static let loginUserFbID  = "loginUserFbID"
    static let acceptUsername  = "acceptUsername"
    static let acceptUserFbID  = "acceptUserFbID"
    static let addOnType  = "addOnType"
}

struct ErrorMesssages {
    static let PPV0 = "PPV price must be greater than 0"
    static let NotFans = "You don't have any fans"
    static let emptyGameId = "Please enter Game ID!"
    static let emptyTicketId = "Please enter Ticket ID!"
    static let emptyPhone = "Please enter phone number"
    static let validPhone = "Please enter valid phone number"
    static let SelectImage = "Please select image."
    static let validOtp = "Please enter valid OTP"
    static let wrongOTP = "Please enter valid OTP"
    static let wrong = "Something Went Wrong!"
    static let EmptyGameName = "Please enter game name"
    static let TicketAlready = "Ticket ID already added"
    static let MultipleGame = "You can't play multiple game at a same time"
    static let AtleastOneTicket = "Add atleast one ticket"
    static let CreateAtleastOneTicket = "Create atleast one ticket"
    static let EmptyUsername = "Username must not be empty"
    static let EmptyEmail = "Email must not be empty"
    static let ValidEmail = "Please enter valid email."
    static let SelectGender = "Please select your gender"
    static let EmptyDateofbirth = "Please enter date of birth."
    static let EmptyCurrentPassword = "Please enter current password."
    static let EmptyNewPassword = "Please enter new Password."
    static let EmptyConfirmPassword = "Please enter confirm password."
    static let PasswordMatched = "Password did not matched."
    static let ValidAmount = "Please enter valid amount."
    static let EmptyAmount = "Please enter tip amount."
    static let EmptyPassword = "Please enter Password."
    static let EmptyName = "Please enter Name."
    static let NoFollowers = "No followers found."
    static let EmptyCountry = "Enter valid country"
    static let EmptyNameOnCard = "Enter valid name on card"
    static let EmptyCardNumber = "Enter valid card number"
    static let EmptyMonth = "Enter valid month"
    static let EmptyYear = "Enter valid year"
    static let EmptyCvv = "Enter valid cvv"
    static let ConfirmAge = "Please confirm that you are atleast 18 years old."
    static let SelectPolicy = "Please accept our terms"
    //Bank
    static let EmptyFirstName = "Please enter firstname"
    static let EmptyLastName = "Please enter lastname"
    static let EmptyPhone = "Please enter phone"
    static let EmptyTaxID = "Please enter tax ID or social security number"
    static let EmptyStreet = "Please enter street"
    static let EmptyState = "Please enter state"
    static let EmptyCity = "Please enter city"
    static let EmptyZipCode = "Please enter zip or postal code"
    static let EmptyDateOfBirth = "Please enter date of birth"
    static let EmptyDocument = "Please select documents"
    static let EmptyIdExpirationDate = "Please enter ID expiration date"
    
    
    static let EmptyroutingNumber = "Please enter routing number"
    static let EmptyAccountNumber = "Please enter account number"
    static let EmptytypeOfBankAccount = "Please select type of bank account"
    
    
    static let CommentBlack = "Enter comment first"
    static let IdProof = "Please select id proof"
    
    static let BlankDescription = "Please enter description"
}

struct SuccessMessages {
    static let TicketBogusSuccessfully = "Ticket declared bogus."
    static let TicketNumberCopied = "Ticket number copied."
    static let ForcefullyUpdate = "New version is available in app store, Please update app for better experiece"
    static let ProfileUpdateSuccessfully = "Profile Update Successfully"
}
