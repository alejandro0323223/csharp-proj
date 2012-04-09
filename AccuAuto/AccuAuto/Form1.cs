﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Web.Script.Serialization;
using System.Data.EntityClient;


namespace AccuAuto
{
    public partial class Form1 : Form
    {
        private ClassClient client = new ClassClient();
        private QFWinData_Entities db;
        private string connString = @"metadata=res://*/ModelEData.csdl|res://*/ModelEData.ssdl|res://*/ModelEData.msl; provider=System.Data.SqlClient; provider connection string="" Data Source={0}; Initial Catalog={1}; Persist Security Info=True; User ID={2}; Password={3}; MultipleActiveResultSets=True""";
        public Form1()
        {
            InitializeComponent();
            lblFile.Text = "";
            lblGroup.Text = "";
            lblCounter.Text = "";
            client.add("asfd", 34);
        }

        private void updGroup(string strText, int intCounter)
        {
            lblGroup.Text = strText;
            lblCounter.Text  = intCounter.ToString();
            lblFile.Text = "";
            this.Refresh();
            System.Threading.Thread.Sleep(1000);            
        }

        private void updFile(string strText)
        {
            try
            {
                lblCounter.Text = (Convert.ToInt32(lblCounter.Text) - 1).ToString();
                lblCounter.Refresh();
            }
            catch { }
            lblFile.Text = strText;
            lblFile.Refresh(); 
        }
        
        private void btnImport_Click(object sender, EventArgs e)
        {
            Cursor.Current = Cursors.WaitCursor;
            connString = String.Format(connString,
                    txbServer.Text, txbDB.Text,
                    txbUser.Text, txbPassw.Text);

            var DirInfo = new System.IO.DirectoryInfo(txbDirectory.Text);
            if (DirInfo.Exists)
            {
                db = new QFWinData_Entities(connString);            
                DirInfo = new System.IO.DirectoryInfo(txbDirectory.Text + @"\Client");
                if (DirInfo.Exists)
                {                    
                    btnImport.Enabled = false;                    
                    
                    updGroup("Importing Clients", DirInfo.GetFiles().Length);
                    doClients(DirInfo);
                    DirInfo = new System.IO.DirectoryInfo(txbDirectory.Text + @"\Policy");
                    if (DirInfo.Exists)
                    {
                        DirInfo = new System.IO.DirectoryInfo(txbDirectory.Text + @"\Policy\PersAutoPolicy");
                        if (DirInfo.Exists)
                        {
                            updGroup("Importing PersAutoPolicy Policies", DirInfo.GetFiles().Length);
                            doPolicies(DirInfo, "AUTO");
                        }
                        DirInfo = new System.IO.DirectoryInfo(txbDirectory.Text + @"\Policy\BoatPolicy");
                        if (DirInfo.Exists)
                        {
                            updGroup("Importing PersAutoPolicy Policies", DirInfo.GetFiles().Length);
                            doPolicies(DirInfo, "BOAT");
                        }
                    }

                    updGroup("  All Done! ", 0);                    
                }
            }
            else
            {
                MessageBox.Show("Directory not found: " + txbDirectory.Text);
            }
            Cursor.Current = Cursors.Default;
        }

        private void doClients(System.IO.DirectoryInfo migrationDir)
        {                        
            var files = migrationDir.GetFiles();
            DateTime myDM = DateTime.Now;
            foreach (var file in files)
            {
                updFile(file.Name);
                try
                {
                    using (var t = new StreamReader(file.FullName))
                    {                    
                        var bits = t.ReadToEnd();
                        dynamic json = JsonHelper.Decode(bits);
                        CLNMA item = new CLNMA()
                        {
                            UNIQUE = "AccuAuto",
                            DateMigrated = myDM,
                            CompanyName = json.DisplayName,
                            LNAME = json.Name.LastName,
                            FNAME = json.Name.FirstName,
                            MiddleName = json.Name.MiddleName,                            
                            SOURCE = json.Source,
                            CSTATUS = (json.ClientStatus == "Prospect") ? "P" : "A",                        
                        };
                        try
                        {
                            item.DOB = json.BirthDate.Substring(0, 10);
                        }
                        catch { }
                        try
                        {
                            item.ADDRESS1 = json.Addresses[0].Line1;
                            item.CITY = json.Addresses[0].City;
                            item.STATE = json.Addresses[0].State;
                            item.ZIP = json.Addresses[0].Zip;
                        }                              
                        catch { }

                        db.CLNMAS.AddObject(item);
                        db.SaveChanges();
                        client.add(file.Name, item.Client_ID);
                    }
                }
                catch { }
            }
        }

        private void doPolicies(System.IO.DirectoryInfo migrationDir, string lob)
        {           
            var files = migrationDir.GetFiles();
            foreach (var file in files)
            {
                updFile(file.Name);
                try
                {
                    using (var t = new StreamReader(file.FullName))
                    {
                        var bits = t.ReadToEnd();
                        dynamic json = JsonHelper.Decode(bits);
                        int clientID = client.getID(json.NamedInsured.Id + ".json");
                        if (clientID > 0)
                        {
                            POLMA item = new POLMA()
                            {
                                CLIENT_ID = clientID,
                                POLICY_NUM = json.PolicyNumber,
                                LOB = lob
                            };
                            db.POLMAS.AddObject(item);
                            db.SaveChanges();
                        }
                    }
                }
                catch { }
            }
        }
    }
}
