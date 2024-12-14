using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wuc_wucMessageBoxBootstrap : System.Web.UI.UserControl
{
    public void messageBoxBootstrap(string modalBody)
    {
        lModalBody.Text = modalBody;
        upModal.Update();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalMessageBootstrap", "$('#myModalMessageBootstrap').modal();", true);
    }
}