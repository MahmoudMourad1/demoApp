// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:ui';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:myfatoorah_flutter/MFEnums.dart';
import 'package:myfatoorah_flutter/MFModels.dart';
import 'package:myfatoorah_flutter/MFUtils.dart';
import 'package:user/config/routes/app_routes.dart';
import 'package:user/utils/app_utils/app_strings.dart';
import 'package:user/utils/app_utils/constants.dart';

class Myfatoorah {
  // static String environment = MFEnvironment.LIVE;
  // static String myfatoorahApiKey =
  //     'WKM3uhsj7-Zf2vgTeOm8Plcr4I03XvcRiPp2RXO8BLcXwLbG13RWxBfp1OoaCy_Wr1lPnaYC1L9Rxr0zNGeJRra6bZeb3SebeoD3FNc7-gK7d9Cel4pFjDo20Hns4FeiWR6aGtN_Z9dE27uyhK-cKrdE1PolhcNvHku45V_7dZmrPAUp7ikylfLujxKP8qTDEaIc4dDYvkCQhPu13Q5qL2Wx6ht5H73gC9YsPwm_nvHgagMrsKNmUCkFg3rrQDqLwFvuIeAveFJycpfI933irw1HjVk9JDP2mfxNu2srBJ4G2mUXWdfZPhzEdVhEnk1LX-dN-NQRfeFHYiuGwHKCMgXxu5nhR5LKUrsOTlrLREHweGQeNgqqwfmX12McYawVhpAqXq9comxax4qW1B0b5flZzAD-x9-5Mc4d77xZ_Q8edDz53yLU71u9B5zjXWHm86dbZ7KkVSj1NodifP-TwYLTcoO016hKc04CM-lgZFk9OfuT9ynheJ08KC4GNinvwJt-qyPDDcBXwD3w4B5MyevY1t-aYw--xeKozVnmc0QyEUca1k20OvmL_QSNUg0xHqqLQpLjInjb22BFhowdQyzLku9vBc6BPWN1ankmGVdrpYKnAnv2H1u32D9zK_SmK_wS9RWF5WnJ8nfvcDhoH4m2UWrlij3SgEV0xUnSxA2NP7Hd491ZRJGBMt4VeOw3ja0l6A';
  //
  static String environment = MFEnvironment.TEST;
  static String myfatoorahApiKey =
  'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL';
  //--------------------API TEST KEY ------------------------------
  // static String myfatoorahApiKey =
  //     'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL';
  static String myfatoorahCurrency = MFCurrencyISO.QATAR_QAR;
  static String Wallet = 'wallet';
  static String VisaMaster = 'VisaMaster';
  static String GooglePay = 'GooglePay';
  static String ApplePay = 'ApplePay';
  static String DebitCard = 'DebitCard';
  static int VisaMasterId = 20;
  static int TokenPayId = 20;
  static int GooglePayId = 32;
  static int ApplePayId = 11;
  static int DebitCardId = 7;
  static int WalletId = 200;
  static MFCardViewStyle cardViewStyle(Size size) {
    MFCardViewStyle cardViewStyle = MFCardViewStyle();
    cardViewStyle.cardHeight = 400;
    cardViewStyle.hideCardIcons = true;

    cardViewStyle.input?.inputMargin = 14;
    cardViewStyle.label?.display = true;
    cardViewStyle.input?.inputHeight = 60;
    cardViewStyle.input?.borderColor = getColorHexFromStr('#62BAE8');
    // cardViewStyle.label?.text?.cardNumber = AppStrings.cardNumber;
    // cardViewStyle.label?.text?.expiryDate = AppStrings.expiryDate;
    // cardViewStyle.label?.text?.holderName = AppStrings.cardHolderName;
    // cardViewStyle.label?.text?.securityCode = AppStrings.securityCode;

    cardViewStyle.input?.fontFamily =
    RouterApp.currentContext?.languageCode == 'en' ? MFFontFamily.SansSerif : MFFontFamily.Tahoma;
    cardViewStyle.label?.fontWeight = MFFontWeight.Normal;
    cardViewStyle.label?.fontSize = 16;

    return cardViewStyle;
  }
}
