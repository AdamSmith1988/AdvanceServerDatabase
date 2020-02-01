using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MVC_ICA.Startup))]
namespace MVC_ICA
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
