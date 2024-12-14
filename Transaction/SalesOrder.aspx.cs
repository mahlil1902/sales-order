using App.DataAccessLayer;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Transaction_SalesOrder : System.Web.UI.Page
{
    classMahlil cMahlil = new classMahlil();
    StringBuilder sql = new StringBuilder();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }

    }
    private void BindData()
    {
        ExecSP _dal = null;
        Hashtable _ht = null;
        try
        {
            sql.Append("select so_order_id as order_id,order_no,cast(ORDER_DATE as date)'ORDER_DATE' ,c.CUSTOMER_NAME From SO_ORDER so ");
            sql.Append("inner join COM_CUSTOMER c on(c.COM_CUSTOMER_ID = so.COM_CUSTOMER_ID) ");
            sql.Append("WHERE 1=1 ");
            if (txtKeyword.Text != "")
            {
                sql.Append(" and (ORDER_NO  like '%" + txtKeyword.Text + "%' ");
                sql.Append(" or ORDER_DATE like '%" + txtKeyword.Text + "%' )");
            }
            if (tbReqDelvDate.Text != "")
            {
                sql.Append(" and CONVERT(DATE, ORDER_DATE) ='" + Shared.UItoDBDate(tbReqDelvDate.Text) + "'");
            }
            string query = sql.ToString();
            using (SqlConnection conn = new SqlConnection(cMahlil.getConnStr("MyConnectionString")))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);

                DataTable dt = new DataTable();
                adapter.Fill(dt);

                // Menyambungkan DataTable ke GridView
                grid.DataSource = dt;
                grid.DataBind();
                upGrid.Update();
            }
        }
        catch (Exception ex)
        {
            MasterPage master = (MasterPage)this.Master;
            master.messageBox(ex.Message + "<br />" + ex.InnerException);
        }

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindData();
    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("SalesOrderProses.aspx?action=add");
    }

    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {

    }
    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            GridViewRow gridRow = ((sender as ImageButton).Parent.Parent as GridViewRow);
            Label lSalesOrderid = (Label)gridRow.FindControl("lSalesOrderid");
            StringBuilder sql = new StringBuilder();
            sql.Append("delete SO_ORDER where so_order_id = " + lSalesOrderid.Text + ";");
            sql.Append("delete SO_ITEM where so_order_id = " + lSalesOrderid.Text + ";");
            using (SqlConnection conn = new SqlConnection(cMahlil.getConnStr("MyConnectionString")))
            {
                using (SqlCommand cmd = new SqlCommand(sql.ToString(), conn))
                {
                    conn.Open();
                    cmd.ExecuteScalar();
                }
            }
            BindData();
        }
        catch (Exception ex)
        {
            MasterPage master = (MasterPage)this.Master;
            master.messageBox(ex.Message);
        }

    }

    protected void btnEdit_Click(object sender, ImageClickEventArgs e)
    {

    }
}