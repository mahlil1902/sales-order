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

public partial class Transaction_SalesOrderProses : System.Web.UI.Page
{
    StringBuilder sql = new StringBuilder();
    classMahlil cMahlil = new classMahlil();
    private DataTable dt;
    private decimal grandTotal = 0;
    private decimal totalQty = 0;
    private static string TABLE_NAME_HEADER = "SO_ORDER";
    private static string TABLE_NAME_DETAIL = "SO_ITEM";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadDdlCustomer();
            InitializeDataTable();
            BindGrid();
        }
    }

    private void InitializeDataTable()
    {
        dt = new DataTable();
        dt.Columns.Add("ItemName", typeof(string));
        dt.Columns.Add("Qty", typeof(string));
        dt.Columns.Add("Price", typeof(string));
        dt.Columns.Add("Total", typeof(string));

        dt.Rows.Add("", "", "");
        ViewState["GridData"] = dt;
    }

    private void BindGrid()
    {
        dt = (DataTable)ViewState["GridData"];
        GridView1.DataSource = dt;
        GridView1.DataBind();
        grandTotal = 0;
        totalQty = 0;
    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.Rows[0];
        EnableRowEditing(row, true);

        // Sembunyikan tombol Add New
        LinkButton btnAddNew = (LinkButton)sender;
        btnAddNew.Visible = false;
        upGridTemp.Update();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Button btnSave = (Button)sender;
        int index = Convert.ToInt32(btnSave.CommandArgument);
        GridViewRow row = GridView1.Rows[index];

        // Ambil nilai dari kontrol TextBox
        TextBox txtItemName = (TextBox)row.FindControl("txtItemName");
        TextBox txtQty = (TextBox)row.FindControl("txtQty");
        TextBox txtPrice = (TextBox)row.FindControl("txtPrice");

        // Validasi input (opsional)
        if (string.IsNullOrWhiteSpace(txtItemName.Text))
        {
            MasterPage master = (MasterPage)this.Master;
            master.messageBox("Please Input Item Name!");
            return;
        }
        else if (string.IsNullOrWhiteSpace(txtQty.Text))
        {
            MasterPage master = (MasterPage)this.Master;
            master.messageBox("Please Input QTY!");
            return;
        }
        else if (string.IsNullOrWhiteSpace(txtPrice.Text))
        {
            MasterPage master = (MasterPage)this.Master;
            master.messageBox("Please Input Price!");
            return;
        }

        dt = (DataTable)ViewState["GridData"];
        dt.Rows[index]["ItemName"] = txtItemName.Text;
        dt.Rows[index]["Qty"] = txtQty.Text;
        dt.Rows[index]["Price"] = txtPrice.Text;

        dt.Rows.Add("", "", "");
        ViewState["GridData"] = dt;

        BindGrid();

        GridViewRow newRow = GridView1.Rows[index + 1];
        EnableRowEditing(newRow, true);

        btnSave.Visible = false;
    }
    private void EnableRowEditing(GridViewRow row, bool enable)
    {
        TextBox txtItemName = (TextBox)row.FindControl("txtItemName");
        TextBox txtQty = (TextBox)row.FindControl("txtQty");
        TextBox txtPrice = (TextBox)row.FindControl("txtPrice");
        Button btnSave = (Button)row.FindControl("btnSave");

        txtItemName.Enabled = enable;
        txtQty.Enabled = enable;
        txtPrice.Enabled = enable;
        btnSave.Visible = enable;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Transaction/SalesOrder.aspx");

    }

    protected void btnSaveall_Click(object sender, EventArgs e)
    {
        MasterPage master = (MasterPage)this.Master;
        if (tbSalesOrderNo.Text == "")
        {
            master.messageBox("Please Input Sales Order No !");
            return;
        }
        else if (tbOrderDate.Text == "")
        {
            master.messageBox("Please Input Order Date!");
            return;
        }
        else if (tbAddress.Text == "")
        {
            master.messageBox("Please Input Address!");
            return;
        }
        else if (GridView1.Rows.Count < 2)
        {
            master.messageBox("Please Input Item!");
            return;
        }
        SaveData();
        Response.Redirect("~/Transaction/SalesOrder.aspx");
    }

    private void SaveData()
    {
        MasterPage master = (MasterPage)this.Master;
        ExecSP _dal = null;
        Hashtable _ht = null;
        int newId;
        try
        {

            if (Request.Params["action"] == "add")
            {

                StringBuilder sql = new StringBuilder();
                sql.Append("INSERT INTO SO_ORDER ");
                sql.Append("VALUES (@p_order_no, @p_order_date, @p_customer_id, @p_addresss); ");
                sql.Append("SELECT CAST(SCOPE_IDENTITY() AS INT);");

                int orderId;
                using (SqlConnection conn = new SqlConnection(cMahlil.getConnStr("MyConnectionString")))
                {
                    using (SqlCommand cmd = new SqlCommand(sql.ToString(), conn))
                    {
                        cmd.Parameters.AddWithValue("@p_order_no", tbSalesOrderNo.Text);
                        cmd.Parameters.AddWithValue("@p_order_date", Shared.UItoDBDate(tbOrderDate.Text));
                        cmd.Parameters.AddWithValue("@p_customer_id", ddlCustomer.SelectedValue);
                        cmd.Parameters.AddWithValue("@p_addresss", tbAddress.Text);

                        conn.Open();
                        orderId = (int)cmd.ExecuteScalar();
                    }
                }


                foreach (GridViewRow gridRow in GridView1.Rows)
                {
                    TextBox txtQty = (TextBox)gridRow.FindControl("txtQty");
                    TextBox txtPrice = (TextBox)gridRow.FindControl("txtPrice");
                    TextBox txtItemName = (TextBox)gridRow.FindControl("txtItemName");
                    if (txtItemName.Text !="")
                    {
                        StringBuilder sql1 = new StringBuilder();
                        sql1.Append("insert into SO_ITEM values(@p_so_order_id,@p_item_name,@p_qty,@p_price)");
                        using (SqlConnection conn = new SqlConnection(cMahlil.getConnStr("MyConnectionString")))
                        {
                            using (SqlCommand cmd = new SqlCommand(sql1.ToString(), conn))
                            {
                                cmd.Parameters.AddWithValue("@p_so_order_id", orderId);
                                cmd.Parameters.AddWithValue("@p_item_name", txtItemName.Text);
                                cmd.Parameters.AddWithValue("@p_qty", txtQty.Text);
                                cmd.Parameters.AddWithValue("@p_price", txtPrice.Text);

                                conn.Open();
                                cmd.ExecuteScalar();
                            }
                        }
                    }
                    
                }

            }

        }
        catch (Exception ex)
        {
            master.messageBox(ex.Message);
        }

    }

    protected void CalculateTotal(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((TextBox)sender).NamingContainer;

        TextBox txtQty = (TextBox)row.FindControl("txtQty");
        TextBox txtPrice = (TextBox)row.FindControl("txtPrice");
        Label lTotal = (Label)row.FindControl("lTotal");

        decimal qty = 0, price = 0;
        if (decimal.TryParse(txtQty.Text, out qty) && decimal.TryParse(txtPrice.Text, out price))
        {
            decimal total = qty * price;
            lTotal.Text = total.ToString("#,0.00");
        }
        else
        {
            lTotal.Text = "0.00";
        }

        dt = (DataTable)ViewState["GridData"];
        int index = row.RowIndex;
        dt.Rows[index]["Qty"] = txtQty.Text;
        dt.Rows[index]["Price"] = txtPrice.Text;
        dt.Rows[index]["Total"] = lTotal.Text;

        ViewState["GridData"] = dt;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Ambil kontrol Total dan Qty untuk baris saat ini
            Label lblTotal = (Label)e.Row.FindControl("lTotal");
            TextBox lblQty = (TextBox)e.Row.FindControl("txtQty");

            decimal total = 0;
            decimal qty = 0;

            if (lblTotal != null && decimal.TryParse(lblTotal.Text, out total))
            {
                grandTotal += total;
            }

            if (lblQty != null && decimal.TryParse(lblQty.Text, out qty))
            {
                totalQty += qty;
            }
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            // Update Grand Total di Footer
            Label lblGrandTotal = (Label)e.Row.FindControl("lblGrandTotal");
            if (lblGrandTotal != null)
            {
                lblGrandTotal.Text = grandTotal.ToString("#,0.00");
            }

            // Update Total Qty di Footer
            Label lblTotalQty = (Label)e.Row.FindControl("lblTotalQty");
            if (lblTotalQty != null)
            {
                lblTotalQty.Text = totalQty.ToString("#,0");
            }
        }
    }
    protected void loadDdlCustomer()
    {
        sql.Length = 0;
        sql.Append("SELECT COM_CUSTOMER_ID AS value, CUSTOMER_NAME AS text FROM COM_CUSTOMER WITH(READPAST) ORDER BY COM_CUSTOMER_ID ");

        cMahlil.loadDdl(sql.ToString(), cMahlil.getConnStr("MyConnectionString"), ddlCustomer);
    }
}