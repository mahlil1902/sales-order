using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class wuc_wucConfirmBoxBootstrap : System.Web.UI.UserControl
{
    public event EventHandler Hide;

    public void confirmBox(string modalTitle)
    {
        bYes.Enabled = true;
        lModalTitle.Text = modalTitle;
        upModal.Update();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
    }

    protected void bYes_OnClick(Object sender, EventArgs e)
    {
        bYes.Enabled = false;
        MStrMode = "Yes";
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#myModal", "$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').hide();", true);
        if (Hide != null)
        {
            Hide(this, e);
        }
    }

    private String MStrMode = "";

    public string StrMode
    {
        get
        {
            return MStrMode;
        }
        set
        {
            MStrMode = value;
        }
    }

    protected void OnHide(EventArgs e)
    {
        if (Hide != null)
        {
            Hide(this, e);
        }
    }  
}