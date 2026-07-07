using System;
using System.Collections.Generic;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using System.Security.Cryptography;

using Altius.BusinessAccessLayer.BALDataAccess;

public partial class ChangePassword : System.Web.UI.Page
{
    BALDataAccess objdata = new BALDataAccess();
    TransactionNoGenerate CommonClass_Function = new TransactionNoGenerate();
    string SessionCcode;
    string SessionLcode;
    string SessionUserID;
    string SessionUserName;
    string SessionEnquiryNo;
    string SessionFinYearCode;
    string SessionFinYearVal;

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "ERP Stores Module :: Change Password";
        if (Session["UserId"] == null)
        {
            Response.Redirect("../Default.aspx");
            Response.Write("Your session expired");
        }
        SessionCcode = Session["Ccode"].ToString();
        SessionLcode = Session["Lcode"].ToString();
        SessionUserName = Session["Usernmdisplay"].ToString();
        SessionUserID = Session["UserId"].ToString();
        SessionFinYearCode = Session["FinYearCode"].ToString();
        SessionFinYearVal = Session["FinYear"].ToString();
        if (!IsPostBack)
        {
            
            HtmlGenericControl li = (HtmlGenericControl)(Page.Master.FindControl("Link_Purchase"));
            li.Attributes.Add("class", "droplink active open");
        }

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string New_Password = s_hex_md5(txtNewPassword.Text);
        string Conform_Password = s_hex_md5(txtConformPassword.Text);
        bool Error = false;
        string query = "";
        DataTable DT = new DataTable();

        query = "select NewPassword from MstUser_Register where UserID='" + SessionUserID + "' And Ccode='" + SessionCcode + "' And Lcode='" + SessionLcode + "'";
        DT = objdata.RptEmployeeMultipleDetails(query);
        
        string Old_Password=DT.Rows[0]["NewPassword"].ToString();

        if (Old_Password != New_Password)
        {
            Error = false;

        }
        else
        {
            Error = true;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "SaveMsgAlert('Old Password and New Password are Same..');", true);
        }


        if (!Error)
        {
            if (New_Password == Conform_Password)
            {

                Error = false;

            }
            else
            {
                Error = true;
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "SaveMsgAlert('Check with Conform Password..');", true);
            }
        }

        if (!Error)
        {

            query = "update MstUser_Register set NewPassword='" + New_Password + "',ConformPassword='" + Conform_Password + "' where UserID='" + SessionUserID + "' And Ccode='" + SessionCcode + "' And Lcode='" + SessionLcode + "'";
            objdata.RptEmployeeMultipleDetails(query);

            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "SaveMsgAlert('Password Changed Successfully..');", true);
        }

        if (!Error)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "SaveMsgAlert('Password Changed Successfully..');", true);
        }

    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtNewPassword.Text = "";
        txtConformPassword.Text = "";
    }

    public static String s_hex_md5(String originalPassword)
    {
        UTF8Encoding encoder = new UTF8Encoding();
        MD5 md5 = new MD5CryptoServiceProvider();

        Byte[] hashedbytes = md5.ComputeHash(encoder.GetBytes(originalPassword));
        return BitConverter.ToString(hashedbytes).Replace("-", "").ToLower();
    }
}
