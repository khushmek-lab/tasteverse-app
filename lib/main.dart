import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SuperFoodGlobalApp());
}

// ==========================================
// ૦. ગ્લોબલ અને પાન-ઇન્ડિયા ભાષા સિસ્ટમ (Default: English)
// ==========================================

class LanguageOption {
  final String code;
  final String nativeName;
  final String englishName;
  final bool isRtl;

  const LanguageOption({
    required this.code,
    required this.nativeName,
    required this.englishName,
    this.isRtl = false,
  });
}

const List<LanguageOption> kSupportedLanguages = [
  LanguageOption(code: 'en', nativeName: 'English', englishName: 'English (Default)'),
  LanguageOption(code: 'gu', nativeName: 'ગુજરાતી', englishName: 'Gujarati'),
  LanguageOption(code: 'hi', nativeName: 'हिन्दी', englishName: 'Hindi'),
  LanguageOption(code: 'pa', nativeName: 'ਪੰਜਾਬੀ', englishName: 'Punjabi'),
  LanguageOption(code: 'ta', nativeName: 'தமிழ்', englishName: 'Tamil'),
  LanguageOption(code: 'te', nativeName: 'తెలుగు', englishName: 'Telugu'),
  LanguageOption(code: 'ur', nativeName: 'اردو', englishName: 'Urdu', isRtl: true),
  LanguageOption(code: 'mr', nativeName: 'मराठी', englishName: 'Marathi'),
  LanguageOption(code: 'bn', nativeName: 'বাংলা', englishName: 'Bengali'),
  LanguageOption(code: 'kn', nativeName: 'ಕನ್ನಡ', englishName: 'Kannada'),
  LanguageOption(code: 'ml', nativeName: 'മലയാളം', englishName: 'Malayalam'),
];

const List<String> kAllCityKeys = [
  'city_all',
  'city_junagadh',
  'city_rajkot',
  'city_ahmedabad',
  'city_surat',
  'city_mumbai',
];

const List<String> kAllCategoryKeys = [
  'cat_all',
  'cat_kathiyawadi',
  'cat_curry',
  'cat_snacks',
  'cat_sweets',
  'cat_healthy',
];

String safeInitial(String text, [String fallback = 'C']) {
  final trimmed = text.trim();
  if (trimmed.isEmpty) return fallback;
  return trimmed.characters.first.toUpperCase();
}

class AppTranslations {
  static final Map<String, Map<String, String>> _data = {
    'en': {
      'app_title': 'TasteVerse SuperApp',
      'nav_reels': 'Reels',
      'nav_market': 'Explore',
      'nav_studio': 'Chef Studio',
      'nav_rapido': 'Rider Radar',
      'nav_orders': 'Orders & Hub',
      'select_language': 'Select App Language',
      'language_subtitle': 'Global & Pan-India Multi-Language Support',
      'city_all': 'All Global / India',
      'city_junagadh': 'Junagadh',
      'city_rajkot': 'Rajkot',
      'city_ahmedabad': 'Ahmedabad',
      'city_surat': 'Surat',
      'city_mumbai': 'Mumbai',
      'cat_all': 'All Cravings',
      'cat_kathiyawadi': 'Kathiyawadi',
      'cat_curry': 'Home Thali & Curry',
      'cat_snacks': 'Street & Snacks',
      'cat_sweets': 'Desi Sweets',
      'cat_healthy': 'Healthy & Diet',
      'live_stories': 'Live Home Kitchens Near You',
      'hero_tag': '100% ESCROW PROTECTED • WOMEN & HOME CHEF EMPOWERMENT',
      'hero_title': 'Watch Live Cooking.\nOrder Fresh Home Food.',
      'hero_sub': 'Money stays safe in Escrow until you eat & rate 3+ stars!',
      'search_hint': 'Search dishes, home chefs in Junagadh, Rajkot...',
      'order_now': 'Order Now',
      'watch_live': 'Watch Live',
      'out_of_stock': 'Sold Out',
      'per_plate': 'per plate',
      'fresh_timer': 'Fresh Batch',
      'remaining': 'left',
      'expired': 'Batch Expired',
      'follow': '+ Follow',
      'following': 'Following',
      'live_badge': 'LIVE COOKING',
      'hygiene_verified': '100% Home Hygiene & ID Verified',
      'chef_studio': 'Home Chef Creator Studio',
      'kyc_verified': 'Govt ID Verified',
      'kyc_pending': 'ID Unverified',
      'escrow_vault': 'Escrow Vault (On Hold)',
      'bank_payout': 'Released Bank Earnings',
      'step1_camera': '1. Live Camera Studio (Mandatory Video-First Rule)',
      'camera_ready': 'Live Cooking Reel Captured & Verified',
      'tap_shoot': 'Tap to Open Live Kitchen Camera',
      'step2_menu': '2. Dish Pricing & Smart Rules',
      'dish_name_hint': 'Dish Name (48-Hr No-Repeat Rule Applies)',
      'price_label': 'Price (₹)',
      'prep_time_label': 'Prep (Mins)',
      'publish_btn': 'Go Live & Sell for 4 Hours',
      'active_kitchen_menu': '3. Your Active Live Batches (Auto-Expires in 4h)',
      'rider_hub': 'Rapido-Style Delivery Radar',
      'duty_on': 'ON DUTY - GPS ACTIVE',
      'duty_off': 'OFF DUTY',
      'rider_earnings': 'Instant Rider Payouts',
      'no_deliveries': 'Radar Scanning... No active pickups nearby.',
      'btn_pickup': 'Verify Pickup & Start Ride',
      'btn_deliver': 'Verify Customer OTP & Complete Delivery',
      'orders_vault_title': 'Live Orders, Escrow Vault & Settings',
      'no_orders': 'No active orders yet. Explore Reels or Market to order!',
      'escrow_held_banner': 'ESCROW LOCKED: Money held safely until delivery & taste review.',
      'escrow_released_banner': 'ESCROW RELEASED: 90% transferred to Chef & Delivery fee to Rider!',
      'escrow_dispute_banner': 'ESCROW ON HOLD: Low rating/dispute reported.',
      'escrow_refunded_banner': 'ESCROW REFUNDED: Order rejected; 100% refunded to customer.',
      'chef_accept': 'Chef: Accept & Cook',
      'chef_reject': 'Reject',
      'btn_taste_review': 'Taste & Rate to Release Chef Payment',
      'checkout_title': 'SuperApp Secure Escrow Checkout',
      'plate_qty': 'Select Quantity (Plates):',
      'food_total': 'Home Food Total:',
      'delivery_fee': 'Rapido Partner Delivery Fee:',
      'escrow_fee': 'Escrow Buyer Protection:',
      'free': 'FREE',
      'grand_total': 'Total Payable (Held in Escrow):',
      'cust_name': 'Your Full Name',
      'cust_phone': '10-Digit Mobile Number',
      'cust_address': 'Complete Delivery Address (Junagadh / Rajkot / Global)',
      'btn_pay_escrow': 'Pay into Escrow Vault',
      'err_kyc': 'Complete Govt ID KYC first!',
      'err_video': 'Mandatory: Shoot live cooking video before listing!',
      'err_dish': 'Enter valid dish name and price!',
      'err_repeat': '48-Hour Rule: You cannot repeat the same dish within 2 days!',
      'msg_live': 'Reel & Dish are now LIVE for 4 hours!',
      'err_form': 'Please enter your name, valid 10-digit mobile, and address!',
      'err_duty_off': 'Switch ON DUTY first to accept or complete rides!',
      'err_invalid_otp': 'Invalid OTP! Please enter the 4-digit Customer OTP.',
    },
    'gu': {
      'app_title': 'ઘરની રસોઈ SuperApp',
      'nav_reels': 'રીલ્સ',
      'nav_market': 'માર્કેટ',
      'nav_studio': 'શેફ સ્ટુડિયો',
      'nav_rapido': 'રાઈડર રડાર',
      'nav_orders': 'ઓર્ડર/સેટિંગ',
      'select_language': 'ભાષા પસંદ કરો (Select Language)',
      'language_subtitle': 'ભારત અને ગ્લોબલ મલ્ટી-લેંગ્વેજ સપોર્ટ',
      'city_all': 'બધા શહેર (Global)',
      'city_junagadh': 'જૂનાગઢ',
      'city_rajkot': 'રાજકોટ',
      'city_ahmedabad': 'અમદાવાદ',
      'city_surat': 'સુરત',
      'city_mumbai': 'મુંબઈ',
      'cat_all': 'બધી વાનગી',
      'cat_kathiyawadi': 'કાઠિયાવાડી',
      'cat_curry': 'ગુજરાતી થાળી/શાક',
      'cat_snacks': 'ગરમ નાસ્તો',
      'cat_sweets': 'દેશી મીઠાઈ',
      'cat_healthy': 'હેલ્ધી ફૂડ',
      'live_stories': 'લાઈવ ઘરના રસોડા (Live Stories)',
      'hero_tag': '૧૦૦% એસ્ક્રો સુરક્ષા • મહિલા અને હોમ-શેફ સશક્તિકરણ',
      'hero_title': 'લાઈવ રસોઈ જુઓ.\nતાજું ઘરનું જમવાનું મંગાવો.',
      'hero_sub': 'તમે જમીને સારો રિવ્યુ આપો પછી જ શેફને પૈસા મળશે!',
      'search_hint': 'જૂનાગઢ, રાજકોટમાં વાનગી કે શેફ શોધો...',
      'order_now': 'ઓર્ડર કરો',
      'watch_live': 'લાઈવ જુઓ',
      'out_of_stock': 'સ્ટોક પૂરો',
      'per_plate': 'પ્રતિ પ્લેટ',
      'fresh_timer': 'તાજી બેચ',
      'remaining': 'બાકી',
      'expired': 'સમય પૂરો',
      'follow': '+ ફોલો',
      'following': 'ફોલોઈંગ',
      'live_badge': 'LIVE રસોઈ',
      'hygiene_verified': '૧૦૦% ઘરની ચોખ્ખાઈ અને આઈડી વેરિફાઈડ',
      'chef_studio': 'હોમ-શેફ ક્રિએટર સ્ટુડિયો',
      'kyc_verified': 'આઈડી વેરિફાઈડ',
      'kyc_pending': 'KYC બાકી',
      'escrow_vault': 'એસ્ક્રો હોલ્ડ (રિવ્યુ બાકી)',
      'bank_payout': 'બેંક ખાતામાં જમા કમાણી',
      'step1_camera': '૧. લાઈવ કેમેરા સ્ટુડિયો (વિડિયો વગર મેનુ નહીં બને)',
      'camera_ready': 'લાઈવ કુકિંગ વિડિયો રેકોર્ડ થઈ ગયો છે',
      'tap_shoot': 'અહીં ટચ કરીને લાઈવ રસોઈનો વિડિયો શૂટ કરો',
      'step2_menu': '૨. વાનગીની વિગત અને ભાવ',
      'dish_name_hint': 'વાનગીનું નામ (૨ દિવસ સુધી રિપીટ નહીં થાય)',
      'price_label': 'ભાવ (₹)',
      'prep_time_label': 'સમય (મિનિટ)',
      'publish_btn': '૪ કલાક માટે લાઈવ વેચવા મૂકો',
      'active_kitchen_menu': '૩. તમારી લાઈવ વાનગીઓ (૪ કલાકનું ઓટો-ટાઈમર)',
      'rider_hub': 'Rapido સ્ટાઈલ ડિલિવરી રડાર',
      'duty_on': 'ઓન ડ્યુટી - GPS ચાલુ છે',
      'duty_off': 'ઓફ ડ્યુટી',
      'rider_earnings': 'રાઈડરની કુલ કમાણી',
      'no_deliveries': 'રડાર સ્કેનિંગ... હાલ કોઈ પિકઅપ ઓર્ડર નથી.',
      'btn_pickup': 'પાર્સલ પિકઅપ કરો અને રાઈડ શરૂ કરો',
      'btn_deliver': 'ગ્રાહક OTP વેરિફાય કરી ડિલિવરી પૂર્ણ કરો',
      'orders_vault_title': 'લાઈવ ઓર્ડર, એસ્ક્રો વોલ્ટ અને ભાષા સેટિંગ',
      'no_orders': 'હજુ કોઈ ઓર્ડર નથી. રીલ્સ કે માર્કેટમાંથી ઓર્ડર કરો!',
      'escrow_held_banner': 'એસ્ક્રો લોક: ડિલિવરી અને તમારા રિવ્યુ સુધી પૈસા સુરક્ષિત હોલ્ડ પર છે.',
      'escrow_released_banner': 'એસ્ક્રો રિલીઝ: તમારા સારા રિવ્યુ બાદ શેફના ખાતામાં પૈસા જમા થઈ ગયા!',
      'escrow_dispute_banner': 'એસ્ક્રો હોલ્ડ: ફરિયાદના કારણે પેમેન્ટ રોકવામાં આવ્યું છે.',
      'escrow_refunded_banner': 'એસ્ક્રો રિફંડ: ઓર્ડર રદ થવાથી ૧૦૦% રકમ ગ્રાહકને પાછી મળી ગઈ છે.',
      'chef_accept': 'શેફ: ઓર્ડર સ્વીકારો',
      'chef_reject': 'રદ કરો',
      'btn_taste_review': 'જમવાનો ટેસ્ટ રિવ્યુ આપો અને પેમેન્ટ રિલીઝ કરો',
      'checkout_title': 'સુરક્ષિત એસ્ક્રો ચેકઆઉટ',
      'plate_qty': 'પ્લેટની સંખ્યા:',
      'food_total': 'વાનગીનું બિલ:',
      'delivery_fee': 'ડિલિવરી પાર્ટનર ચાર્જ:',
      'escrow_fee': 'એસ્ક્રો ગ્રાહક સુરક્ષા:',
      'free': 'ફ્રી',
      'grand_total': 'કુલ રકમ (એસ્ક્રોમાં સુરક્ષિત રહેશે):',
      'cust_name': 'તમારું પૂરું નામ',
      'cust_phone': '૧૦ અંકનો મોબાઈલ નંબર',
      'cust_address': 'ડિલિવરીનું પૂરું સરનામું (જૂનાગઢ / રાજકોટ)',
      'btn_pay_escrow': 'એસ્ક્રો સુરક્ષા સાથે ઓર્ડર કન્ફર્મ કરો',
      'err_kyc': 'પહેલાં સરકારી આઈડી KYC પૂર્ણ કરો!',
      'err_video': 'નિયમ: પહેલાં લાઈવ રસોઈનો વિડિયો શૂટ કરવો ફરજિયાત છે!',
      'err_dish': 'વાનગીનું સાચું નામ અને ભાવ લખો!',
      'err_repeat': 'નિયમ: એકની એક વાનગી ૨ દિવસ (૪૮ કલાક) પછી જ ફરીથી મૂકી શકાશે!',
      'msg_live': 'તમારી રીલ અને વાનગી ૪ કલાક માટે લાઈવ થઈ ગઈ છે!',
      'err_form': 'કૃપા કરીને પૂરું નામ, ૧૦ અંકનો મોબાઈલ નંબર અને સરનામું ભરો!',
      'err_duty_off': 'રાઈડ શરૂ કરવા માટે પહેલાં ON DUTY સ્વીચ ચાલુ કરો!',
      'err_invalid_otp': 'ખોટો OTP! કૃપા કરીને સાચો ૪-અંકનો ગ્રાહક OTP નાખો.',
    },
    'hi': {
      'app_title': 'घर की रसोई SuperApp',
      'nav_reels': 'रील्स',
      'nav_market': 'मार्केट',
      'nav_studio': 'शेफ स्टूडियो',
      'nav_rapido': 'राइडर रडार',
      'nav_orders': 'ऑर्डर/सेटिंग',
      'select_language': 'भाषा चुनें (Select Language)',
      'city_all': 'सभी शहर',
      'city_junagadh': 'जूनागढ़',
      'city_rajkot': 'राजकोट',
      'order_now': 'ऑर्डर करें',
      'out_of_stock': 'स्टॉक समाप्त',
      'live_stories': 'लाइव होम किचन (Live Stories)',
      'hero_title': 'लाइव कुकिंग देखें।\nताज़ा घर का खाना मंगाएं।',
      'publish_btn': '4 घंटे के लिए लाइव बेचें',
      'btn_pay_escrow': 'एस्क्रो सुरक्षा के साथ ऑर्डर करें',
    },
    'pa': {
      'app_title': 'ਘਰ ਦੀ ਰਸੋਈ SuperApp',
      'nav_reels': 'ਰੀਲਜ਼',
      'nav_market': 'ਮਾਰਕੀਟ',
      'nav_studio': 'ਸ਼ੈੱਫ ਸਟੂਡੀਓ',
      'nav_rapido': 'ਰਾਈਡਰ',
      'nav_orders': 'ਆਰਡਰ',
      'order_now': 'ਆਰਡਰ ਕਰੋ',
    },
    'ta': {
      'app_title': 'வீட்டு சமையல் SuperApp',
      'nav_reels': 'ரீல்ஸ்',
      'nav_market': 'சந்தை',
      'nav_studio': 'செஃப் ஸ்டுடியோ',
      'nav_rapido': 'ரைடர்',
      'nav_orders': 'ஆர்டர்கள்',
      'order_now': 'ஆர்டர் செய்',
    },
    'te': {
      'app_title': 'ఇంటి వంట SuperApp',
      'nav_reels': 'రీల్స్',
      'nav_market': 'మార్కెట్',
      'nav_studio': 'చెఫ్ స్టూడియో',
      'nav_rapido': 'రైడర్',
      'nav_orders': 'ఆర్డర్లు',
      'order_now': 'ఆర్డర్ చేయండి',
    },
    'ur': {
      'app_title': 'گھر کا کچن SuperApp',
      'nav_reels': 'ریلز',
      'nav_market': 'مارکیٹ',
      'nav_studio': 'شیف اسٹوڈیو',
      'nav_rapido': 'رائیڈر ریڈار',
      'nav_orders': 'آرڈرز',
      'order_now': 'آرڈر کریں',
    },
    'mr': {
      'app_title': 'घरचा स्वयंपाक SuperApp',
      'nav_reels': 'रील्स',
      'nav_market': 'मार्केट',
      'order_now': 'ऑर्डर करा',
    },
    'bn': {
      'app_title': 'ঘরের রান্না SuperApp',
      'nav_reels': 'রিলস',
      'nav_market': 'মার্কেট',
      'order_now': 'অর্ডার করুন',
    },
    'kn': {
      'app_title': 'ಮನೆ ಅಡುಗೆ SuperApp',
      'nav_reels': 'ರೀಲ್ಸ್',
      'nav_market': 'ಮಾರುಕಟ್ಟೆ',
      'order_now': 'ಆರ್ಡರ್ ಮಾಡಿ',
    },
    'ml': {
      'app_title': 'വീട്ടിലെ പാചകം SuperApp',
      'nav_reels': 'റീൽസ്',
      'nav_market': 'മാർക്കറ്റ്',
      'order_now': 'ഓർഡർ ചെയ്യുക',
    },
  };

  static String tr(String langCode, String key) {
    return _data[langCode]?[key] ?? _data['en']![key] ?? key;
  }
}

// ==========================================
// ૧. ડેટા મોડલ્સ (Models for SuperApp)
// ==========================================

class DishItem {
  final String id;
  final String name;
  final String chefName;
  final String kitchenName;
  final String cityKey;
  final double price;
  final String categoryKey;
  final int prepTimeMins;
  final DateTime createdAt;
  final DateTime expiresAt;
  final String imageUrl;
  final List<Color> fallbackGradient;
  bool isAvailable;
  int likesCount;
  bool isLikedByMe;
  bool isChefFollowed;
  double rating;
  int liveViewers;

  DishItem({
    required this.id,
    required this.name,
    required this.chefName,
    required this.kitchenName,
    required this.cityKey,
    required this.price,
    required this.categoryKey,
    required this.prepTimeMins,
    required this.createdAt,
    required this.expiresAt,
    required this.imageUrl,
    required this.fallbackGradient,
    this.isAvailable = true,
    this.likesCount = 120,
    this.isLikedByMe = false,
    this.isChefFollowed = false,
    this.rating = 4.9,
    this.liveViewers = 42,
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);
  bool get canOrder => isAvailable && !isExpired;

  String remainingFreshnessText(String lang) {
    final diff = expiresAt.difference(DateTime.now());
    if (diff.isNegative) return AppTranslations.tr(lang, 'expired');
    final hours = diff.inHours;
    final mins = diff.inMinutes % 60;
    return "${hours}h ${mins}m ${AppTranslations.tr(lang, 'remaining')}";
  }
}

class OrderItem {
  final String id;
  final String dishId;
  final String dishName;
  final String chefName;
  final String cityKey;
  final int quantity;
  final double foodTotal;
  final double deliveryFee;
  final double totalPrice;
  final String customerName;
  final String mobileNumber;
  final String address;
  final String deliveryOtp;
  final double distanceKm;
  final DateTime orderedAt;
  String orderStatus; // 'Pending', 'Accepted', 'PickedUp', 'Delivered', 'Rejected'
  String escrowStatus; // 'HeldInEscrow', 'ReleasedToChef', 'Disputed', 'Refunded'
  int? customerRating;
  String? customerReview;

  OrderItem({
    required this.id,
    required this.dishId,
    required this.dishName,
    required this.chefName,
    required this.cityKey,
    required this.quantity,
    required this.foodTotal,
    required this.deliveryFee,
    required this.totalPrice,
    required this.customerName,
    required this.mobileNumber,
    required this.address,
    required this.deliveryOtp,
    this.distanceKm = 2.4,
    required this.orderedAt,
    this.orderStatus = 'Pending',
    this.escrowStatus = 'HeldInEscrow',
    this.customerRating,
    this.customerReview,
  });
}

// ==========================================
// ૨. રૂટ એપ્લિકેશન (Default English 'en')
// ==========================================

class SuperFoodGlobalApp extends StatefulWidget {
  const SuperFoodGlobalApp({super.key});

  @override
  State<SuperFoodGlobalApp> createState() => _SuperFoodGlobalAppState();
}

class _SuperFoodGlobalAppState extends State<SuperFoodGlobalApp> {
  String _currentLangCode = 'en';

  void _changeLanguage(String code) {
    setState(() {
      _currentLangCode = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    final langObj = kSupportedLanguages.firstWhere(
      (l) => l.code == _currentLangCode,
      orElse: () => kSupportedLanguages.first,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TasteVerse - Global Home Food SuperApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF4500),
          primary: const Color(0xFFFF4500),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F7FB),
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: langObj.isRtl ? TextDirection.rtl : TextDirection.ltr,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: SuperAppMainShell(
        langCode: _currentLangCode,
        onLanguageChanged: _changeLanguage,
      ),
    );
  }
}

// ==========================================
// ૩. સુપર-એપ મેઈન શેલ (5-Tab Global Architecture)
// ==========================================

class SuperAppMainShell extends StatefulWidget {
  final String langCode;
  final Function(String) onLanguageChanged;

  const SuperAppMainShell({
    super.key,
    required this.langCode,
    required this.onLanguageChanged,
  });

  @override
  State<SuperAppMainShell> createState() => _SuperAppMainShellState();
}

class _SuperAppMainShellState extends State<SuperAppMainShell> {
  int _selectedIndex = 0;
  Timer? _freshnessTimer;

  bool isKycVerified = true;
  String verifiedChefLegalName = "Meenaben Patel";
  String kitchenName = "Shreeji Girnar Home Kitchen";
  String chefCityKey = "city_junagadh";
  String kitchenTiming = "8:00 AM - 9:30 PM";
  double deliveryFee = 30.0;

  double escrowHoldBalance = 0.0;
  double chefBankWalletBalance = 2450.0;
  double deliveryPartnerEarnings = 380.0;

  final Map<String, DateTime> _dishUploadHistory = {
    "kathiyawadi lasaniya bateta & bajri rotla":
        DateTime.now().subtract(const Duration(hours: 2)),
    "rajkot special undhiyu, puri & shrikhand":
        DateTime.now().subtract(const Duration(hours: 1)),
  };

  late final List<DishItem> _dishes = [
    DishItem(
      id: '101',
      name: "Kathiyawadi Lasaniya Bateta & Bajri Rotla",
      chefName: "Meenaben Patel",
      kitchenName: "Shreeji Girnar Home Kitchen",
      cityKey: "city_junagadh",
      price: 140,
      categoryKey: "cat_kathiyawadi",
      prepTimeMins: 20,
      createdAt: DateTime.now().subtract(const Duration(minutes: 25)),
      expiresAt: DateTime.now().add(const Duration(hours: 3, minutes: 35)),
      imageUrl:
          "https://images.unsplash.com/photo-1585937421612-70a008356fbe?auto=format&fit=crop&w=900&q=80",
      fallbackGradient: const [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
      likesCount: 342,
      rating: 4.9,
      liveViewers: 86,
    ),
    DishItem(
      id: '102',
      name: "Rajkot Special Undhiyu, Puri & Shrikhand",
      chefName: "Bhavnaben Gohel",
      kitchenName: "Khodiyar Maa Home Rasoi",
      cityKey: "city_rajkot",
      price: 190,
      categoryKey: "cat_curry",
      prepTimeMins: 25,
      createdAt: DateTime.now().subtract(const Duration(minutes: 40)),
      expiresAt: DateTime.now().add(const Duration(hours: 3, minutes: 20)),
      imageUrl:
          "https://images.unsplash.com/photo-1546833999-b9f581a1996d?auto=format&fit=crop&w=900&q=80",
      fallbackGradient: const [Color(0xFFF12711), Color(0xFFF5AF19)],
      likesCount: 518,
      rating: 4.9,
      liveViewers: 124,
    ),
    DishItem(
      id: '103',
      name: "Live Garma-Garam Methi Gota & Kadhi",
      chefName: "Dakshaben Joshi",
      kitchenName: "Saurashtra Swad Kitchen",
      cityKey: "city_junagadh",
      price: 110,
      categoryKey: "cat_snacks",
      prepTimeMins: 15,
      createdAt: DateTime.now().subtract(const Duration(minutes: 15)),
      expiresAt: DateTime.now().add(const Duration(hours: 3, minutes: 45)),
      imageUrl:
          "https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=900&q=80",
      fallbackGradient: const [Color(0xFF11998E), Color(0xFF38EF7D)],
      likesCount: 275,
      rating: 4.8,
      liveViewers: 64,
    ),
    DishItem(
      id: '104',
      name: "Pure Ghee Home-Made Malai Rabdi & Gulab Jamun",
      chefName: "Kiranben Parmar",
      kitchenName: "Royal Rajkot Sweets",
      cityKey: "city_rajkot",
      price: 160,
      categoryKey: "cat_sweets",
      prepTimeMins: 15,
      createdAt: DateTime.now().subtract(const Duration(minutes: 50)),
      expiresAt: DateTime.now().add(const Duration(hours: 3, minutes: 10)),
      imageUrl:
          "https://images.unsplash.com/photo-1589119908995-c6837fa14848?auto=format&fit=crop&w=900&q=80",
      fallbackGradient: const [Color(0xFFEC008C), Color(0xFFFC6767)],
      likesCount: 410,
      rating: 5.0,
      liveViewers: 93,
    ),
  ];

  final List<OrderItem> _orders = [];

  @override
  void initState() {
    super.initState();
    _freshnessTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _freshnessTimer?.cancel();
    super.dispose();
  }

  String t(String key) => AppTranslations.tr(widget.langCode, key);

  void _openLanguageSelector() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFFFF4500),
                    child: Icon(Icons.public, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t('select_language'),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          t('language_subtitle'),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(ctx),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const Divider(height: 20),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: kSupportedLanguages.length,
                  itemBuilder: (context, index) {
                    final lang = kSupportedLanguages[index];
                    final selected = lang.code == widget.langCode;
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: selected ? Colors.deepOrange.shade50 : null,
                      leading: CircleAvatar(
                        backgroundColor: selected
                            ? const Color(0xFFFF4500)
                            : Colors.grey.shade200,
                        child: Text(
                          lang.code.toUpperCase(),
                          style: TextStyle(
                            color: selected ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      title: Text(
                        lang.nativeName,
                        style: TextStyle(
                          fontWeight:
                              selected ? FontWeight.bold : FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(lang.englishName),
                      trailing: selected
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 26,
                            )
                          : null,
                      onTap: () {
                        widget.onLanguageChanged(lang.code);
                        Navigator.pop(ctx);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openCheckoutSheet(DishItem dish) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (ctx) => SuperCheckoutBottomSheet(
        langCode: widget.langCode,
        dish: dish,
        deliveryFee: deliveryFee,
        onConfirmOrder: (order) {
          setState(() {
            _orders.insert(0, order);
            escrowHoldBalance += order.foodTotal;
            _selectedIndex = 4;
          });
        },
      ),
    );
  }

  String? _tryPublishNewDish({
    required String name,
    required double price,
    required String categoryKey,
    required int prepTimeMins,
  }) {
    final cleanKey = name.trim().toLowerCase();

    for (final entry in _dishUploadHistory.entries) {
      if (entry.key == cleanKey) {
        final hours = DateTime.now().difference(entry.value).inHours;
        if (hours < 48) {
          return t('err_repeat');
        }
      }
    }

    for (final existing in _dishes) {
      if (existing.name.trim().toLowerCase() == cleanKey) {
        final hours = DateTime.now().difference(existing.createdAt).inHours;
        if (hours < 48) {
          return t('err_repeat');
        }
      }
    }

    final now = DateTime.now();
    final newDish = DishItem(
      id: now.millisecondsSinceEpoch.toString(),
      name: name.trim(),
      chefName: verifiedChefLegalName,
      kitchenName: kitchenName,
      cityKey: chefCityKey,
      price: price,
      categoryKey: categoryKey,
      prepTimeMins: prepTimeMins,
      createdAt: now,
      expiresAt: now.add(const Duration(hours: 4)),
      imageUrl:
          "https://images.unsplash.com/photo-1565557623262-b51c2513a641?auto=format&fit=crop&w=900&q=80",
      fallbackGradient: const [Color(0xFFFF416C), Color(0xFFFF4B2B)],
      liveViewers: 18,
    );

    setState(() {
      _dishes.insert(0, newDish);
      _dishUploadHistory[cleanKey] = now;
      _selectedIndex = 0;
    });
    return null;
  }

  void _toggleLike(String id) {
    setState(() {
      final idx = _dishes.indexWhere((d) => d.id == id);
      if (idx != -1) {
        _dishes[idx].isLikedByMe = !_dishes[idx].isLikedByMe;
        _dishes[idx].likesCount += _dishes[idx].isLikedByMe ? 1 : -1;
      }
    });
  }

  void _toggleFollow(String id) {
    setState(() {
      final idx = _dishes.indexWhere((d) => d.id == id);
      if (idx != -1) {
        final targetChef = _dishes[idx].chefName;
        final newFollowState = !_dishes[idx].isChefFollowed;
        for (final dish in _dishes) {
          if (dish.chefName == targetChef) {
            dish.isChefFollowed = newFollowState;
          }
        }
      }
    });
  }

  void _toggleDishStock(String id, bool val) {
    setState(() {
      final idx = _dishes.indexWhere((d) => d.id == id);
      if (idx != -1) _dishes[idx].isAvailable = val;
    });
  }

  void _deleteDish(String id) {
    setState(() {
      _dishes.removeWhere((d) => d.id == id);
    });
  }

  void _updateOrderStatus(String orderId, String newStatus) {
    setState(() {
      final idx = _orders.indexWhere((o) => o.id == orderId);
      if (idx != -1) {
        final o = _orders[idx];
        o.orderStatus = newStatus;
        if (newStatus == 'Rejected' && o.escrowStatus == 'HeldInEscrow') {
          escrowHoldBalance =
              (escrowHoldBalance - o.foodTotal).clamp(0.0, double.infinity);
          o.escrowStatus = 'Refunded';
        }
      }
    });
  }

  void _submitCustomerReviewAndReleaseEscrow(
    String orderId,
    int stars,
    String reviewText,
  ) {
    setState(() {
      final idx = _orders.indexWhere((o) => o.id == orderId);
      if (idx == -1) return;
      final o = _orders[idx];
      o.customerRating = stars;
      o.customerReview = reviewText;

      if (o.escrowStatus == 'HeldInEscrow') {
        escrowHoldBalance =
            (escrowHoldBalance - o.foodTotal).clamp(0.0, double.infinity);
        if (stars >= 3) {
          chefBankWalletBalance += (o.foodTotal * 0.90);
          deliveryPartnerEarnings += o.deliveryFee;
          o.escrowStatus = 'ReleasedToChef';
        } else {
          o.escrowStatus = 'Disputed';
        }
      }
    });
  }

  int get _activeRiderTasks => _orders
      .where((o) => o.orderStatus == 'Accepted' || o.orderStatus == 'PickedUp')
      .length;

  int get _activeEscrowOrders => _orders
      .where(
        (o) => o.orderStatus != 'Rejected' && o.escrowStatus == 'HeldInEscrow',
      )
      .length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ReelsSuperFeedScreen(
            langCode: widget.langCode,
            dishes: _dishes,
            onLike: _toggleLike,
            onFollow: _toggleFollow,
            onOrderTap: _openCheckoutSheet,
            onLanguageTap: _openLanguageSelector,
          ),
          ExploreSuperMarketScreen(
            langCode: widget.langCode,
            dishes: _dishes,
            onOrderTap: _openCheckoutSheet,
            onLanguageTap: _openLanguageSelector,
            onWatchReelTap: () => setState(() => _selectedIndex = 0),
          ),
          ChefCreatorStudioScreen(
            langCode: widget.langCode,
            dishes: _dishes,
            isKycVerified: isKycVerified,
            verifiedChefLegalName: verifiedChefLegalName,
            kitchenName: kitchenName,
            chefCityKey: chefCityKey,
            kitchenTiming: kitchenTiming,
            deliveryFee: deliveryFee,
            escrowHoldBalance: escrowHoldBalance,
            chefBankWalletBalance: chefBankWalletBalance,
            onTryPublish: _tryPublishNewDish,
            onToggleStock: _toggleDishStock,
            onDeleteDish: _deleteDish,
            onLanguageTap: _openLanguageSelector,
            onUpdateProfile: ({
              required String legalName,
              required String kName,
              required String cityKey,
              required String timing,
              required double fee,
              required bool kycDone,
            }) {
              setState(() {
                verifiedChefLegalName = legalName;
                kitchenName = kName;
                chefCityKey = cityKey;
                kitchenTiming = timing;
                deliveryFee = fee;
                isKycVerified = kycDone;
              });
            },
          ),
          RapidoRiderRadarScreen(
            langCode: widget.langCode,
            orders: _orders,
            riderEarnings: deliveryPartnerEarnings,
            onUpdateStatus: _updateOrderStatus,
            onLanguageTap: _openLanguageSelector,
          ),
          OrdersEscrowVaultScreen(
            langCode: widget.langCode,
            orders: _orders,
            escrowHoldBalance: escrowHoldBalance,
            chefBankWalletBalance: chefBankWalletBalance,
            onStatusChanged: _updateOrderStatus,
            onReviewSubmitted: _submitCustomerReviewAndReleaseEscrow,
            onLanguageTap: _openLanguageSelector,
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (idx) => setState(() => _selectedIndex = idx),
        backgroundColor: Colors.white,
        elevation: 10,
        indicatorColor: Colors.deepOrange.shade100,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.smart_display_outlined),
            selectedIcon:
                const Icon(Icons.smart_display, color: Color(0xFFFF4500)),
            label: t('nav_reels'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.storefront_outlined),
            selectedIcon:
                const Icon(Icons.storefront, color: Color(0xFFFF4500)),
            label: t('nav_market'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.add_a_photo_outlined),
            selectedIcon:
                const Icon(Icons.add_a_photo, color: Color(0xFFFF4500)),
            label: t('nav_studio'),
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: _activeRiderTasks > 0,
              label: Text('$_activeRiderTasks'),
              child: const Icon(Icons.two_wheeler_outlined),
            ),
            selectedIcon: Badge(
              isLabelVisible: _activeRiderTasks > 0,
              label: Text('$_activeRiderTasks'),
              child: const Icon(Icons.two_wheeler, color: Color(0xFFFF4500)),
            ),
            label: t('nav_rapido'),
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: _activeEscrowOrders > 0,
              label: Text('$_activeEscrowOrders'),
              child: const Icon(Icons.shield_outlined),
            ),
            selectedIcon: Badge(
              isLabelVisible: _activeEscrowOrders > 0,
              label: Text('$_activeEscrowOrders'),
              child: const Icon(Icons.shield, color: Color(0xFFFF4500)),
            ),
            label: t('nav_orders'),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// TAB 0: Instagram & YouTube Shorts Style Reels Feed
// ==========================================

class ReelsSuperFeedScreen extends StatefulWidget {
  final String langCode;
  final List<DishItem> dishes;
  final Function(String) onLike;
  final Function(String) onFollow;
  final Function(DishItem) onOrderTap;
  final VoidCallback onLanguageTap;

  const ReelsSuperFeedScreen({
    super.key,
    required this.langCode,
    required this.dishes,
    required this.onLike,
    required this.onFollow,
    required this.onOrderTap,
    required this.onLanguageTap,
  });

  @override
  State<ReelsSuperFeedScreen> createState() => _ReelsSuperFeedScreenState();
}

class _ReelsSuperFeedScreenState extends State<ReelsSuperFeedScreen> {
  String _selectedCityKey = "city_all";

  String t(String key) => AppTranslations.tr(widget.langCode, key);

  @override
  Widget build(BuildContext context) {
    final activeDishes = widget.dishes.where((d) {
      final cityMatch =
          _selectedCityKey == "city_all" || d.cityKey == _selectedCityKey;
      return cityMatch && !d.isExpired;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          activeDishes.isEmpty
              ? const Center(
                  child: Text(
                    "No Live Reels in this filter right now.",
                    style: TextStyle(color: Colors.white70),
                  ),
                )
              : PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: activeDishes.length,
                  itemBuilder: (context, index) {
                    final dish = activeDishes[index];
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          dish.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: dish.fallbackGradient,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.restaurant,
                                size: 90,
                                color: Colors.white24,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black54,
                                Colors.transparent,
                                Colors.transparent,
                                Colors.black87,
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(90),
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white38, width: 1.5),
                            ),
                            child: const Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white70,
                              size: 54,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 14,
                          bottom: 170,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => widget.onFollow(dish.id),
                                child: Column(
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Colors.deepOrange,
                                          child: Text(
                                            safeInitial(dish.chefName),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: -6,
                                          child: CircleAvatar(
                                            radius: 11,
                                            backgroundColor: dish.isChefFollowed
                                                ? Colors.green
                                                : const Color(0xFFFF4500),
                                            child: Icon(
                                              dish.isChefFollowed
                                                  ? Icons.check
                                                  : Icons.add,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      t(dish.isChefFollowed
                                          ? 'following'
                                          : 'follow'),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 18),
                              IconButton(
                                onPressed: () => widget.onLike(dish.id),
                                icon: Icon(
                                  dish.isLikedByMe
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: dish.isLikedByMe
                                      ? Colors.redAccent
                                      : Colors.white,
                                  size: 36,
                                ),
                              ),
                              Text(
                                "${dish.likesCount}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade700,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "${dish.rating}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 18),
                              const Icon(
                                Icons.verified_user,
                                color: Colors.cyanAccent,
                                size: 30,
                              ),
                              const Text(
                                "Escrow",
                                style: TextStyle(
                                  color: Colors.cyanAccent,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 14,
                          right: 14,
                          bottom: 18,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(205),
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: Colors.white24),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 6,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.fiber_manual_record,
                                            color: Colors.white,
                                            size: 10,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            "${t('live_badge')} • ${dish.liveViewers}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.green.withAlpha(60),
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: Colors.greenAccent,
                                        ),
                                      ),
                                      child: Text(
                                        "⏱ ${dish.remainingFreshnessText(widget.langCode)}",
                                        style: const TextStyle(
                                          color: Colors.greenAccent,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.verified,
                                                color: Colors.lightBlueAccent,
                                                size: 16,
                                              ),
                                              const SizedBox(width: 4),
                                              Expanded(
                                                child: Text(
                                                  "${dish.chefName} (${dish.kitchenName}) • 📍${t(dish.cityKey)}",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            dish.name,
                                            style: const TextStyle(
                                              color: Colors.amberAccent,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            "₹${dish.price.toStringAsFixed(0)} ${t('per_plate')} • 🛵 ${dish.prepTimeMins} mins",
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: dish.canOrder
                                            ? const Color(0xFFFF4500)
                                            : Colors.grey,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 12,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                      ),
                                      onPressed: dish.canOrder
                                          ? () => widget.onOrderTap(dish)
                                          : null,
                                      icon:
                                          const Icon(Icons.flash_on, size: 18),
                                      label: Text(
                                        dish.canOrder
                                            ? t('order_now')
                                            : t('out_of_stock'),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.play_circle_fill,
                    color: Color(0xFFFF4500),
                    size: 28,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      t('app_title'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(160),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white30),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedCityKey,
                        dropdownColor: Colors.grey.shade900,
                        icon: const Icon(
                          Icons.location_on,
                          color: Color(0xFFFF4500),
                          size: 16,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        items: kAllCityKeys
                            .map(
                              (k) => DropdownMenuItem(
                                value: k,
                                child: Text(t(k)),
                              ),
                            )
                            .toList(),
                        onChanged: (val) {
                          if (val != null) {
                            setState(() => _selectedCityKey = val);
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: widget.onLanguageTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF4500),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.language,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.langCode.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// TAB 1: Zomato + Swiggy + Amazon + Instagram Stories Market
// ==========================================

class ExploreSuperMarketScreen extends StatefulWidget {
  final String langCode;
  final List<DishItem> dishes;
  final Function(DishItem) onOrderTap;
  final VoidCallback onLanguageTap;
  final VoidCallback onWatchReelTap;

  const ExploreSuperMarketScreen({
    super.key,
    required this.langCode,
    required this.dishes,
    required this.onOrderTap,
    required this.onLanguageTap,
    required this.onWatchReelTap,
  });

  @override
  State<ExploreSuperMarketScreen> createState() =>
      _ExploreSuperMarketScreenState();
}

class _ExploreSuperMarketScreenState extends State<ExploreSuperMarketScreen> {
  String _searchQuery = "";
  String _selectedCatKey = "cat_all";
  String _selectedCityKey = "city_all";

  String t(String key) => AppTranslations.tr(widget.langCode, key);

  @override
  Widget build(BuildContext context) {
    final filtered = widget.dishes.where((d) {
      final matchCity =
          _selectedCityKey == "city_all" || d.cityKey == _selectedCityKey;
      final matchCat =
          _selectedCatKey == "cat_all" || d.categoryKey == _selectedCatKey;
      final matchSearch =
          d.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              d.chefName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              d.kitchenName.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchCity && matchCat && matchSearch && !d.isExpired;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Row(
          children: [
            const Icon(Icons.location_on, color: Color(0xFFFF4500)),
            const SizedBox(width: 6),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedCityKey,
                  isExpanded: true,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  items: kAllCityKeys
                      .map(
                        (k) => DropdownMenuItem(value: k, child: Text(t(k))),
                      )
                      .toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedCityKey = val);
                  },
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: widget.onLanguageTap,
            icon: const Icon(Icons.language, color: Color(0xFFFF4500)),
            label: Text(
              widget.langCode.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF4500),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          TextField(
            onChanged: (val) => setState(() => _searchQuery = val),
            decoration: InputDecoration(
              hintText: t('search_hint'),
              prefixIcon: const Icon(Icons.search, color: Color(0xFFFF4500)),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            t('live_stories'),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 98,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.dishes.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                final d = widget.dishes[index];
                return GestureDetector(
                  onTap: widget.onWatchReelTap,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFF4500),
                                  Colors.amber,
                                  Colors.purpleAccent,
                                ],
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey.shade900,
                              child: Text(
                                safeInitial(d.chefName),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              "LIVE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: 74,
                        child: Text(
                          d.chefName,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Color(0xFF1F1C2C), Color(0xFF928DAB)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    t('hero_tag'),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  t('hero_title'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  t('hero_sub'),
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 38,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: kAllCategoryKeys.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final k = kAllCategoryKeys[index];
                final selected = _selectedCatKey == k;
                return ChoiceChip(
                  label: Text(t(k)),
                  selected: selected,
                  selectedColor: const Color(0xFFFF4500),
                  labelStyle: TextStyle(
                    color: selected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  onSelected: (v) {
                    if (v) setState(() => _selectedCatKey = k);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          ...filtered.map((dish) {
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 185,
                        width: double.infinity,
                        child: Image.network(
                          dish.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            decoration: BoxDecoration(
                              gradient:
                                  LinearGradient(colors: dish.fallbackGradient),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.fastfood,
                                size: 60,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "🎥 ${t('live_badge')}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(180),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "⏱ ${dish.remainingFreshnessText(widget.langCode)}",
                            style: const TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                dish.name,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.shade700,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "${dish.rating}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "👩‍🍳 ${dish.chefName} (${dish.kitchenName}) • 📍${t(dish.cityKey)}",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.verified,
                              color: Colors.blue,
                              size: 15,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                t('hygiene_verified'),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 20),
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "₹${dish.price.toStringAsFixed(0)}",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFF4500),
                                  ),
                                ),
                                Text(
                                  "${t('per_plate')} • 🛵 ${dish.prepTimeMins} mins",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                OutlinedButton.icon(
                                  onPressed: widget.onWatchReelTap,
                                  icon: const Icon(
                                    Icons.play_circle_outline,
                                    size: 18,
                                  ),
                                  label: Text(t('watch_live')),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: dish.canOrder
                                        ? Colors.green.shade700
                                        : Colors.grey,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: dish.canOrder
                                      ? () => widget.onOrderTap(dish)
                                      : null,
                                  child: Text(
                                    dish.canOrder
                                        ? t('order_now')
                                        : t('out_of_stock'),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ==========================================
// TAB 2: Women & Home-Chef Creator Studio
// ==========================================

class ChefCreatorStudioScreen extends StatefulWidget {
  final String langCode;
  final List<DishItem> dishes;
  final bool isKycVerified;
  final String verifiedChefLegalName;
  final String kitchenName;
  final String chefCityKey;
  final String kitchenTiming;
  final double deliveryFee;
  final double escrowHoldBalance;
  final double chefBankWalletBalance;
  final String? Function({
    required String name,
    required double price,
    required String categoryKey,
    required int prepTimeMins,
  }) onTryPublish;
  final Function(String, bool) onToggleStock;
  final Function(String) onDeleteDish;
  final VoidCallback onLanguageTap;
  final Function({
    required String legalName,
    required String kName,
    required String cityKey,
    required String timing,
    required double fee,
    required bool kycDone,
  }) onUpdateProfile;

  const ChefCreatorStudioScreen({
    super.key,
    required this.langCode,
    required this.dishes,
    required this.isKycVerified,
    required this.verifiedChefLegalName,
    required this.kitchenName,
    required this.chefCityKey,
    required this.kitchenTiming,
    required this.deliveryFee,
    required this.escrowHoldBalance,
    required this.chefBankWalletBalance,
    required this.onTryPublish,
    required this.onToggleStock,
    required this.onDeleteDish,
    required this.onLanguageTap,
    required this.onUpdateProfile,
  });

  @override
  State<ChefCreatorStudioScreen> createState() =>
      _ChefCreatorStudioScreenState();
}

class _ChefCreatorStudioScreenState extends State<ChefCreatorStudioScreen> {
  bool isVideoRecorded = false;
  String selectedCategoryKey = "cat_kathiyawadi";
  final dishCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final prepCtrl = TextEditingController(text: "25");

  static const List<String> _studioCategoryKeys = [
    'cat_kathiyawadi',
    'cat_curry',
    'cat_snacks',
    'cat_sweets',
    'cat_healthy',
  ];

  String t(String key) => AppTranslations.tr(widget.langCode, key);

  @override
  void dispose() {
    dishCtrl.dispose();
    priceCtrl.dispose();
    prepCtrl.dispose();
    super.dispose();
  }

  void _openEditProfileDialog() {
    final legalCtrl =
        TextEditingController(text: widget.verifiedChefLegalName);
    final kitchenCtrl = TextEditingController(text: widget.kitchenName);
    final timingCtrl = TextEditingController(text: widget.kitchenTiming);
    final feeCtrl =
        TextEditingController(text: widget.deliveryFee.toStringAsFixed(0));
    String tempCity = widget.chefCityKey;
    bool tempKyc = widget.isKycVerified;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setModalState) => AlertDialog(
          title: const Text("Kitchen Profile & KYC Settings"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: legalCtrl,
                  decoration: const InputDecoration(
                    labelText: "Chef Legal Name (As per ID)",
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: kitchenCtrl,
                  decoration: const InputDecoration(
                    labelText: "Home Kitchen Name",
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: tempCity,
                  decoration: const InputDecoration(labelText: "City"),
                  items: kAllCityKeys
                      .where((k) => k != 'city_all')
                      .map((k) => DropdownMenuItem(value: k, child: Text(t(k))))
                      .toList(),
                  onChanged: (v) {
                    if (v != null) setModalState(() => tempCity = v);
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: timingCtrl,
                  decoration: const InputDecoration(
                    labelText: "Kitchen Timing",
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: feeCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: "Delivery Fee (₹)",
                  ),
                ),
                const SizedBox(height: 8),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(t('kyc_verified')),
                  value: tempKyc,
                  onChanged: (v) => setModalState(() => tempKyc = v),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                final updatedLegal = legalCtrl.text.trim().isNotEmpty
                    ? legalCtrl.text.trim()
                    : widget.verifiedChefLegalName;
                final updatedKitchen = kitchenCtrl.text.trim().isNotEmpty
                    ? kitchenCtrl.text.trim()
                    : widget.kitchenName;
                final updatedTiming = timingCtrl.text.trim().isNotEmpty
                    ? timingCtrl.text.trim()
                    : widget.kitchenTiming;
                final updatedFee =
                    double.tryParse(feeCtrl.text.trim()) ?? widget.deliveryFee;

                widget.onUpdateProfile(
                  legalName: updatedLegal,
                  kName: updatedKitchen,
                  cityKey: tempCity,
                  timing: updatedTiming,
                  fee: updatedFee,
                  kycDone: tempKyc,
                );
                Navigator.pop(ctx);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    ).then((_) {
      legalCtrl.dispose();
      kitchenCtrl.dispose();
      timingCtrl.dispose();
      feeCtrl.dispose();
    });
  }

  void _publishNow() {
    if (!widget.isKycVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t('err_kyc')), backgroundColor: Colors.red),
      );
      return;
    }
    if (!isVideoRecorded) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t('err_video')), backgroundColor: Colors.red),
      );
      return;
    }
    final name = dishCtrl.text.trim();
    final price = double.tryParse(priceCtrl.text.trim());
    final prep = int.tryParse(prepCtrl.text.trim()) ?? 25;

    if (name.isEmpty || price == null || price <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t('err_dish')), backgroundColor: Colors.red),
      );
      return;
    }

    final err = widget.onTryPublish(
      name: name,
      price: price,
      categoryKey: selectedCategoryKey,
      prepTimeMins: prep,
    );

    if (err != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err), backgroundColor: Colors.red.shade900),
      );
      return;
    }

    dishCtrl.clear();
    priceCtrl.clear();
    setState(() => isVideoRecorded = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(t('msg_live')), backgroundColor: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          t('chef_studio'),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        actions: [
          IconButton(
            onPressed: _openEditProfileDialog,
            icon: const Icon(Icons.edit_note, color: Color(0xFFFF4500)),
            tooltip: "Edit Kitchen Profile",
          ),
          IconButton(
            onPressed: widget.onLanguageTap,
            icon: const Icon(Icons.language, color: Color(0xFFFF4500)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: _openEditProfileDialog,
              borderRadius: BorderRadius.circular(18),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.deepOrange.shade100),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor:
                          widget.isKycVerified ? Colors.green : Colors.orange,
                      child: Icon(
                        widget.isKycVerified
                            ? Icons.verified_user
                            : Icons.warning_amber_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  widget.verifiedChefLegalName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: widget.isKycVerified
                                      ? Colors.green.shade100
                                      : Colors.red.shade100,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  t(widget.isKycVerified
                                      ? 'kyc_verified'
                                      : 'kyc_pending'),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: widget.isKycVerified
                                        ? Colors.green.shade900
                                        : Colors.red.shade900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${widget.kitchenName} • 📍${t(widget.chefCityKey)}",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "🕒 ${widget.kitchenTiming} • 🛵 ₹${widget.deliveryFee.toStringAsFixed(0)}",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.tune, color: Colors.grey, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.amber.shade400),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t('escrow_vault'),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "₹${widget.escrowHoldBalance.toStringAsFixed(0)}",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber.shade900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.green.shade400),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t('bank_payout'),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "₹${widget.chefBankWalletBalance.toStringAsFixed(0)}",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              t('step1_camera'),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => setState(() => isVideoRecorded = !isVideoRecorded),
              child: Container(
                height: 165,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isVideoRecorded
                      ? const Color(0xFF0F2027)
                      : Colors.black87,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: isVideoRecorded
                        ? Colors.greenAccent
                        : const Color(0xFFFF4500),
                    width: 2,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: isVideoRecorded ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          isVideoRecorded
                              ? "● REC VERIFIED (00:30)"
                              : "● LIVE CAMERA STUDIO",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isVideoRecorded
                              ? Icons.check_circle
                              : Icons.videocam_rounded,
                          size: 48,
                          color: isVideoRecorded
                              ? Colors.greenAccent
                              : Colors.white,
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            isVideoRecorded
                                ? t('camera_ready')
                                : t('tap_shoot'),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              t('step2_menu'),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 38,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _studioCategoryKeys.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final catKey = _studioCategoryKeys[index];
                  final isSelected = selectedCategoryKey == catKey;
                  return ChoiceChip(
                    label: Text(t(catKey)),
                    selected: isSelected,
                    selectedColor: const Color(0xFFFF4500),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    onSelected: (v) {
                      if (v) setState(() => selectedCategoryKey = catKey);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: dishCtrl,
              decoration: InputDecoration(
                labelText: t('dish_name_hint'),
                prefixIcon: const Icon(Icons.restaurant_menu),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: priceCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: t('price_label'),
                      prefixIcon: const Icon(Icons.currency_rupee),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: prepCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: t('prep_time_label'),
                      prefixIcon: const Icon(Icons.timer),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isVideoRecorded ? const Color(0xFFFF4500) : Colors.grey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: _publishNow,
                icon: const Icon(Icons.rocket_launch),
                label: Text(
                  t('publish_btn'),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Text(
              t('active_kitchen_menu'),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 8),
            ...widget.dishes.map(
              (d) => Card(
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  title: Text(
                    d.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "₹${d.price.toStringAsFixed(0)} • ⏱ ${d.remainingFreshnessText(widget.langCode)}",
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Switch(
                        value: d.isAvailable && !d.isExpired,
                        onChanged: (v) => widget.onToggleStock(d.id, v),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: () => widget.onDeleteDish(d.id),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TAB 3: Rapido / Uber Style Delivery Partner Radar
// ==========================================

class RapidoRiderRadarScreen extends StatefulWidget {
  final String langCode;
  final List<OrderItem> orders;
  final double riderEarnings;
  final Function(String, String) onUpdateStatus;
  final VoidCallback onLanguageTap;

  const RapidoRiderRadarScreen({
    super.key,
    required this.langCode,
    required this.orders,
    required this.riderEarnings,
    required this.onUpdateStatus,
    required this.onLanguageTap,
  });

  @override
  State<RapidoRiderRadarScreen> createState() => _RapidoRiderRadarScreenState();
}

class _RapidoRiderRadarScreenState extends State<RapidoRiderRadarScreen> {
  bool isRiderOnDuty = true;

  String t(String key) => AppTranslations.tr(widget.langCode, key);

  void _handlePickup(OrderItem order) {
    if (!isRiderOnDuty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t('err_duty_off')),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    widget.onUpdateStatus(order.id, 'PickedUp');
  }

  void _openOtpVerificationDialog(OrderItem order) {
    if (!isRiderOnDuty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t('err_duty_off')),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final otpCtrl = TextEditingController(text: order.deliveryOtp);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Verify Customer Delivery OTP"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Customer: ${order.customerName} (${order.mobileNumber})",
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              "Demo OTP Hint: ${order.deliveryOtp}",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: otpCtrl,
              keyboardType: TextInputType.number,
              maxLength: 4,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: "Enter 4-Digit OTP",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.pin),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              if (otpCtrl.text.trim() == order.deliveryOtp) {
                widget.onUpdateStatus(order.id, 'Delivered');
                Navigator.pop(ctx);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(t('err_invalid_otp')),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text("Verify & Complete"),
          ),
        ],
      ),
    ).then((_) => otpCtrl.dispose());
  }

  @override
  Widget build(BuildContext context) {
    final riderTasks = widget.orders
        .where(
          (o) =>
              o.orderStatus == 'Accepted' ||
              o.orderStatus == 'PickedUp' ||
              o.orderStatus == 'Delivered',
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1F2C),
        foregroundColor: Colors.white,
        title: Text(
          t('rider_hub'),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        actions: [
          Switch(
            value: isRiderOnDuty,
            onChanged: (v) => setState(() => isRiderOnDuty = v),
          ),
          IconButton(
            onPressed: widget.onLanguageTap,
            icon: const Icon(Icons.language, color: Colors.amber),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1A1F2C), Color(0xFF2C3E50)],
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.radar,
                          color: isRiderOnDuty
                              ? Colors.greenAccent
                              : Colors.redAccent,
                          size: 28,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isRiderOnDuty ? t('duty_on') : t('duty_off'),
                          style: TextStyle(
                            color: isRiderOnDuty
                                ? Colors.greenAccent
                                : Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          t('rider_earnings'),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          "₹${widget.riderEarnings.toStringAsFixed(0)}",
                          style: const TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.soup_kitchen, color: Colors.orangeAccent),
                          Text(
                            "Home Chef",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.greenAccent,
                          thickness: 2,
                          indent: 12,
                          endIndent: 12,
                        ),
                      ),
                      Column(
                        children: [
                          Icon(Icons.two_wheeler, color: Colors.greenAccent),
                          Text(
                            "GPS Live Route",
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white38,
                          thickness: 2,
                          indent: 12,
                          endIndent: 12,
                        ),
                      ),
                      Column(
                        children: [
                          Icon(Icons.home_filled, color: Colors.cyanAccent),
                          Text(
                            "Customer",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: riderTasks.isEmpty
                ? Center(child: Text(t('no_deliveries')))
                : ListView.builder(
                    padding: const EdgeInsets.all(14),
                    itemCount: riderTasks.length,
                    itemBuilder: (context, index) {
                      final o = riderTasks[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${o.dishName} (x${o.quantity})",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.amber.shade100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "🛵 ${o.distanceKm} km • ₹${o.deliveryFee.toStringAsFixed(0)}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                              Text(
                                "👨‍🍳 Pickup: ${o.chefName} (${t(o.cityKey)})",
                              ),
                              Text(
                                "📍 Drop: ${o.customerName} - ${o.address}",
                              ),
                              Text(
                                "📞 Phone: ${o.mobileNumber}  |  🔐 OTP: ${o.deliveryOtp}",
                              ),
                              const SizedBox(height: 12),
                              if (o.orderStatus == 'Accepted')
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepOrange,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () => _handlePickup(o),
                                    icon: const Icon(Icons.inventory_2),
                                    label: Text(t('btn_pickup')),
                                  ),
                                )
                              else if (o.orderStatus == 'PickedUp')
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green.shade700,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () =>
                                        _openOtpVerificationDialog(o),
                                    icon: const Icon(Icons.verified),
                                    label: Text(
                                      "${t('btn_deliver')} (OTP: ${o.deliveryOtp})",
                                    ),
                                  ),
                                )
                              else
                                const Text(
                                  "✅ Trip Completed! Waiting for Customer Review to release payout.",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// TAB 4: Amazon-Style Order Tracker, Escrow Vault & Settings
// ==========================================

class OrdersEscrowVaultScreen extends StatelessWidget {
  final String langCode;
  final List<OrderItem> orders;
  final double escrowHoldBalance;
  final double chefBankWalletBalance;
  final Function(String, String) onStatusChanged;
  final Function(String, int, String) onReviewSubmitted;
  final VoidCallback onLanguageTap;

  const OrdersEscrowVaultScreen({
    super.key,
    required this.langCode,
    required this.orders,
    required this.escrowHoldBalance,
    required this.chefBankWalletBalance,
    required this.onStatusChanged,
    required this.onReviewSubmitted,
    required this.onLanguageTap,
  });

  String t(String key) => AppTranslations.tr(langCode, key);

  void _openTasteReviewModal(BuildContext context, OrderItem order) {
    int stars = 5;
    final reviewCtrl = TextEditingController(
      text: "Superb authentic homemade taste & hygiene!",
    );

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text("Taste Review & Escrow Release"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Did you enjoy the food? Rating 3+ stars immediately releases the held money from Escrow to the Home Chef!",
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (i) {
                    final s = i + 1;
                    return IconButton(
                      onPressed: () => setDialogState(() => stars = s),
                      icon: Icon(
                        s <= stars
                            ? Icons.star_rounded
                            : Icons.star_outline_rounded,
                        color: Colors.amber,
                        size: 34,
                      ),
                    );
                  }),
                ),
                TextField(
                  controller: reviewCtrl,
                  decoration: const InputDecoration(
                    labelText: "Your Review",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: stars >= 3 ? Colors.green : Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                onReviewSubmitted(order.id, stars, reviewCtrl.text.trim());
                Navigator.pop(ctx);
              },
              child: Text(
                stars >= 3
                    ? "Submit & Release Payment"
                    : "Report Issue & Hold Escrow",
              ),
            ),
          ],
        ),
      ),
    ).then((_) => reviewCtrl.dispose());
  }

  Widget _buildOrderProgressTracker(String status) {
    if (status == 'Rejected') {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          children: [
            Icon(Icons.cancel, color: Colors.red, size: 18),
            SizedBox(width: 6),
            Text(
              "Order Rejected by Kitchen • Escrow Refunded",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    }

    final steps = ['Pending', 'Accepted', 'PickedUp', 'Delivered'];
    final currentIdx = steps.indexOf(status);

    return Row(
      children: List.generate(steps.length, (i) {
        final done = i <= currentIdx;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: done ? Colors.green.shade600 : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              steps[i],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: done ? Colors.white : Colors.black54,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          t('orders_vault_title'),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        actions: [
          TextButton.icon(
            onPressed: onLanguageTap,
            icon: const Icon(Icons.language, color: Color(0xFFFF4500)),
            label: Text(
              langCode.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF4500),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.amber.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t('escrow_vault'),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "₹${escrowHoldBalance.toStringAsFixed(0)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber.shade900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t('bank_payout'),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "₹${chefBankWalletBalance.toStringAsFixed(0)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: orders.isEmpty
                ? Center(child: Text(t('no_orders')))
                : ListView.builder(
                    padding: const EdgeInsets.all(14),
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final o = orders[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${o.dishName} (x${o.quantity})",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: Color(0xFFFF4500),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "₹${o.totalPrice.toStringAsFixed(0)}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              _buildOrderProgressTracker(o.orderStatus),
                              const SizedBox(height: 8),
                              Text(
                                "👩‍🍳 Chef: ${o.chefName} (${t(o.cityKey)})  |  🔐 OTP: ${o.deliveryOtp}",
                              ),
                              Text(
                                "📍 Customer: ${o.customerName} (${o.mobileNumber}) - ${o.address}",
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: o.escrowStatus == 'ReleasedToChef'
                                      ? Colors.green.shade50
                                      : o.escrowStatus == 'Refunded'
                                          ? Colors.grey.shade100
                                          : Colors.amber.shade50,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: o.escrowStatus == 'ReleasedToChef'
                                        ? Colors.green
                                        : o.escrowStatus == 'Refunded'
                                            ? Colors.grey
                                            : Colors.amber.shade700,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      o.escrowStatus == 'ReleasedToChef'
                                          ? Icons.verified
                                          : Icons.lock_clock,
                                      color: o.escrowStatus == 'ReleasedToChef'
                                          ? Colors.green
                                          : Colors.amber.shade900,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        o.escrowStatus == 'HeldInEscrow'
                                            ? t('escrow_held_banner')
                                            : o.escrowStatus ==
                                                    'ReleasedToChef'
                                                ? t('escrow_released_banner')
                                                : o.escrowStatus == 'Refunded'
                                                    ? t('escrow_refunded_banner')
                                                    : t('escrow_dispute_banner'),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              if (o.orderStatus == 'Pending')
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () =>
                                            onStatusChanged(o.id, 'Rejected'),
                                        child: Text(t('chef_reject')),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () =>
                                            onStatusChanged(o.id, 'Accepted'),
                                        child: Text(t('chef_accept')),
                                      ),
                                    ),
                                  ],
                                )
                              else if (o.orderStatus == 'Accepted' ||
                                  o.orderStatus == 'PickedUp')
                                Text(
                                  "🛵 Status: ${o.orderStatus} (Go to 'Rider Radar' tab to complete delivery)",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                )
                              else if (o.orderStatus == 'Delivered' &&
                                  o.escrowStatus == 'HeldInEscrow')
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFF4500),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                    ),
                                    onPressed: () =>
                                        _openTasteReviewModal(context, o),
                                    icon: const Icon(Icons.stars),
                                    label: Text(
                                      t('btn_taste_review'),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              else if (o.customerRating != null)
                                Text(
                                  "⭐ Rated ${o.customerRating}/5: \"${o.customerReview}\"",
                                  style: TextStyle(
                                    color: (o.customerRating ?? 5) >= 3
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// ચેકઆઉટ શીટ (Amazon/Zomato Style Escrow Checkout)
// ==========================================

class SuperCheckoutBottomSheet extends StatefulWidget {
  final String langCode;
  final DishItem dish;
  final double deliveryFee;
  final Function(OrderItem) onConfirmOrder;

  const SuperCheckoutBottomSheet({
    super.key,
    required this.langCode,
    required this.dish,
    required this.deliveryFee,
    required this.onConfirmOrder,
  });

  @override
  State<SuperCheckoutBottomSheet> createState() =>
      _SuperCheckoutBottomSheetState();
}

class _SuperCheckoutBottomSheetState extends State<SuperCheckoutBottomSheet> {
  int quantity = 1;
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  String t(String key) => AppTranslations.tr(widget.langCode, key);

  @override
  void dispose() {
    nameCtrl.dispose();
    phoneCtrl.dispose();
    addressCtrl.dispose();
    super.dispose();
  }

  void _confirmOrder() {
    final name = nameCtrl.text.trim();
    final phone = phoneCtrl.text.trim();
    final addr = addressCtrl.text.trim();

    if (name.isEmpty || phone.length != 10 || addr.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t('err_form')), backgroundColor: Colors.red),
      );
      return;
    }

    final foodTotal = widget.dish.price * quantity;
    final total = foodTotal + widget.deliveryFee;
    final randomOtp =
        (1000 + (DateTime.now().microsecondsSinceEpoch % 9000)).toString();

    final order = OrderItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      dishId: widget.dish.id,
      dishName: widget.dish.name,
      chefName: widget.dish.chefName,
      cityKey: widget.dish.cityKey,
      quantity: quantity,
      foodTotal: foodTotal,
      deliveryFee: widget.deliveryFee,
      totalPrice: total,
      customerName: name,
      mobileNumber: phone,
      address: addr,
      deliveryOtp: randomOtp,
      orderedAt: DateTime.now(),
    );

    Navigator.pop(context);
    widget.onConfirmOrder(order);
  }

  @override
  Widget build(BuildContext context) {
    final foodTotal = widget.dish.price * quantity;
    final grandTotal = foodTotal + widget.deliveryFee;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        18,
        20,
        18,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.verified_user, color: Colors.green),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    t('checkout_title'),
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Text(
              widget.dish.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFFFF4500),
              ),
            ),
            Text(
              "👩‍🍳 ${widget.dish.chefName} (${widget.dish.kitchenName})",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t('plate_qty'),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () =>
                          quantity > 1 ? setState(() => quantity--) : null,
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      "$quantity",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() => quantity++),
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(t('food_total')),
                      Text("₹${foodTotal.toStringAsFixed(0)}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(t('delivery_fee')),
                      Text("₹${widget.deliveryFee.toStringAsFixed(0)}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(t('escrow_fee')),
                      Text(
                        t('free'),
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          t('grand_total'),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "₹${grandTotal.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFFFF4500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: t('cust_name'),
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: phoneCtrl,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: t('cust_phone'),
                prefixIcon: const Icon(Icons.phone),
                counterText: "",
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: addressCtrl,
              decoration: InputDecoration(
                labelText: t('cust_address'),
                prefixIcon: const Icon(Icons.location_on),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: _confirmOrder,
                icon: const Icon(Icons.lock),
                label: Text(
                  "${t('btn_pay_escrow')} (₹${grandTotal.toStringAsFixed(0)})",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
