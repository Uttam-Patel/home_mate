import 'dart:io';

abstract class RegisterEvent{
  RegisterEvent();
}

class FNameEvent extends RegisterEvent{
  final String fName;
  FNameEvent(this.fName);
}

class LNameEvent extends RegisterEvent{
  final String lName;
  LNameEvent(this.lName);
}

class EmailEvent extends RegisterEvent{
  final String email;
  EmailEvent(this.email);
}

class FlagUserEvent extends RegisterEvent{
  final bool? flagUser;
  FlagUserEvent(this.flagUser);
}

class FlagProviderEvent extends RegisterEvent{
  final bool? flagProvider;
  FlagProviderEvent(this.flagProvider);
}

class ProviderTaglineEvent extends RegisterEvent{
  final String? providerTagline;
  ProviderTaglineEvent(this.providerTagline);
}

class ProviderDescriptionEvent extends RegisterEvent {
  final String? providerDescription;
  ProviderDescriptionEvent(this.providerDescription);
}