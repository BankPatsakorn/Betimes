using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for RoomService
/// </summary>
public class RoomService
{
	public RoomService()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public string GetRoomCode()
    {
        string equipmentCode;
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        int Num1 = 0;
        SqlCommand cmd = new SqlCommand("Select  COUNT(ROOM_ID) from [dbo].[RMSM_MDM_ROOM_INFO]", con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Num1 = int.Parse(dr[0].ToString());
        }
        dr.Close();
        equipmentCode = "00" + (Num1 + 1).ToString();
        con.Close();
        return equipmentCode;
    }
    public void Insert(string ROOM_CODE, string ROOM_NAME, int ROOM_FLOOR, int ROOM_STATUS, int ROOM_CAPACITY_MIN, int ROOM_CAPACITY_MAX, DateTime CREATE_DATE)
    {
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("INSERT INTO  [dbo].[RMSM_MDM_ROOM_INFO] (ROOM_CODE,ROOM_NAME,ROOM_FLOOR,ROOM_STATUS,ROOM_CAPACITY_MIN,ROOM_CAPACITY_MAX,RECORD_STATUS,CREATE_DATE)");
                sql.AppendLine("VALUES (@roomCode,@roomName,@roomFloor,@roomStatus,@roomCapacityMin,@roomCapacityMax,'A',@crDate)");
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql.ToString();
                cmd.Parameters.Add("@roomCode", ROOM_CODE);
                cmd.Parameters.Add("@roomName", ROOM_NAME);
                cmd.Parameters.Add("@roomFloor", ROOM_FLOOR);
                cmd.Parameters.Add("@roomStatus", ROOM_STATUS);
                cmd.Parameters.Add("@roomCapacityMin", ROOM_CAPACITY_MIN);
                cmd.Parameters.Add("@roomCapacityMax", ROOM_CAPACITY_MAX);
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
    public void Update(int ROOM_ID, string ROOM_NAME, int ROOM_FLOOR, int ROOM_STATUS, int ROOM_CAPACITY_MIN, int ROOM_CAPACITY_MAX, DateTime CREATE_DATE)
    {
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("UPDATE  [dbo].[RMSM_MDM_ROOM_INFO]  SET ROOM_NAME =  @roomName ,ROOM_FLOOR = @roomFloor,ROOM_STATUS = @roomStatus ,ROOM_CAPACITY_MIN =  @roomCapacityMin, ");
                sql.AppendLine(" ROOM_CAPACITY_MAX = @roomCapacityMax");
                sql.AppendLine(" WHERE  ROOM_ID = @roomID");
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql.ToString();
                cmd.Parameters.Add("@roomID", ROOM_ID);
                cmd.Parameters.Add("@roomName", ROOM_NAME);
                cmd.Parameters.Add("@roomFloor", ROOM_FLOOR);
                cmd.Parameters.Add("@roomStatus", ROOM_STATUS);
                cmd.Parameters.Add("@roomCapacityMin", ROOM_CAPACITY_MIN);
                cmd.Parameters.Add("@roomCapacityMax", ROOM_CAPACITY_MAX);
               // cmd.Parameters.Add("@crDate", CREATE_DATE);
              //  cmd.Parameters.Add("@crDate", CREATE_DATE);

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