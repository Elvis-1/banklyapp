class Transaction {
  String? trnAmount;
  String? trnCounterPartyService;
  String? trnDate;
  String? trnCounterpartyBankCode;
  String? trnContractReference;
  String? trnPaymentReference;
  String? trnCounterPartyReference;
  String? logourl;
  String? trnDrCr;
  String? accountNumber;
  String? accountName;
  String? counterPartyAccountNumber;
  String? counterPartyAccountName;
  String? journalNarration;
  String? trnCounterPartyBankName;
  String? ftCounterPartySwitchCode;
  String? trnNarration;
  String? source;
  String? bankCode;
  String? branchCode;
  String? maker;
  String? checker;
  String? bankName;
  String? trnId;

  Transaction(
      {this.trnAmount,
      this.trnCounterPartyService,
      this.trnDate,
      this.trnCounterpartyBankCode,
      this.trnContractReference,
      this.trnPaymentReference,
      this.trnCounterPartyReference,
      this.logourl,
      this.trnDrCr,
      this.accountNumber,
      this.accountName,
      this.counterPartyAccountNumber,
      this.counterPartyAccountName,
      this.journalNarration,
      this.trnCounterPartyBankName,
      this.ftCounterPartySwitchCode,
      this.trnNarration,
      this.source,
      this.bankCode,
      this.branchCode,
      this.maker,
      this.checker,
      this.bankName,
      this.trnId});

  Transaction.fromJson(Map<String, dynamic> json) {
    trnAmount = json['trnAmount'];
    trnCounterPartyService = json['trnCounterPartyService'];
    trnDate = json['trnDate'];
    trnCounterpartyBankCode = json['trnCounterpartyBankCode'];
    trnContractReference = json['trnContractReference'];
    trnPaymentReference = json['trnPaymentReference'];
    trnCounterPartyReference = json['trnCounterPartyReference'];
    logourl = json['logourl'];
    trnDrCr = json['trnDrCr'];
    accountNumber = json['accountNumber'];
    accountName = json['accountName'];
    counterPartyAccountNumber = json['counterPartyAccountNumber'];
    counterPartyAccountName = json['counterPartyAccountName'];
    journalNarration = json['journalNarration'];
    trnCounterPartyBankName = json['trnCounterPartyBankName'];
    ftCounterPartySwitchCode = json['ftCounterPartySwitchCode'];
    trnNarration = json['trnNarration'];
    source = json['source'];
    bankCode = json['bankCode'];
    branchCode = json['branchCode'];
    maker = json['maker'];
    checker = json['checker'];
    bankName = json['bankName'];
    trnId = json['trnId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trnAmount'] = this.trnAmount;
    data['trnCounterPartyService'] = this.trnCounterPartyService;
    data['trnDate'] = this.trnDate;
    data['trnCounterpartyBankCode'] = this.trnCounterpartyBankCode;
    data['trnContractReference'] = this.trnContractReference;
    data['trnPaymentReference'] = this.trnPaymentReference;
    data['trnCounterPartyReference'] = this.trnCounterPartyReference;
    data['logourl'] = this.logourl;
    data['trnDrCr'] = this.trnDrCr;
    data['accountNumber'] = this.accountNumber;
    data['accountName'] = this.accountName;
    data['counterPartyAccountNumber'] = this.counterPartyAccountNumber;
    data['counterPartyAccountName'] = this.counterPartyAccountName;
    data['journalNarration'] = this.journalNarration;
    data['trnCounterPartyBankName'] = this.trnCounterPartyBankName;
    data['ftCounterPartySwitchCode'] = this.ftCounterPartySwitchCode;
    data['trnNarration'] = this.trnNarration;
    data['source'] = this.source;
    data['bankCode'] = this.bankCode;
    data['branchCode'] = this.branchCode;
    data['maker'] = this.maker;
    data['checker'] = this.checker;
    data['bankName'] = this.bankName;
    data['trnId'] = this.trnId;
    return data;
  }
}
