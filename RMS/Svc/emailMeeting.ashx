<%@ WebHandler Language="C#" Class="emailMeeting" %>

using System;
using System.Web;
using System.Net.Mail;
using System.Data;
public class emailMeeting : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        
        //FnSendMails();
        try
        {
            FnSendMail();
            context.Response.ContentType = "text/plain";
            context.Response.Write("ส่ง Email ถึงผู้เข้าร่วมประชุมแล้ว");
        }
        catch (Exception ex)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write(ex.Message + "\n\n" + ex.StackTrace);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

//    private void FnSendMail()
//    {
//        EasyMail ezMail = new EasyMail("0");
//        try
//        {
//            ezMail.MailFrom = "suphachai.l@betimes.biz";
//            ezMail.MailSubject = "Form Request : ";
//            ezMail.MailTo = "suphachai.l@betimes.biz";
//            ezMail.SMTPServer = System.Configuration.ConfigurationSettings.AppSettings["SMTPServer"].ToString();
//            ezMail.MailBody = @"First Name 
//==================================<br>
// register complete.";
//            //ezMail.MailFrom = "prapas.p@betimes.biz";
//            //ezMail.MailTo = "suwil.j@betimes.biz";
//            //ezMail.SMTPServer = "mail.truemail.co.th";

//            ezMail.SMTPPort = Convert.ToInt16(System.Configuration.ConfigurationManager.AppSettings["SMTPPort"]);
//            //ezMail.isHTML = true;
//            ezMail.Send();
//        }
//        catch (Exception ex)
//        {

//        }

//    }

//    private void FnSendMails()
//    {
//        EasyMail ezMail = new EasyMail("0");
//        DataSet dtsMain = new DataSet();
//        string strMain = "";
//        mainClass cls = new mainClass();
//        try
//        {
//            strMain = @"select MEETING_ID, MEETING_TITLE, PROVINCE_CODE, ORG_SEQ, WORK_GROUP_ID, 
//        MEETING_DATE, MEETING_NAME, MEETING_TYPE_ID, SEQ_NO, PER_SEQ, DEL_FLAG, STATUS, MEETING_NOTE_CENCEL, 
//        MEETING_ID_REF, PATH_FILE, USER_MEETING_ID, USER_CREATE, CREATE_DATE, USER_UPDATE, UPDATE_DATE, 
//        USER_DELETE, DELETE_DATE, ORG_STR_SEQ_BOOK, PER_OTH_SEQ_BOOK, USER_TYPE_BOOK, ORG_ID_BOOK, NUMBER_OF_PEOPLES,
//        case when USER_CREATE = '' then 'iconDels' else 'iconDelsDisable' end CSS_DEL
//        from TR_MEETING where DEL_FLAG = 'N' and MEETING_ID = 172";
//            dtsMain = cls.GetDataSet(strMain, "TR_MEETING");

//            if (dtsMain.Tables["TR_MEETING"].Rows.Count > 0)
//            {
//                ezMail.MailFrom = "suphachai.l@betimes.biz";
//                ezMail.MailSubject = dtsMain.Tables["TR_MEETING"].Rows[0]["MEETING_TITLE"].ToString();
//                ezMail.MailTo = "suphachai.l@betimes.biz";
//                ezMail.SMTPServer = System.Configuration.ConfigurationSettings.AppSettings["SMTPServer"].ToString();
//                ezMail.MailBody = @"เรียนท่านผู้ดูแลระบบ";
////ห้องประชุม  : " + ddlRoom.SelectedItem.Text + @"
////วันที่เริ่ม: " + txtPERIOD_START_DATE.Value + @" เวลา : " + ddlPERIOD_START_HOUR.SelectedItem.Text + "." + ddlPERIOD_START_MINUTE.SelectedItem.Text + @"		
////วันที่สิ้นสุด: " + txtPERIOD_END_DATE.Value + @" เวลา : " + ddlPERIOD_END_HOUR.SelectedItem.Text + "." + ddlPERIOD_END_MINUTE.SelectedItem.Text + @"
////ตรวจสอบรายการจองห้องประชุมได้ที่ : ""
////";
//                //ezMail.MailFrom = "prapas.p@betimes.biz";
//                //ezMail.MailTo = "suwil.j@betimes.biz";
//                //ezMail.SMTPServer = "mail.truemail.co.th";

//                ezMail.SMTPPort = Convert.ToInt16(System.Configuration.ConfigurationManager.AppSettings["SMTPPort"]);
//                ezMail.isHTML = true;
//                ezMail.Send();
//            }
//        }
//        catch (Exception ex)
//        {

//        }

//    }


    private void FnSendMail()
    {
        EasyMail.FNC_SEND_EMAIL("chanin.sic@gmail.com", "Test Email emeeting pat", @"เรียนท่านผู้ดูแลระบบ
                ห้องประชุม  : aaaaaaaa
                วันที่เริ่ม:aaaaaaa เวลา : aaaaaaa	
                วันที่สิ้นสุด: aaaaaa เวลา : aaaaaaaaa
                ตรวจสอบรายการจองห้องประชุมได้ที่ : """, "");
        //MainClass Cls =  new MainClass();

       // EasyMail ezMail = new EasyMail();
        //DataSet dtsMain = new DataSet();
        //string strMain = "";
        //mainClass cls = new mainClass();
       
//        try
//        {
//             strMain = @"select MEETING_ID, MEETING_TITLE, PROVINCE_CODE, ORG_SEQ, WORK_GROUP_ID, 
//                MEETING_DATE, MEETING_NAME, MEETING_TYPE_ID, SEQ_NO, PER_SEQ, DEL_FLAG, STATUS, MEETING_NOTE_CENCEL, 
//                MEETING_ID_REF, PATH_FILE, USER_MEETING_ID, USER_CREATE, CREATE_DATE, USER_UPDATE, UPDATE_DATE, 
//                USER_DELETE, DELETE_DATE, ORG_STR_SEQ_BOOK, PER_OTH_SEQ_BOOK, USER_TYPE_BOOK, ORG_ID_BOOK, NUMBER_OF_PEOPLES,
//                case when USER_CREATE = '' then 'iconDels' else 'iconDelsDisable' end CSS_DEL
//                from TR_MEETING where DEL_FLAG = 'N' and MEETING_ID = 172";
//            dtsMain = cls.GetDataSet(strMain, "TR_MEETING");

//            if (dtsMain.Tables["TR_MEETING"].Rows.Count > 0)
//            {
//                //ezMail.MailFrom = StrMailForm;
//                //ezMail.MailSubject = StrMailSubject;
//                EasyMail.FNC_SEND_EMAIL("chanin.sic@gmail.com", dtsMain.Tables["TR_MEETING"].Rows[0]["MEETING_TITLE"].ToString(), @"เรียนท่านผู้ดูแลระบบ
//                ห้องประชุม  : aaaaaaaa
//                วันที่เริ่ม:aaaaaaa เวลา : aaaaaaa	
//                วันที่สิ้นสุด: aaaaaa เวลา : aaaaaaaaa
//                ตรวจสอบรายการจองห้องประชุมได้ที่ : """, "");

//            }
//        }
//        catch (Exception ex)
//        {

//        }

    }
    
    private void SendMail()
    {
        string _send_to = "suphachai.l@betimes.biz";// System.Configuration.ConfigurationSettings.AppSettings["from"];
        MailMessage Msg = new MailMessage();
        Msg.To.Add(_send_to);
        Msg.From = new MailAddress("suphachai.l@betimes.biz");
        Msg.IsBodyHtml = true;
        Msg.Subject = "test";
        Msg.Body = @"First Name :11111<br>
Last Name :2222<br>
Location : 3333<br>
Phone Number : 444<br>
Email :555<br>
==================================<br>
 register complete.";
        //smtp.Send(Msg);
        //smtp.Send(Msg);
        //MailMessage message =new MailMessage(
        SmtpClient client = new SmtpClient("localhost");
        client.Credentials = new System.Net.NetworkCredential("suphachai.l@betimes.biz", "P@ssw0rdCha3w4");
        //client.EnableSsl = false;

        //SmtpClient SmtpMail = new SmtpClient(mSMTPServer, mSMTPPort);
        //SmtpMail.Credentials = new NetworkCredential(mSMTPUsername, mSMTPPassword);
        //SmtpMail.EnableSsl = mSMTPSSL;

        try
        {
            client.Send(Msg);
        }
        catch (Exception ex)
        {
            Console.WriteLine("Exception caught in CreateMessageWithAttachment(): {0}",
                  ex.ToString());
        }
    }

}