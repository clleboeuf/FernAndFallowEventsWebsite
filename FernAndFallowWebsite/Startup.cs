using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FernAndFallowWebsite.Startup))]
namespace FernAndFallowWebsite
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
