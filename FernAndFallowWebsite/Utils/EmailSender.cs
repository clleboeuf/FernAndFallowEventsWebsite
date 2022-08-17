using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using SendGrid;
using SendGrid.Helpers.Mail;

namespace FernAndFallowWebsite.Utils
{
    public class EmailSender
    {
        public String EmailTo { get; set; }
        public String EmailSubject { get; set; }
        public String EmailContents { get; set; }

        public async Task SendEmailExecute()
        {
            var client = new SendGridClient("SG.W08HCLY8Rzin83L77qJzaA.6VDBHJDKwUMIbTGrlp - O6iVco126yJhuk4egqUR8g2g");
            var from = new EmailAddress("chris.levi.leboeuf@gmail.com", "Example User");
            var subject = "Sending with Twilio SendGrid is Fun";
            var to = new EmailAddress("cleboeuf@chairo.vic.edu.au", "Example User");
            var plainTextContent = "and easy to do anywhere, even with C#";
            var htmlContent = "<strong>and easy to do anywhere, even with C#</strong>";
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            var response = await client.SendEmailAsync(msg);
            Console.WriteLine(response.IsSuccessStatusCode ? "Email queued successfully!" : "Something went wrong!");
        }
    }
}