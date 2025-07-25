using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(To_dos.Startup))]
namespace To_dos
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
