using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using FernAndFallowWebsite.Utils;

namespace FernAndFallowWebsite.Models
{
    public class SendEmail
    {
        public string EmailTo { get; set; }  
        public string Subject { get; set; }
        public string Contents { get; set; }

        [Required]
        public string Id { get; set; }
    }
}