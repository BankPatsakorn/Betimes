using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for PopUpService
/// </summary>
public class PopUpService
{
	public PopUpService()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //public string GetPopUpCode()
    //{
    //    string equipmentCode;
    //    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
    //    int Num1 = 0;
    //    SqlCommand cmd = new SqlCommand("Select  MAX(SERVICE_ID) from [dbo].[RMSM_MDM_SERVICE_INFO]", con);
    //    con.Open();
    //    SqlDataReader dr = cmd.ExecuteReader();
    //    while (dr.Read())
    //    {
    //        Num1 = int.Parse(dr[0].ToString());
    //    }
    //    dr.Close();
    //    equipmentCode = "SV00" + (Num1 + 1).ToString();
    //    con.Close();
    //    return equipmentCode;
    //}
    public void Insert(string POPUP_NAME, string POPUP_MESSAGE, int ROOM_ID, int MENU_ID, int POPUP_STATUS, int FONT_SIZE, DateTime CREATE_DATE)
    {
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("INSERT INTO [dbo].[RMSM_MDM_POPUP_INFO] (POPUP_NAME,POPUP_MESSAGE,ROOM_ID,MENU_ID,POPUP_STATUS,FONT_SIZE,RECORD_STATUS,CREATE_DATE)");
                sql.AppendLine("VALUES (@popupName,@popupMessage,@roomID,@menuID,@popupStatus,@fontsize,'A',@crDate)");
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql.ToString();
                cmd.Parameters.Add("@popupName", POPUP_NAME);
                cmd.Parameters.Add("@popupMessage", POPUP_MESSAGE);
                cmd.Parameters.Add("@roomID", ROOM_ID);
                cmd.Parameters.Add("@menuID", MENU_ID);
                cmd.Parameters.Add("@popupStatus", POPUP_STATUS);
                cmd.Parameters.Add("@fontsize", FONT_SIZE);
                cmd.Parameters.Add("@crDate", CREATE_DATE);

                try
                {
                    connection.Open();
                    int recordsAffected = cmd.ExecuteNonQuery();
                }
                catch (SqlException)
                {

                }
                finally
                {
                    connection.Close();
                }
            }
        }
    }
    public void Update(string POPUP_ID, string POPUP_NAME, string POPUP_MESSAGE, int ROOM_ID, int MENU_ID, int POPUP_STATUS, int FONT_SIZE, DateTime CREATE_DATE)
    {
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("UPDATE [dbo].[RMSM_MDM_POPUP_INFO]  SET POPUP_NAME =  @popupName ,POPUP_MESSAGE = @popupMessage, ROOM_ID = @roomID,");
                sql.AppendLine("MENU_ID =  @menuID, POPUP_STATUS = @popupStatus, FONT_SIZE = @fontsize");
                sql.AppendLine(" WHERE POPUP_ID = @popupID");
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql.ToString();
                cmd.Parameters.Add("@popupID", POPUP_ID);
                cmd.Parameters.Add("@popupName", POPUP_NAME);
                cmd.Parameters.Add("@popupMessage", POPUP_MESSAGE);
                cmd.Parameters.Add("@roomID", ROOM_ID);
                cmd.Parameters.Add("@menuID", MENU_ID);
                cmd.Parameters.Add("@popupStatus", POPUP_STATUS);
                cmd.Parameters.Add("@fontsize", FONT_SIZE);
               // cmd.Parameters.Add("@crDate", CREATE_DATE);

                try
                {
                    connection.Open();
                    int recordsAffected = cmd.ExecuteNonQuery();
                }
                catch (SqlException)
                {

                }
                finally
                {
                    connection.Close();
                }
            }
        }
    }
    public DataSet Select()
    {
        DataSet ds1 = new DataSet();
        using (SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            StringBuilder sql = new StringBuilder();

            sql.AppendLine(" SELECT [POPUP_ID], [POPUP_NAME], ");
            sql.AppendLine(" [POPUP_MESSAGE], [dbo].[RMSM_MDM_ROOM_INFO].[ROOM_NAME] as MEETING_ROOM_NAME, ");
            sql.AppendLine(" [dbo].[RMSM_MDM_MENU_INFO].[MENU_NAME], case when [dbo].[RMSM_MDM_POPUP_INFO].[POPUP_STATUS]=0 then 'ใช้งาน' when [dbo].[RMSM_MDM_POPUP_INFO].[POPUP_STATUS]=1 then 'ไม่ใช้งาน' end as POPUP_STATUS");
            sql.AppendLine(" FROM [RMSM_MDM_POPUP_INFO] ");
            sql.AppendLine(" LEFT JOIN [dbo].[RMSM_MDM_MENU_INFO] on ");
            sql.AppendLine(" [dbo].[RMSM_MDM_POPUP_INFO].[MENU_ID] = [dbo].[RMSM_MDM_MENU_INFO].[MENU_ID] ");
            sql.AppendLine(" LEFT JOIN [dbo].[RMSM_MDM_ROOM_INFO] on ");
            sql.AppendLine(" [dbo].[RMSM_MDM_POPUP_INFO].[ROOM_ID] = [dbo].[RMSM_MDM_ROOM_INFO].[ROOM_ID] ");
            sql.AppendLine(" WHERE ");
            sql.AppendLine(" [dbo].[RMSM_MDM_POPUP_INFO].[RECORD_STATUS] = 'A' ");
            using (SqlDataAdapter da = new SqlDataAdapter(sql.ToString(), cn))
            {
                da.Fill(ds1, "[dbo].[RMSM_MDM_POPUP_INFO]");
            }
            return ds1;
        }

    }
    public DataSet Search(string POPUP_NAME, string POPUP_MESSAGE)
    {
        DataSet ds1 = new DataSet();
        using (SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            StringBuilder sql = new StringBuilder();
 
            sql.AppendLine(" SELECT [POPUP_ID], [POPUP_NAME], ");
            sql.AppendLine(" [POPUP_MESSAGE], [dbo].[RMSM_MDM_ROOM_INFO].[ROOM_NAME] as MEETING_ROOM_NAME, ");
            sql.AppendLine(" [dbo].[RMSM_MDM_MENU_INFO].[MENU_NAME], case when [dbo].[RMSM_MDM_POPUP_INFO].[POPUP_STATUS]=0 then 'ใช้งาน' when [dbo].[RMSM_MDM_POPUP_INFO].[POPUP_STATUS]=1 then 'ไม่ใช้งาน' end as POPUP_STATUS");
            sql.AppendLine(" FROM [RMSM_MDM_POPUP_INFO] ");
            sql.AppendLine(" LEFT JOIN [dbo].[RMSM_MDM_MENU_INFO] on ");
            sql.AppendLine(" [dbo].[RMSM_MDM_POPUP_INFO].[MENU_ID] = [dbo].[RMSM_MDM_MENU_INFO].[MENU_ID] ");
            sql.AppendLine(" LEFT JOIN [dbo].[RMSM_MDM_ROOM_INFO] on ");
            sql.AppendLine(" [dbo].[RMSM_MDM_POPUP_INFO].[ROOM_ID] = [dbo].[RMSM_MDM_ROOM_INFO].[ROOM_ID] ");
            sql.AppendLine(" WHERE 1=1");
            sql.AppendLine(" AND ");
            sql.AppendLine(" [dbo].[RMSM_MDM_POPUP_INFO].[RECORD_STATUS] = 'A' ");
            sql.AppendLine(" AND ");
            sql.AppendLine(" POPUP_NAME LIKE '%'+@popUpName+'%'");
            sql.AppendLine(" AND ");
            sql.AppendLine(" POPUP_MESSAGE LIKE '%'+@popUpMessage+'%'");
            using (SqlDataAdapter da = new SqlDataAdapter(sql.ToString(), cn))
            {
                da.SelectCommand.Parameters.AddWithValue("@popUpName", POPUP_NAME);
                da.SelectCommand.Parameters.AddWithValue("@popUpMessage", POPUP_MESSAGE);
                da.Fill(ds1, "[dbo].[RMSM_MDM_POPUP_INFO]");
            }
            return ds1;
        }

    }
    public DataSet Delete(int POPUP_ID)
    {
        DataSet ds1 = new DataSet();
        using (SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            StringBuilder sql = new StringBuilder();
            sql.AppendLine(" DELETE ");
            sql.AppendLine(" FROM [RMSM_MDM_POPUP_INFO] ");
            sql.AppendLine(" WHERE POPUP_ID = @popupID");
            using (SqlDataAdapter da = new SqlDataAdapter(sql.ToString(), cn))
            {
                da.SelectCommand.Parameters.AddWithValue("@popupID", POPUP_ID);
                da.Fill(ds1, "[dbo].[RMSM_MDM_POPUP_INFO]");
            }
            return ds1;
        }

    }
}