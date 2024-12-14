using System;
using System.IO;
using System.Data;
using System.Data.OleDb;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using App.DataAccessLayer;
using System.Configuration;

/// <summary>
/// Summary description for Shared
/// </summary>
public class Shared
{
	public Shared()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void showError(Panel pError, Label lError, string errorMessage)
    {
        lError.Text = errorMessage;
        pError.Visible = true;
    }
    private static HorizontalAlign ConvertToHorizontalAlignEnum(string s)
    {
        if (s.Equals("Left"))
            return HorizontalAlign.Left;
        else if (s.Equals("Right"))
            return HorizontalAlign.Right;
        else
            return HorizontalAlign.Center;
    }
        
    private static DataTable ExecRawSP(string SPName, Hashtable _ht)
    {
        ExecSP _dal = null;

        try
        {
            _dal = new ExecSP();

            return _dal.GetRows("", SPName, _ht);
        }
        catch (Exception ex)
        {
            return null; ;
        }
    }

    public static void ShowErrorDialog(Page p, Exception ex)
    {
        ScriptManager.RegisterStartupScript(p, p.GetType(), "fx", "fnShowErrorNotif('" + Shared.DefaultErrorMessage + "', '" + Shared.MakeSingleLine(ex) + "');", true);
    }

    public static string DefaultErrorMessage
    {
        get { return "This is strange! Something is not right with the system. Please check the error message below."; }
    }

    public static string MakeSingleLine(Exception ex)
    {
        string err = "";
        Exception exx = ex;

        while (exx != null)
        {
            err += exx.Message + " - ";
            exx = exx.InnerException;
        }

        return err.Replace("'", "").Replace("\n", "").Replace("\r", "");
    }

    public static string UItoDBchb(CheckBox chb)
    {
        if (chb.Checked == true)
            return "1";
        else
            return "0";
    }

    public static bool DBtoUIchb(string value)
    {
        if (value == "1")
            return true;

        else if (value == "True")
            return true;

        else 
            return false;
    }
    
    public static string UItoDBDate(string date)
    {
        try
        {
            String[] LblStartDate = date.Split('-');
            String StartDate = LblStartDate[2] + "-" + LblStartDate[1] + "-" + LblStartDate[0];
            return StartDate;
        }
        catch
        {
            return "1990-01-01";
        }
    }

    public static string DBtoUIDate(string date)
    {
        try
        {
            if (DateTime.Parse(date).ToString("dd-MM-yyyy") == "01-01-1990")
                return "";
            else
                return DateTime.Parse(date).ToString("dd-MM-yyyy");
        }
        catch
        {
            return "";
        }
    }

    public static string Getdate(string month,string year)
    {
        string date = "";

        date = year + "-" + month + "-01";
        return date;
    }
}