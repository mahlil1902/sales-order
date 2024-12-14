using System;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
        }
    }

    public void messageBox(string message)
    {
        wucMessageBox1.subShowMsgBox(message);
    }

    public void messageBoxBootstrap(string message)
    {
        wucMessageBoxBS.messageBoxBootstrap(message);
    }

}
