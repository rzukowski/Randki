﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wyslijwiadomosc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Wyslij(object sender, EventArgs e)
    {
        String touserid = Request.QueryString["userid"];
        String userid = Session["userid"].ToString();
        if (Usr.SendMssg(userid, touserid, txtMessage.Text))
            lbl.Text = "Wiadomość wysłana";
        else
            lbl.Text = "Błąd wysyłania wiadomości";
    }
}