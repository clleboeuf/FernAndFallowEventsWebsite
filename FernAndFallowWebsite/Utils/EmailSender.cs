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

        public async Task SendEmailExecute()
        {
            var apiKey = Environment.GetEnvironmentVariable("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");
            var client = new SendGridClient(apiKey);
            var from = new EmailAddress("cleb0002@student.monash.edu", "Example User");
            var subject = "Sending with Twilio SendGrid is Fun";
            var to = new EmailAddress("chris.levi.leboeuf@gmail.com", "Example User");
            var plainTextContent = "and easy to do anywhere, even with C#";
            var htmlContent = "<strong>and easy to do anywhere, even with C#</strong>";
            Console.WriteLine("Sending email");
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            var response = await client.SendEmailAsync(msg);
            
        }
    }
}