using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
public partial class edytujprofil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ProcessUpload(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "size", "top.$get(\"" + uploadResult.ClientID + "\").innerHTML = 'Uploaded size: " + AsyncFileUpload1.FileBytes.Length.ToString() + "';", true);
        string fileName = Server.MapPath("./") + "photos\\" + Session["username"] + "image.jpg";
        AsyncFileUpload1.FileName.ToString();
        AsyncFileUpload1.SaveAs(fileName);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "image", "top.$get(\"photo\").src = 'photos/" + Session["username"] + "image.jpg" + "';", true);
        //  ScriptManager.RegisterClientScriptBlock(AsyncFileUpload1, AsyncFileUpload1.GetType(), "img",
        //      "top.document.getElementById('photos').src='"+fileName+"';",
        //      true);
    }
    protected string Sub(string str)
    {
        return (str.Length > 0) ? str.Substring(0, 10) : "";

    }

    protected void DetailsView1_PageIndexChanging(object sender, System.Web.UI.WebControls.DetailsViewPageEventArgs e)
    {

    }
}