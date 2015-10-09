using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for ServiceInfoService
/// </summary>
public class ServiceInfoService
{
	public ServiceInfoService()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public string GetServiceCode()
    {
        string equipmentCode;
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        int Num1 = 0;
        SqlCommand cmd = new SqlCommand("Select  MAX(SERVICE_ID) from [dbo].[RMSM_MDM_SERVICE_INFO]", con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Num1 = int.Parse(dr[0].ToString());
        }
        dr.Close();
        equipmentCode = "SV00" + (Num1 + 1).ToString();
        con.Close();
        return equipmentCode;
    }
    public void Insert(string SERVICE_CODE, string SERVICE_NAME, int COUNT_UNIT_ID, DateTime CREATE_DATE)
    {
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("INSERT INTO [dbo].[RMSM_MDM_SERVICE_INFO] (SERVICE_CODE,SERVICE_NAME,COUNT_UNIT_ID,RECORD_STATUS,CREATE_DATE)");
                sql.AppendLine("VALUES (@serviceCode,@serviceName,@countUnitID,'A',@crDate)");
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql.ToString();
                cmd.Parameters.Add("@serviceCode", SERVICE_CODE);
                cmd.Parameters.Add("@serviceName", SERVICE_NAME);
                cmd.Parameters.Add("@countUnitID", COUNT_UNIT_ID);
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
    public void Update(string SERVICE_CODE, string SERVICE_NAME, int COUNT_UNIT_ID, DateTime CREATE_DATE)
    {
        using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("UPDATE [dbo].[RMSM_MDM_SERVICE_INFO]  SET SERVICE_NAME =  @serviceName ,COUNT_UNIT_ID = @countUnitID");
                sql.AppendLine(" WHERE  SERVICE_CODE = @serviceCode");
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql.ToString();
                cmd.Parameters.Add("@serviceCode", SERVICE_CODE);
                cmd.Parameters.Add("@serviceName", SERVICE_NAME);
                cmd.Parameters.Add("@countUnitID", COUNT_UNIT_ID);
                //cmd.Parameters.Add("@crDate", CREATE_DATE);

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