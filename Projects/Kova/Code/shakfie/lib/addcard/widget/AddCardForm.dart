import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shakfie/addcard/provider/AddCardProvider.dart';
import 'package:shakfie/bash/MaskedTextInputFormatter.dart';
import 'package:shakfie/bash/style/common_styles.dart';
import 'package:shakfie/bash/widgets/ProcessDialog.dart';

class AddCardForm extends StatefulWidget {
  @override
  _AddCardFormState createState() => _AddCardFormState();
}

class _AddCardFormState extends State<AddCardForm> {
  var _cardNumberController = TextEditingController();
  var _cardCVVController=  TextEditingController();
  var _cardNameController = TextEditingController();
  var _cardExpiryDateController=TextEditingController();
  var _ccIconType=FontAwesomeIcons.creditCard;
  final _formKey = GlobalKey<FormState>();
  var provider = AddCardProvider();
  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
    _cardNumberController.addListener((){
      getIconBaseOnCardNumber(_cardNumberController.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Column(
            children: <Widget>[
              _buildCardNumberEdittext(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildCardExpireDate(context),
                  _buildCvvNumberField(context),
                ],

              ),
              _buildCardName(context),
              _buildSaveCardButton(context)

            ],
          ),
        ),
      )
    );
  }

  Widget _buildCardNumberEdittext(BuildContext context)
  {

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: TextFormField(
            controller: _cardNumberController,
            inputFormatters:[ MaskedTextInputFormatter(
              mask: 'xxxx-xxxx-xxxx-xxxx',
              separator: '-',
            ),],
            keyboardType: TextInputType.number,
            maxLength: 20,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
//              FocusScope.of(context).requestFocus(_emailFocusNode);
            },
            validator: (value) => checkCardNumeber(value),
            decoration: CommonStyles.textFormFieldStyleWithPrefix("Card Number", "",_ccIconType),

        ),
      );

  }

  Widget _buildCardName(BuildContext context)
  {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: TextFormField(
          controller: _cardNameController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
//              FocusScope.of(context).requestFocus(_emailFocusNode);
          },
          decoration: CommonStyles.textFormFieldStyleWithoutSuffix("Name on Card (optional)","")
      ),
    );

  }

  Widget _buildCvvNumberField(BuildContext context)
  {

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: TextFormField(
            controller: _cardCVVController,
            keyboardType: TextInputType.number,
            maxLength: 3,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
//              FocusScope.of(context).requestFocus(_emailFocusNode);
            },
            validator: (value) => checkCvvNumeber(value),
            decoration: CommonStyles.textFormFieldStyleWithoutSuffix("Cvv Number","")
        ),
      ),
    );

  }

  Widget _buildCardExpireDate(BuildContext context)
  {

    return Expanded(
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: TextFormField(
            controller: _cardExpiryDateController,
            inputFormatters:[ MaskedTextInputFormatter(
              mask: 'MM/YYYY',
              separator: '/',
            ),],
            keyboardType: TextInputType.number,
            maxLength: 7,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
//              FocusScope.of(context).requestFocus(_emailFocusNode);
            },
            validator: (value) => checkCardExpiryDate(value),
            decoration: CommonStyles.textFormFieldStyleWithoutSuffix("MM/YYYY", "")
        ),
      ) ,
    )
    ;

  }



  String checkCardNumeber(String value)
  {
    if(value.isEmpty)
      return "please enter card number";
    else
      return null;
  }

  String checkCvvNumeber(String value)
  {
    if(value.isEmpty)
      return "please enter card cvv number";
    else
      return null;
  }

  String checkCardExpiryDate(String value)
  {

    if(value.isEmpty)
      return "please enter card expiry date";
    else
      return null;
  }


  Widget _buildSaveCardButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, right: 8.0, left: 8.0),
      child: Container(
        width: double.infinity,
        child: RaisedButton(
          padding: EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0),
              side: BorderSide(color: Theme.of(context).primaryColor)),
          color: Theme.of(context).primaryColor,
          child: Text("Save card", style: Theme.of(context).textTheme.display1),
          onPressed: () => {_signUpProcess(context)},
        ),
      ),
    );
  }


  void _signUpProcess(BuildContext context) {
    var validate = _formKey.currentState.validate();

    if (validate) {
      provider.setLoading();
      ProcessDialog.openLoadingDialog(context);

      provider.saveCard(context);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  IconData getIconBaseOnCardNumber(String number)
  {
    var type = detectCCType(_cardNumberController.text);
    if(type == CreditCardType.visa)
    {
      setState(() {
        _ccIconType=FontAwesomeIcons.ccVisa;
      });
    }
    else if(type == CreditCardType.mastercard)
    {
      setState(() {
        _ccIconType=FontAwesomeIcons.ccMastercard;
      });
    }
    else if(type == CreditCardType.discover)
    {
      setState(() {
        _ccIconType=FontAwesomeIcons.ccDiscover;
      });
    }
    else if(type == CreditCardType.dinersclub)
    {
      setState(() {
        _ccIconType=FontAwesomeIcons.ccDinersClub;
      });
    }
    else if(type == CreditCardType.jcb)
    {
      setState(() {
        _ccIconType=FontAwesomeIcons.ccJcb;
      });
    }
    else{
      setState(() {
        _ccIconType=FontAwesomeIcons.creditCard;
      });
    }
  }
}
