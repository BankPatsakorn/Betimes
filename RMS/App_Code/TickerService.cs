using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for TickerService
/// </summary>
public class TickerService
{
	public TickerService()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void Insert(string TEXT_DESC, int TEXT_STATUS, int TEXT_SPEED, int TEXT_SIZE, DateTime CREATE_DATE)
    {
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("INSERT INTO  [dbo].[RMSM_MDM_TEXT_TICKER_INFO] (TEXT_DESC,TEXT_STATUS,TEXT_SPEED,FONT_SIZE,RECORD_STATUS,CREATE_DATE)");
                sql.AppendLine("VALUES (@textDesc,@textStatus,@textSpeed,@textSize,'A',@crDate)");
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql.ToString();
                cmd.Parameters.Add("@textDesc", TEXT_DESC);
                cmd.Parameters.Add("@textStatus", TEXT_STATUS);
                cmd.Parameters.Add("@textSpeed", TEXT_SPEED);
                cmd.Parameters.Add("@textSize", TEXT_SIZE);
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
    public void Update(string TEXT_TICKER_ID, string TEXT_DESC, int TEXT_STATUS, int TEXT_SPEED, int TEXT_SIZE, DateTime CREATE_DATE)
    {
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("UPDATE [dbo].[RMSM_MDM_TEXT_TICKER_INFO]  SET TEXT_DESC = @textDesc,");
                sql.AppendLine(" TEXT_STATUS =  @textStatus, TEXT_SPEED = @textSpeed, FONT_SIZE = @textSize");
                sql.AppendLine(" WHERE TEXT_TICKER_ID = @textTickerID");
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql.ToString();
                cmd.Parameters.Add("@textTickerID", TEXT_TICKER_ID);
                cmd.Parameters.Add("@textDesc", TEXT_DESC);
                cmd.Parameters.Add("@textStatus", TEXT_STATUS);
                cmd.Parameters.Add("@textSpeed", TEXT_SPEED);
                cmd.Parameters.Add("@textSize", TEXT_SIZE);
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
}