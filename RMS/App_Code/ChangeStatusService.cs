using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for ChangeStatusService
/// </summary>
public class ChangeStatusService
{
	public ChangeStatusService()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void Insert(int CHANGE_STATUS, int ROOM_ID, DateTime CHANGE_START_DATE, DateTime CHANGE_END_DATE, DateTime CREATE_DATE)
    {
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("INSERT INTO  [dbo].[RMSM_MDM_CHANGE_STATUS_INFO] (CHANGE_STATUS,ROOM_ID,CHANGE_START_DATE,CHANGE_END_DATE,RECORD_STATUS,CREATE_DATE)");
                sql.AppendLine("VALUES (@changeStatus,@roomID,@changeStartDate,@changeEndDate,'A',@crDate)");
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql.ToString();
                cmd.Parameters.Add("@changeStatus", CHANGE_STATUS);
                cmd.Parameters.Add("@roomID", ROOM_ID);
                cmd.Parameters.Add("@changeStartDate", CHANGE_START_DATE);
                cmd.Parameters.Add("@changeEndDate", CHANGE_END_DATE);
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
    public void Update(int CHANGE_STATUS_ID, int CHANGE_STATUS, int ROOM_ID, DateTime CHANGE_START_DATE, DateTime CHANGE_END_DATE, DateTime CREATE_DATE)
    {
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("UPDATE [dbo].[RMSM_MDM_CHANGE_STATUS_INFO]  SET CHANGE_STATUS = @changeStatus,");
                sql.AppendLine(" ROOM_ID =  @roomID, CHANGE_START_DATE = @changeStartDate, CHANGE_END_DATE = @changeEndDate");
                sql.AppendLine(" WHERE CHANGE_STATUS_ID = @changeStatusID");
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql.ToString();
                cmd.Parameters.Add("@changeStatusID", CHANGE_STATUS_ID);
                cmd.Parameters.Add("@changeStatus", CHANGE_STATUS);
                cmd.Parameters.Add("@roomID", ROOM_ID);
                cmd.Parameters.Add("@changeStartDate", CHANGE_START_DATE);
                cmd.Parameters.Add("@changeEndDate", CHANGE_END_DATE);
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
}