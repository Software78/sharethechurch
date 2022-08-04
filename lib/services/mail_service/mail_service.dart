import 'package:sendgrid_mailer/sendgrid_mailer.dart';
import 'package:sharethechurch/utils/keys/keys.dart';

class MailService {
  sendWelcomeMail(String recipient) async {
    final mailer = Mailer(KEY_SENGRID_API_KEY);
    var toAddress = Address(recipient);
    const fromAddress = Address(KEY_SENDER_EMAIL);
    const content = Content('text/plain', 'Hello World!');
    const subject = 'Welcome to Share The Church';
    var personalization = Personalization([toAddress]);
    var email =
        Email([personalization], fromAddress, subject, content: [content]);
  await  mailer.send(email);
  }
}
